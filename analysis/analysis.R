library(data.table) #for data processing
library(dplyr) #for creating aggregate/summary table
library(ggplot2)
library(gridExtra) #To plot several plot together
library(MatchIt)

df <- fread("../data/df.csv")

#assuming the online introduction is introduced at week 90 (thus, we wont see any purchase online = 1 before that)
cutoff = 90


df.sumstat = df %>%
  filter(week_nr < cutoff) %>%
  group_by (cust) %>%
  summarise(first.w = min(week_nr),
            monetary = mean(spend),
            visits = n(),
            postal = max(postal),
            volume = sum(volume),
            deals = mean(nr_product_deal/volume),
            diapers = sum(diapers, na.rm = T)
  ) %>%
  mutate(frequency = visits/52#(cutoff-first.w)
  )

df.sumstat$distclose = ifelse(
  df.sumstat$postal %in% c(10000),1,ifelse(is.na(df.sumstat$postal),NA,0))

sumstat = t(df.sumstat %>% 
              summarise (
                Frequency = c(mean(frequency), sd(frequency)),
                Monetary = c(mean(monetary), sd(monetary)),
                Distant = c(mean(distclose, na.rm = T), sd(distclose, na.rm = T)),
                Volume = c(mean(volume), sd(volume)),
                Deals = c(mean(deals*100), sd(deals*100)),
                Diaper = c(mean(diapers), sd(diapers)),
                N = n()
              ))

#Assign Treatment group
  df$cust = as.factor(factor(df$cust))
  df.treatment = df %>% group_by(cust) %>% summarise (treatment = max(online))
  sum(df.treatment$treatment)
  #147
  df = merge(df, df.treatment, by = "cust", all.X = T)
  #replace NA with 0


## First, parallel trend
df.trend <- df %>% group_by(week_nr, treatment) %>%
  summarize_at(
    c("spend", 
      "plannedspend",  
      "bulkyspend",
      "sensoryspend",
      "volume",
      "plannedvol",  
      "bulkyvol",
      "sensoryvol"
    ), "sum", na.rm = TRUE)
##provide levels
df.trend$treatment <- as.factor(
  ifelse(df.trend$treatment == 1, "Treat", "Control"))
plot.trend = function(dv, dv.title){ 
  p = ggplot(df.trend, 
             aes(x=week_nr, 
                 y={{dv}}, 
                 group=treatment, 
                 colour=treatment)) +
    geom_line() + geom_vline(xintercept = cutoff) + 
    labs(
      x = "", y = "", title = dv.title, colour = "Group") + 
    theme(plot.title = element_text(size=12))
  return(p)
}

#This is sum
p.spend = plot.trend(
  dv = spend, 
  dv.title = "Expenditures")
p.plannedspend = plot.trend(
  dv = plannedspend, 
  dv.title = "Planned Products")
p.bulkyspend = plot.trend(
  dv = bulkyspend, 
  dv.title = "Bulky Products")
p.sensoryspend = plot.trend(
  dv = sensoryspend, 
  dv.title = "Sensory Products")
grid.arrange(p.spend, p.plannedspend, 
             p.bulkyspend, p.sensoryspend,
             nrow=2, ncol=2)
rm(list = c("p.bulkyspend", 
            "p.plannedspend", 
            "p.sensoryspend", 
            "p.spend"
))
##for robustness, use dv = volume; plannedvol; bulkyvol; sensoryvol




#Model free DID
#Add groups
df = df %>% mutate(
  long = case_when(
    week_nr >= 40 & week_nr < cutoff ~ "pre",
    week_nr >= cutoff & week_nr < 151 ~ "short",
    week_nr >= 200 & week_nr < 301 ~ "long"
  )
)
cols = c("plannedspend", 
         "bulkyspend", 
         "sensoryspend",
         "frequency",
         "monetary",
         "spend",
         "plannedvol", 
         "bulkyvol", 
         "sensoryvol",
         "volume")

df.week.control = df %>% 
  filter (treatment == 0) %>%
  group_by (long, cust) %>% 
  summarise(
    plannedspend = ifelse(is.na(sum(plannedspend)),0, sum(plannedspend)), 
    bulkyspend = ifelse(is.na(sum(bulkyspend)),0, sum(bulkyspend)),
    sensoryspend=  ifelse(is.na(sum(sensoryspend)),0, sum(sensoryspend)),
    monetary = mean(spend),
    spend = sum(spend),
    plannedvol = ifelse(is.na(sum(plannedvol)),0, sum(plannedvol)),
    bulkyvol = ifelse(is.na(sum(bulkyvol)),0, sum(bulkyvol)),
    sensoryvol = ifelse(is.na(sum(sensoryvol)),0, sum(sensoryvol)),
    volume = sum(volume),
    first.w = min(week_nr), 
    last.w = max(week_nr), 
    visits = n(),
    frequency = visits/52#(last.w-first.w) 
  ) 
df.week.control$cust = factor(df.week.control$cust)


df.week.treat = df %>% 
  filter(TRUE) %>% 
  filter (treatment == 1) %>%
  group_by (long, cust) %>% 
  summarise(
    plannedspend = ifelse(is.na(sum(plannedspend)),0, sum(plannedspend)), 
    bulkyspend = ifelse(is.na(sum(bulkyspend)),0, sum(bulkyspend)),
    sensoryspend=  ifelse(is.na(sum(sensoryspend)),0, sum(sensoryspend)),
    monetary = mean(spend),
    spend = sum(spend),
    plannedvol = ifelse(is.na(sum(plannedvol)),0, sum(plannedvol)),
    bulkyvol = ifelse(is.na(sum(bulkyvol)),0, sum(bulkyvol)),
    sensoryvol = ifelse(is.na(sum(sensoryvol)),0, sum(sensoryvol)),
    volume = sum(volume),
    first.w = min(week_nr), 
    last.w = max(week_nr), 
    visits = n(),
    frequency = visits/52#(last.w-first.w) 
  ) 

df.week.treat$cust = factor(df.week.treat$cust)

df.week = rbind(
  data.frame(df.week.control, treatment = 0),
  data.frame(df.week.treat, treatment = 1)
)


#PSM
{
  # observations the 52 weeks prior to online introduction
  
  df.before = df %>% filter(week_nr < cutoff & week_nr >= cutoff-52)
  # calculate all measures per customer
  df.before = df.before %>% 
    group_by (cust) %>% 
    summarise(last.w = max(week_nr), 
              first.w = min(week_nr), 
              monetary = mean(spend), 
              visits = n(), 
              postal = max(postal),
              volume = sum(volume), 
              dealproneness = mean(nr_product_deal/nr_product),
              deals = mean(nr_product_deal/volume),
              treatment = max(treatment),
              diapers = sum(diapers, na.rm = T),
              recency = cutoff - last.w, 
              frequency = visits/52#(cutoff-first.w)) #or cutoff-first.w
    )
  #Recode postal code
  #distclose is 1 if postal code < 3 km
  df.before$distclose = ifelse(
    df.before$postal %in% c(10000), 1, ifelse(is.na(df.before$postal), NA, 0))
  
  df.before.sub = select(df.before, 
                         treatment,
                         frequency,
                         monetary,
                         distclose,
                         diapers,
                         cust,
                         volume,
                         deals)
  df.before.sub <- data.frame(na.omit(df.before.sub))
  
  
  #PSM 
  df.matchit = matchit(
    treatment ~ monetary + frequency + diapers, 
    data = df.before.sub
  )
  
  df.matchit
  plot(df.matchit)
}

# create dataset with matched pairs, including first online date per matched pair
# and wid, to denote within-identifier
{
  cust.treated = data.frame(cust = df.before.sub[(row.names(df.matchit$match.matrix)),"cust"], treatment = "Treat")
  first_online = df %>% filter(online == 1) %>% group_by(cust) %>% summarise(first_online = min(week_nr))
  cust.treated = cust.treated %>% left_join(first_online, by = "cust")
  cust.control = data.frame(cust = df.before.sub[(df.matchit$match.matrix),"cust"],
                            treatment = "Control", first_online = cust.treated$first_online, wid = cust.treated$cust)
  
  #remove the discarded case:
  cust.treated$cust = factor(cust.treated$cust)
  cust.control = cust.control[!is.na(cust.control$cust),]
  cust.control$cust = factor(cust.control$cust)
  
}

df.matched = rbind(data.frame(cust.treated, wid = cust.treated$cust), cust.control)
df.matched = df.matched %>% 
  full_join(df, by = "cust") 

#periods based on first purchase (matched)
df.matched = df.matched %>% 
  filter(!is.na(treatment.x)) %>%
  mutate( 
    long = case_when(
      week_nr >= 40 & week_nr < cutoff ~ "pre",
      week_nr >= cutoff & week_nr < 151 ~ "short",
      week_nr >= 200 & week_nr < 301 ~ "long"
    ))
df.matched = df.matched[!is.na(df.matched$long),]

## New visual inspection of parallel trend
df.trend <- df.matched %>% group_by(week_nr, treatment.y) %>%
  summarize_at(
    c("spend", 
      "plannedspend",  
      "bulkyspend",
      "sensoryspend",
      "volume",
      "plannedvol",  
      "bulkyvol",
      "sensoryvol"
    ), "sum", na.rm = TRUE)
##provide levels
df.trend$treatment <- as.factor(
  ifelse(df.trend$treatment.y == 1, "Treat", "Control"))
p.spend = plot.trend(
  dv = spend, 
  dv.title = "Expenditures")
p.plannedspend = plot.trend(
  dv = plannedspend, 
  dv.title = "Planned Products")
p.bulkyspend = plot.trend(
  dv = bulkyspend, 
  dv.title = "Bulky Products")
p.sensoryspend = plot.trend(
  dv = sensoryspend, 
  dv.title = "Sensory Products")
grid.arrange(p.spend, p.plannedspend, 
             p.bulkyspend, p.sensoryspend,
             nrow=2, ncol=2)
rm(list = c("p.bulkyspend", 
            "p.plannedspend", 
            "p.sensoryspend", 
            "p.spend"
))

#regression tests
cols = c("plannedspend", "bulkyspend", "sensoryspend", "frequency", "monetary", "spend")

#Use swith for panels
df.long = df.matched %>% 
  filter(TRUE) %>% #PANEL A
  #filter (!(treatment.y == 1 & long != "pre" & online == 0)) %>% #PANEL B
  #filter (online == 0) %>% #PANEL C
  group_by (cust, long) %>% 
  summarise(last.w = max(week_nr), 
            first.w = min(week_nr), 
            monetary = mean(spend), 
            visits = n(), 
            postal = max(postal),
            volume = sum(volume), 
            deals = mean(nr_product_deal/volume),
            diapers = sum(diapers, na.rm = T),
            wid = first(wid),
            treat = max(treatment.x),
            plannedspend= sum(plannedspend, na.rm = T),
            bulkyspend = sum(bulkyspend, na.rm = T),
            sensoryspend = sum(sensoryspend, na.rm = T),
            spend = sum(spend, na.rm = T),
            frequency = visits/52#(cutoff-first.w)
  ) 

df.long$distclose = ifelse(
  df.long$postal %in% c(10000), 1,ifelse(is.na(df.long$postal), NA, 0))

df.long = na.omit(select(df.long, 
                         -first.w, 
                         -visits, 
                         -postal, 
                         -last.w))

df.long = df.long[!is.na(df.long$wid),]
df.long$wid = factor(df.long$wid)
df.long$long = factor(df.long$long)
df.long.diff = df.long %>% 
  filter (treat == "Treat") %>%
  full_join (
    df.long %>% 
      filter (treat == "Control"),
    by = c("wid", "long")
  )
df.long.diff = select(df.long.diff, -cust.x, -cust.y)
df.long.diff$treat.x = "Treat"
df.long.diff$treat.y = "Control"
##replace NA with 0
df.long.diff[is.na(df.long.diff)] <- 0

#substract
df.long.diff.reg = select(
  df.long.diff,
  volume.x,
  deals.x,
  diapers.x,
  plannedspend.x,
  bulkyspend.x,
  sensoryspend.x,
  frequency.x,
  monetary.x,
  spend.x) - 
  select(
    df.long.diff,
    volume.y,
    deals.y,
    diapers.y,
    plannedspend.y,
    bulkyspend.y,
    sensoryspend.y,
    frequency.y,
    monetary.y,
    spend.y
  )

df.long.diff.reg = cbind(df.long.diff$long, df.long.diff.reg)
names(df.long.diff.reg) = c("long", "volume", "deals", "diapers",
                            cols)

reg = as.data.frame(matrix(NA, nrow = 3, ncol = 6))
df.long.diff.reg$long <- as.factor(df.long.diff.reg$long)
formulas = paste(cols,"long+volume+deals+diapers", sep = "~")
df.long.diff.reg$long = relevel(df.long.diff.reg$long, ref="pre")

for(i in 1:length(formulas)){
  fit = summary(lm(formulas[i], df.long.diff.reg))
  reg[1,i] = paste(
    round(
      fit$coefficients[[1]],
      2),
    paste("(",round(
      fit$coefficients[[1,2]], #SE
      2),")", sep = ""),
    sep = " ")
  reg[2,i] = paste(
    round(
      fit$coefficients[[2]],
      2),
    paste("(",round(
      fit$coefficients[[2,2]], #SE
      2),")", sep = ""),
    sep = " ")
  reg[3,i] = round(
    fit$r.squared,
    2)
}
