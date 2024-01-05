library(data.table)

set.seed(123456) #to make the simulated data replicable

n = 50
dt_1_short <- data.table(
  cust = 1, #customerid
  week_nr = sample(40:150, n, replace = FALSE),  #generate 50 random sequence number which is integer and range between 40 to 150 NO REPEATED WEEK
  spend = runif(n, min = 150, max = 1000),  #generate 50 random numbers in R, which can be either integers or decimals (floating-point numbers), and fall within the range of 150 to 1000
  online = sample(c(0, 1), n, replace = TRUE),#generate 50 random numbers which can be either 0 or 1
  postal = 10000,
  volume = sample(6:100, n, replace = TRUE),
  plannedvol = sample(7:30, n, replace = TRUE),
  bulkyvol = sample(1:20, n, replace = TRUE),
  sensoryvol = sample(2:10, n, replace = TRUE),
  plannedspend = runif(n, min = 100, max = 400),
  bulkyspend = runif(n, min = 20, max =100),
  sensoryspend = runif(n, min = 100, max= 200),
  nr_product = sample(1:15, n, replace = TRUE),
  nr_product_deal = sample(0:5, n, replace = TRUE),
  diapers = sample(0:3, n, replace = TRUE)
)

dt_1_long <- data.table(
  cust = 1, #customerid
  week_nr = sample(200:300, n, replace = FALSE),  
  spend = runif(n, min = 150, max = 1000),  
  online = sample(c(0, 1), n, replace = TRUE),  
  postal = 10000,
  volume = sample(6:100, n, replace = TRUE),
  plannedvol = sample(7:30, n, replace = TRUE),
  bulkyvol = sample(1:20, n, replace = TRUE),
  sensoryvol = sample(2:10, n, replace = TRUE),
  plannedspend = runif(n, min = 100, max = 400),
  bulkyspend = runif(n, min = 20, max =100),
  sensoryspend = runif(n, min = 100, max= 200),
  nr_product = sample(1:15, n, replace = TRUE),
  nr_product_deal = sample(0:5, n, replace = TRUE),
  diapers = sample(0:3, n, replace = TRUE)
)

n = 30
  
  dt_2_short <- data.table(
    cust = 2, #customerid
    week_nr = sample(40:150, n, replace = FALSE),  
    spend = runif(n, min = 100, max = 1000),  
    online = 0, #offline
    postal = 20000,
    volume = sample(5:80, n, replace = TRUE),
    plannedvol = sample(6:20, n, replace = TRUE),
    bulkyvol = sample(1:10, n, replace = TRUE),
    sensoryvol = sample(1:5, n, replace = TRUE),
    plannedspend = runif(n, min = 150, max = 500),
    bulkyspend = runif(n, min = 10, max =500),
    sensoryspend = runif(n, min = 100, max= 200),
    nr_product = sample(1:15, n, replace = TRUE),
    nr_product_deal = sample(0:5, n, replace = TRUE),
    diapers = 0
  )

dt_2_long <- data.table(
  cust = 2, #customerid
  week_nr = sample(200:300, n, replace = FALSE),  
  spend = runif(n, min = 100, max = 1000),  
  online = 0, #offline
  postal = 20000,
  volume = sample(5:80, n, replace = TRUE),
  plannedvol = sample(6:20, n, replace = TRUE),
  bulkyvol = sample(1:10, n, replace = TRUE),
  sensoryvol = sample(1:5, n, replace = TRUE),
  plannedspend = runif(n, min = 150, max = 500),
  bulkyspend = runif(n, min = 10, max =500),
  sensoryspend = runif(n, min = 100, max= 200),
  nr_product = sample(1:15, n, replace = TRUE),
  nr_product_deal = sample(0:5, n, replace = TRUE),
  diapers = 0
)

n = 25
dt_3_short <- data.table(
  cust = 3, #customerid
  week_nr = sample(40:150, n, replace = FALSE),  
  spend = runif(n, min = 550, max = 2000),  
  online = sample(c(0, 1), n, replace = TRUE),  
  postal = 20000,
  volume = sample(6:100, n, replace = TRUE),
  plannedvol = sample(7:30, n, replace = TRUE),
  bulkyvol = sample(1:20, n, replace = TRUE),
  sensoryvol = sample(2:10, n, replace = TRUE),
  plannedspend = runif(n, min = 100, max = 2000),
  bulkyspend = runif(n, min = 20, max =100),
  sensoryspend = runif(n, min = 100, max= 200),
  nr_product = sample(1:15, n, replace = TRUE),
  nr_product_deal = sample(0:5, n, replace = TRUE),
  diapers = sample(0:3, n, replace = TRUE)
)

dt_3_long <- data.table(
  cust = 3, #customerid
  week_nr = sample(200:300, n, replace = FALSE),  
  spend = runif(n, min = 200, max = 1000),  
  online = sample(c(0, 1), n, replace = TRUE),  
  postal = 20000,
  volume = sample(6:100, n, replace = TRUE),
  plannedvol = sample(7:30, n, replace = TRUE),
  bulkyvol = sample(1:50, n, replace = TRUE),
  sensoryvol = sample(3:10, n, replace = TRUE),
  plannedspend = runif(n, min = 10, max = 250),
  bulkyspend = runif(n, min = 20, max =100),
  sensoryspend = runif(n, min = 100, max= 500),
  nr_product = sample(1:15, n, replace = TRUE),
  nr_product_deal = sample(0:5, n, replace = TRUE),
  diapers = sample(0:3, n, replace = TRUE)
)

n = 30

dt_4_short <- data.table(
  cust = 4, #customerid
  week_nr = sample(40:150, n, replace = FALSE),  
  spend = runif(n, min = 200, max = 2000),  
  online = 0, #offline
  postal = 10000,
  volume = sample(5:100, n, replace = TRUE),
  plannedvol = sample(1:30, n, replace = TRUE),
  bulkyvol = sample(1:50, n, replace = TRUE),
  sensoryvol = sample(1:20, n, replace = TRUE),
  plannedspend = runif(n, min = 150, max = 500),
  bulkyspend = runif(n, min = 100, max =500),
  sensoryspend = runif(n, min = 100, max= 500),
  nr_product = sample(1:20, n, replace = TRUE),
  nr_product_deal = sample(0:6, n, replace = TRUE),
  diapers = sample(0:3, n, replace = TRUE)
)

dt_4_long <- data.table(
  cust = 4, #customerid
  week_nr = sample(200:300, n, replace = FALSE),  
  spend = runif(n, min = 100, max = 1000),  
  online = 0, #offline
  postal = 10000,
  volume = sample(5:100, n, replace = TRUE),
  plannedvol = sample(1:30, n, replace = TRUE),
  bulkyvol = sample(1:50, n, replace = TRUE),
  sensoryvol = sample(1:20, n, replace = TRUE),
  plannedspend = runif(n, min = 150, max = 500),
  bulkyspend = runif(n, min = 100, max =500),
  sensoryspend = runif(n, min = 100, max= 500),
  nr_product = sample(1:20, n, replace = TRUE),
  nr_product_deal = sample(0:6, n, replace = TRUE),
  diapers = sample(0:3, n, replace = TRUE)
)

n = 35
dt_5_short <- data.table(
  cust = 5, #customerid
  week_nr = sample(40:150, n, replace = FALSE),  
  spend = runif(n, min = 450, max = 3000),  
  online = sample(c(0, 1), n, replace = TRUE),  
  postal = 20000,
  volume = sample(2:200, n, replace = TRUE),
  plannedvol = sample(7:30, n, replace = TRUE),
  bulkyvol = sample(2:23, n, replace = TRUE),
  sensoryvol = sample(1:15, n, replace = TRUE),
  plannedspend = runif(n, min = 100, max = 1100),
  bulkyspend = runif(n, min = 30, max =200),
  sensoryspend = runif(n, min = 100, max= 250),
  nr_product = sample(1:18, n, replace = TRUE),
  nr_product_deal = sample(0:7, n, replace = TRUE),
  diapers = sample(0:2, n, replace = TRUE)
)

dt_5_long <- data.table(
  cust = 5, #customerid
  week_nr = sample(200:300, n, replace = FALSE),  
  spend = runif(n, min = 450, max = 3000),  
  online = sample(c(0, 1), n, replace = TRUE),  
  postal = 20000,
  volume = sample(2:200, n, replace = TRUE),
  plannedvol = sample(7:30, n, replace = TRUE),
  bulkyvol = sample(2:23, n, replace = TRUE),
  sensoryvol = sample(1:15, n, replace = TRUE),
  plannedspend = runif(n, min = 100, max = 1200),
  bulkyspend = runif(n, min = 30, max =200),
  sensoryspend = runif(n, min = 100, max= 250),
  nr_product = sample(1:18, n, replace = TRUE),
  nr_product_deal = sample(0:7, n, replace = TRUE),
  diapers = sample(0:2, n, replace = TRUE)
)

n = 32

dt_6_short <- data.table(
  cust = 6, #customerid
  week_nr = sample(40:150, n, replace = FALSE),  
  spend = runif(n, min = 100, max = 1000),  
  online = 0, #offline
  postal = 20000,
  volume = sample(5:120, n, replace = TRUE),
  plannedvol = sample(1:10, n, replace = TRUE),
  bulkyvol = sample(1:50, n, replace = TRUE),
  sensoryvol = sample(1:15, n, replace = TRUE),
  plannedspend = runif(n, min = 30, max = 300),
  bulkyspend = runif(n, min = 50, max =400),
  sensoryspend = runif(n, min = 100, max= 500),
  nr_product = sample(1:15, n, replace = TRUE),
  nr_product_deal = sample(0:6, n, replace = TRUE),
  diapers = sample(0:3, n, replace = TRUE)
)

dt_6_long <- data.table(
  cust = 6, #customerid
  week_nr = sample(200:300, n, replace = FALSE),  
  spend = runif(n, min = 100, max = 1000),  
  online = 0, #offline
  postal = 20000,
  volume = sample(5:120, n, replace = TRUE),
  plannedvol = sample(1:10, n, replace = TRUE),
  bulkyvol = sample(1:50, n, replace = TRUE),
  sensoryvol = sample(1:15, n, replace = TRUE),
  plannedspend = runif(n, min = 30, max = 300),
  bulkyspend = runif(n, min = 50, max =400),
  sensoryspend = runif(n, min = 100, max= 500),
  nr_product = sample(1:15, n, replace = TRUE),
  nr_product_deal = sample(0:6, n, replace = TRUE),
  diapers = sample(0:3, n, replace = TRUE)
)

n = 42
dt_7_short <- data.table(
  cust = 7, #customerid
  week_nr = sample(40:150, n, replace = FALSE),  
  spend = runif(n, min = 800, max = 3500),  
  online = sample(c(0, 1), n, replace = TRUE),  
  postal = 10000,
  volume = sample(4:800, n, replace = TRUE),
  plannedvol = sample(5:45, n, replace = TRUE),
  bulkyvol = sample(4:30, n, replace = TRUE),
  sensoryvol = sample(4:40, n, replace = TRUE),
  plannedspend = runif(n, min = 300, max = 700),
  bulkyspend = runif(n, min = 30, max =210),
  sensoryspend = runif(n, min = 100, max= 400),
  nr_product = sample(1:18, n, replace = TRUE),
  nr_product_deal = sample(0:6, n, replace = TRUE),
  diapers = 0
)

dt_7_long <- data.table(
  cust = 7, #customerid
  week_nr = sample(200:300, n, replace = FALSE),  
  spend = runif(n, min = 450, max = 3000),  
  online = sample(c(0, 1), n, replace = TRUE),  
  postal = 10000,
  volume = sample(2:200, n, replace = TRUE),
  plannedvol = sample(7:30, n, replace = TRUE),
  bulkyvol = sample(2:23, n, replace = TRUE),
  sensoryvol = sample(1:15, n, replace = TRUE),
  plannedspend = runif(n, min = 100, max = 800),
  bulkyspend = runif(n, min = 30, max =200),
  sensoryspend = runif(n, min = 100, max= 250),
  nr_product = sample(1:18, n, replace = TRUE),
  nr_product_deal = sample(0:7, n, replace = TRUE),
  diapers = 0
)

n = 36

dt_8_short <- data.table(
  cust = 8, #customerid
  week_nr = sample(40:150, n, replace = FALSE),  
  spend = runif(n, min = 200, max = 3000),  
  online = 0, #offline
  postal = 10000,
  volume = sample(5:120, n, replace = TRUE),
  plannedvol = sample(1:10, n, replace = TRUE),
  bulkyvol = sample(1:50, n, replace = TRUE),
  sensoryvol = sample(1:15, n, replace = TRUE),
  plannedspend = runif(n, min = 35, max = 350),
  bulkyspend = runif(n, min = 100, max =880),
  sensoryspend = runif(n, min = 99, max= 990),
  nr_product = sample(1:30, n, replace = TRUE),
  nr_product_deal = sample(0:5, n, replace = TRUE),
  diapers = 0
)

dt_8_long <- data.table(
  cust = 8, #customerid
  week_nr = sample(200:300, n, replace = FALSE),  
  spend = runif(n, min = 300, max = 4000),  
  online = 0, #offline
  postal = 10000,
  volume = sample(5:120, n, replace = TRUE),
  plannedvol = sample(1:10, n, replace = TRUE),
  bulkyvol = sample(1:50, n, replace = TRUE),
  sensoryvol = sample(1:15, n, replace = TRUE),
  plannedspend = runif(n, min = 37, max = 390),
  bulkyspend = runif(n, min = 55, max =440),
  sensoryspend = runif(n, min = 130, max= 600),
  nr_product = sample(1:35, n, replace = TRUE),
  nr_product_deal = sample(0:5, n, replace = TRUE),
  diapers = 0
)

n = 45
dt_9_short <- data.table(
  cust = 9, #customerid
  week_nr = sample(40:150, n, replace = FALSE),  
  spend = runif(n, min = 800, max = 3500),  
  online = sample(c(0, 1), n, replace = TRUE),  
  postal = 20000,
  volume = sample(4:800, n, replace = TRUE),
  plannedvol = sample(5:45, n, replace = TRUE),
  bulkyvol = sample(4:30, n, replace = TRUE),
  sensoryvol = sample(4:40, n, replace = TRUE),
  plannedspend = runif(n, min = 300, max = 700),
  bulkyspend = runif(n, min = 30, max =210),
  sensoryspend = runif(n, min = 100, max= 400),
  nr_product = sample(1:18, n, replace = TRUE),
  nr_product_deal = sample(0:6, n, replace = TRUE),
  diapers = sample(0:3, n, replace = TRUE)
)

dt_9_long <- data.table(
  cust = 9, #customerid
  week_nr = sample(200:300, n, replace = FALSE),  
  spend = runif(n, min = 700, max = 3000),  
  online = sample(c(0, 1), n, replace = TRUE),  
  postal = 20000,
  volume = sample(20:90, n, replace = TRUE),
  plannedvol = sample(7:40, n, replace = TRUE),
  bulkyvol = sample(2:50, n, replace = TRUE),
  sensoryvol = sample(1:30, n, replace = TRUE),
  plannedspend = runif(n, min = 200, max = 900),
  bulkyspend = runif(n, min = 90, max =800),
  sensoryspend = runif(n, min = 110, max= 500),
  nr_product = sample(1:30, n, replace = TRUE),
  nr_product_deal = sample(0:7, n, replace = TRUE),
  diapers = sample(0:3, n, replace = TRUE)
)

n = 47
dt_10_short <- data.table(
  cust = 10, #customerid
  week_nr = sample(40:150, n, replace = FALSE),  
  spend = runif(n, min = 100, max = 3000),  
  online = 0, #offline
  postal = 10000,
  volume = sample(20:90, n, replace = TRUE),
  plannedvol = sample(7:40, n, replace = TRUE),
  bulkyvol = sample(2:50, n, replace = TRUE),
  sensoryvol = sample(1:30, n, replace = TRUE),
  plannedspend = runif(n, min = 200, max = 900),
  bulkyspend = runif(n, min = 90, max =800),
  sensoryspend = runif(n, min = 110, max= 500),
  nr_product = sample(1:30, n, replace = TRUE),
  nr_product_deal = sample(0:7, n, replace = TRUE),
  diapers = sample(0:3, n, replace = TRUE)
)

dt_10_long <- data.table(
  cust = 10, #customerid
  week_nr = sample(200:300, n, replace = FALSE),  
  spend = runif(n, min = 300, max = 4000),  
  online = 0, #offline
  postal = 10000,
  volume = sample(20:90, n, replace = TRUE),
  plannedvol = sample(7:40, n, replace = TRUE),
  bulkyvol = sample(2:50, n, replace = TRUE),
  sensoryvol = sample(1:30, n, replace = TRUE),
  plannedspend = runif(n, min = 200, max = 900),
  bulkyspend = runif(n, min = 90, max =800),
  sensoryspend = runif(n, min = 110, max= 500),
  nr_product = sample(1:30, n, replace = TRUE),
  nr_product_deal = sample(0:7, n, replace = TRUE),
  diapers = sample(0:3, n, replace = TRUE)
)

#Add more offline for better match
n = 32
dt_11_short <- data.table(
  cust = 11, #customerid
  week_nr = sample(40:150, n, replace = FALSE),  
  spend = runif(n, min = 10, max = 100),  
  online = 0, #offline
  postal = 10000,
  volume = sample(10:20, n, replace = TRUE),
  plannedvol = sample(7:10, n, replace = TRUE),
  bulkyvol = sample(2:10, n, replace = TRUE),
  sensoryvol = sample(1:20, n, replace = TRUE),
  plannedspend = runif(n, min = 100, max = 300),
  bulkyspend = runif(n, min = 20, max =150),
  sensoryspend = runif(n, min = 90, max= 200),
  nr_product = sample(1:30, n, replace = TRUE),
  nr_product_deal = sample(0:7, n, replace = TRUE),
  diapers = sample(0:3, n, replace = TRUE)
)

dt_11_long <- data.table(
  cust = 11, #customerid
  week_nr = sample(200:300, n, replace = FALSE),  
  spend = runif(n, min = 300, max = 4000),  
  online = 0, #offline
  postal = 10000,
  volume = sample(10:20, n, replace = TRUE),
  plannedvol = sample(7:10, n, replace = TRUE),
  bulkyvol = sample(2:10, n, replace = TRUE),
  sensoryvol = sample(1:20, n, replace = TRUE),
  plannedspend = runif(n, min = 100, max = 300),
  bulkyspend = runif(n, min = 20, max =150),
  sensoryspend = runif(n, min = 90, max= 200),
  nr_product = sample(1:30, n, replace = TRUE),
  nr_product_deal = sample(0:7, n, replace = TRUE),
  diapers = sample(0:3, n, replace = TRUE)
)

n = 42
dt_12_short <- data.table(
  cust = 12, #customerid
  week_nr = sample(40:150, n, replace = FALSE),  
  spend = runif(n, min = 10, max = 100),  
  online = 0, #offline
  postal = 10000,
  volume = sample(10:20, n, replace = TRUE),
  plannedvol = sample(7:10, n, replace = TRUE),
  bulkyvol = sample(2:10, n, replace = TRUE),
  sensoryvol = sample(1:20, n, replace = TRUE),
  plannedspend = runif(n, min = 100, max = 300),
  bulkyspend = runif(n, min = 20, max =150),
  sensoryspend = runif(n, min = 90, max= 200),
  nr_product = sample(1:30, n, replace = TRUE),
  nr_product_deal = sample(0:7, n, replace = TRUE),
  diapers = sample(0:3, n, replace = TRUE)
)

dt_12_long <- data.table(
  cust = 12, #customerid
  week_nr = sample(200:300, n, replace = FALSE),  
  spend = runif(n, min = 300, max = 4000),  
  online = 0, #offline
  postal = 10000,
  volume = sample(10:20, n, replace = TRUE),
  plannedvol = sample(7:10, n, replace = TRUE),
  bulkyvol = sample(2:10, n, replace = TRUE),
  sensoryvol = sample(1:20, n, replace = TRUE),
  plannedspend = runif(n, min = 100, max = 300),
  bulkyspend = runif(n, min = 20, max =150),
  sensoryspend = runif(n, min = 90, max= 200),
  nr_product = sample(1:30, n, replace = TRUE),
  nr_product_deal = sample(0:7, n, replace = TRUE),
  diapers = sample(0:3, n, replace = TRUE)
)

n = 38
dt_13_short <- data.table(
  cust = 13, #customerid
  week_nr = sample(40:150, n, replace = FALSE),  
  spend = runif(n, min = 10, max = 100),  
  online = 0, #offline
  postal = 20000,
  volume = sample(10:20, n, replace = TRUE),
  plannedvol = sample(7:10, n, replace = TRUE),
  bulkyvol = sample(2:10, n, replace = TRUE),
  sensoryvol = sample(1:20, n, replace = TRUE),
  plannedspend = runif(n, min = 100, max = 300),
  bulkyspend = runif(n, min = 20, max =150),
  sensoryspend = runif(n, min = 90, max= 200),
  nr_product = sample(1:30, n, replace = TRUE),
  nr_product_deal = sample(0:7, n, replace = TRUE),
  diapers = sample(0:3, n, replace = TRUE)
)

dt_13_long <- data.table(
  cust = 13, #customerid
  week_nr = sample(200:300, n, replace = FALSE),  
  spend = runif(n, min = 300, max = 4000),  
  online = 0, #offline
  postal = 20000,
  volume = sample(10:20, n, replace = TRUE),
  plannedvol = sample(7:10, n, replace = TRUE),
  bulkyvol = sample(2:10, n, replace = TRUE),
  sensoryvol = sample(1:20, n, replace = TRUE),
  plannedspend = runif(n, min = 100, max = 300),
  bulkyspend = runif(n, min = 20, max =150),
  sensoryspend = runif(n, min = 90, max= 200),
  nr_product = sample(1:30, n, replace = TRUE),
  nr_product_deal = sample(0:7, n, replace = TRUE),
  diapers = sample(0:3, n, replace = TRUE)
)

n = 40
dt_14_short <- data.table(
  cust = 14, #customerid
  week_nr = sample(40:150, n, replace = FALSE),  
  spend = runif(n, min = 1000, max = 4000),  
  online = 0, #offline
  postal = 10000,
  volume = sample(80:200, n, replace = TRUE),
  plannedvol = sample(20:90, n, replace = TRUE),
  bulkyvol = sample(20:90, n, replace = TRUE),
  sensoryvol = sample(20:90, n, replace = TRUE),
  plannedspend = runif(n, min = 600, max = 1500),
  bulkyspend = runif(n, min = 600, max = 1500),
  sensoryspend = runif(n, min = 600, max = 1500),
  nr_product = sample(10:50, n, replace = TRUE),
  nr_product_deal = sample(0:10, n, replace = TRUE),
  diapers = 0
)

dt_14_long <- data.table(
  cust = 14, #customerid
  week_nr = sample(200:300, n, replace = FALSE),  
  spend = runif(n, min = 300, max = 4000),  
  online = 0, #offline
  postal = 10000,
  volume = sample(80:200, n, replace = TRUE),
  plannedvol = sample(20:90, n, replace = TRUE),
  bulkyvol = sample(20:90, n, replace = TRUE),
  sensoryvol = sample(20:90, n, replace = TRUE),
  plannedspend = runif(n, min = 600, max = 1500),
  bulkyspend = runif(n, min = 600, max = 1500),
  sensoryspend = runif(n, min = 600, max = 1500),
  nr_product = sample(10:50, n, replace = TRUE),
  nr_product_deal = sample(0:10, n, replace = TRUE),
  diapers = 0
)

n = 40
dt_15_short <- data.table(
  cust = 15, #customerid
  week_nr = sample(40:150, n, replace = FALSE),  
  spend = runif(n, min = 1000, max = 4000),  
  online = 0, #offline
  postal = 20000,
  volume = sample(80:200, n, replace = TRUE),
  plannedvol = sample(20:90, n, replace = TRUE),
  bulkyvol = sample(20:90, n, replace = TRUE),
  sensoryvol = sample(20:90, n, replace = TRUE),
  plannedspend = runif(n, min = 600, max = 1500),
  bulkyspend = runif(n, min = 600, max = 1500),
  sensoryspend = runif(n, min = 600, max = 1500),
  nr_product = sample(10:50, n, replace = TRUE),
  nr_product_deal = sample(0:10, n, replace = TRUE),
  diapers = 0
)

dt_15_long <- data.table(
  cust = 15, #customerid
  week_nr = sample(200:300, n, replace = FALSE),  
  spend = runif(n, min = 300, max = 4000),  
  online = 0, #offline
  postal = 20000,
  volume = sample(80:200, n, replace = TRUE),
  plannedvol = sample(20:90, n, replace = TRUE),
  bulkyvol = sample(20:90, n, replace = TRUE),
  sensoryvol = sample(20:90, n, replace = TRUE),
  plannedspend = runif(n, min = 600, max = 1500),
  bulkyspend = runif(n, min = 600, max = 1500),
  sensoryspend = runif(n, min = 600, max = 1500),
  nr_product = sample(10:50, n, replace = TRUE),
  nr_product_deal = sample(0:10, n, replace = TRUE),
  diapers = 0
)

dt_16_short <- data.table(
  cust = 16, #customerid similar to cust 1
  week_nr = sample(40:150, n, replace = FALSE),  
  spend = runif(n, min = 150, max = 1000),  
  online = 0,  
  postal = 10000,
  volume = sample(6:100, n, replace = TRUE),
  plannedvol = sample(7:30, n, replace = TRUE),
  bulkyvol = sample(1:20, n, replace = TRUE),
  sensoryvol = sample(2:10, n, replace = TRUE),
  plannedspend = runif(n, min = 100, max = 400),
  bulkyspend = runif(n, min = 20, max =100),
  sensoryspend = runif(n, min = 100, max= 200),
  nr_product = sample(1:15, n, replace = TRUE),
  nr_product_deal = sample(0:5, n, replace = TRUE),
  diapers = sample(0:3, n, replace = TRUE)
)

dt_16_long <- data.table(
  cust = 16, 
  week_nr = sample(200:300, n, replace = FALSE),  
  spend = runif(n, min = 400, max = 1500),  
  online = 0,  
  postal = 10000,
  volume = sample(6:100, n, replace = TRUE),
  plannedvol = sample(7:30, n, replace = TRUE),
  bulkyvol = sample(1:20, n, replace = TRUE),
  sensoryvol = sample(2:10, n, replace = TRUE),
  plannedspend = runif(n, min = 300, max = 600),
  bulkyspend = runif(n, min = 200, max =900),
  sensoryspend = runif(n, min = 100, max= 200),
  nr_product = sample(1:15, n, replace = TRUE),
  nr_product_deal = sample(0:5, n, replace = TRUE),
  diapers = sample(0:3, n, replace = TRUE)
)

n = 30
dt_17_short <- data.table(
  cust = 17, #similar to cust 3
  week_nr = sample(40:150, n, replace = FALSE),  
  spend = runif(n, min = 550, max = 2000),  
  online = 0,  
  postal = 20000,
  volume = sample(6:100, n, replace = TRUE),
  plannedvol = sample(7:30, n, replace = TRUE),
  bulkyvol = sample(1:20, n, replace = TRUE),
  sensoryvol = sample(2:10, n, replace = TRUE),
  plannedspend = runif(n, min = 100, max = 2000),
  bulkyspend = runif(n, min = 20, max =100),
  sensoryspend = runif(n, min = 100, max= 200),
  nr_product = sample(1:15, n, replace = TRUE),
  nr_product_deal = sample(0:5, n, replace = TRUE),
  diapers = sample(0:3, n, replace = TRUE)
)

dt_17_long <- data.table(
  cust = 17, #customerid
  week_nr = sample(200:300, n, replace = FALSE),  
  spend = runif(n, min = 800, max = 2000),  
  online = 0,  
  postal = 20000,
  volume = sample(6:100, n, replace = TRUE),
  plannedvol = sample(7:30, n, replace = TRUE),
  bulkyvol = sample(1:50, n, replace = TRUE),
  sensoryvol = sample(3:10, n, replace = TRUE),
  plannedspend = runif(n, min = 100, max = 550),
  bulkyspend = runif(n, min = 200, max =900),
  sensoryspend = runif(n, min = 80, max= 300),
  nr_product = sample(1:15, n, replace = TRUE),
  nr_product_deal = sample(0:5, n, replace = TRUE),
  diapers = sample(0:3, n, replace = TRUE)
)

n = 40
dt_18_short <- data.table(
  cust = 18, #customerid similar to cust 5
  week_nr = sample(40:150, n, replace = FALSE),  
  spend = runif(n, min = 450, max = 3000),  
  online = 0,  
  postal = 20000,
  volume = sample(2:200, n, replace = TRUE),
  plannedvol = sample(7:30, n, replace = TRUE),
  bulkyvol = sample(2:23, n, replace = TRUE),
  sensoryvol = sample(1:15, n, replace = TRUE),
  plannedspend = runif(n, min = 100, max = 1100),
  bulkyspend = runif(n, min = 30, max =200),
  sensoryspend = runif(n, min = 100, max= 250),
  nr_product = sample(1:18, n, replace = TRUE),
  nr_product_deal = sample(0:7, n, replace = TRUE),
  diapers = sample(0:2, n, replace = TRUE)
)

dt_18_long <- data.table(
  cust = 18, #customerid
  week_nr = sample(200:300, n, replace = FALSE),  
  spend = runif(n, min = 1000, max = 3500),  
  online = 0,  
  postal = 20000,
  volume = sample(2:200, n, replace = TRUE),
  plannedvol = sample(7:30, n, replace = TRUE),
  bulkyvol = sample(2:23, n, replace = TRUE),
  sensoryvol = sample(1:15, n, replace = TRUE),
  plannedspend = runif(n, min = 500, max = 2200),
  bulkyspend = runif(n, min = 200, max =900),
  sensoryspend = runif(n, min = 50, max= 150),
  nr_product = sample(1:18, n, replace = TRUE),
  nr_product_deal = sample(0:7, n, replace = TRUE),
  diapers = sample(0:2, n, replace = TRUE)
)

n = 55
dt_19_short <- data.table(
  cust = 19, #customerid similar to cust 7
  week_nr = sample(40:150, n, replace = FALSE),  
  spend = runif(n, min = 800, max = 3500),  
  online = 0,  
  postal = 10000,
  volume = sample(4:800, n, replace = TRUE),
  plannedvol = sample(5:45, n, replace = TRUE),
  bulkyvol = sample(4:30, n, replace = TRUE),
  sensoryvol = sample(4:40, n, replace = TRUE),
  plannedspend = runif(n, min = 300, max = 700),
  bulkyspend = runif(n, min = 30, max =210),
  sensoryspend = runif(n, min = 100, max= 400),
  nr_product = sample(1:18, n, replace = TRUE),
  nr_product_deal = sample(0:6, n, replace = TRUE),
  diapers = 0
)

dt_19_long <- data.table(
  cust = 19, #customerid
  week_nr = sample(200:300, n, replace = FALSE),  
  spend = runif(n, min = 1000, max = 5000),  
  online = 0,  
  postal = 10000,
  volume = sample(2:200, n, replace = TRUE),
  plannedvol = sample(7:30, n, replace = TRUE),
  bulkyvol = sample(2:23, n, replace = TRUE),
  sensoryvol = sample(1:15, n, replace = TRUE),
  plannedspend = runif(n, min = 500, max = 1000),
  bulkyspend = runif(n, min = 100, max =500),
  sensoryspend = runif(n, min = 30, max= 200),
  nr_product = sample(1:18, n, replace = TRUE),
  nr_product_deal = sample(0:7, n, replace = TRUE),
  diapers = 0
)


n = 45
dt_20_short <- data.table(
  cust = 20, #customerid similat to cust 9
  week_nr = sample(40:150, n, replace = FALSE),  
  spend = runif(n, min = 800, max = 3500),  
  online = 0,  
  postal = 20000,
  volume = sample(4:800, n, replace = TRUE),
  plannedvol = sample(5:45, n, replace = TRUE),
  bulkyvol = sample(4:30, n, replace = TRUE),
  sensoryvol = sample(4:40, n, replace = TRUE),
  plannedspend = runif(n, min = 300, max = 700),
  bulkyspend = runif(n, min = 30, max =210),
  sensoryspend = runif(n, min = 100, max= 400),
  nr_product = sample(1:18, n, replace = TRUE),
  nr_product_deal = sample(0:6, n, replace = TRUE),
  diapers = sample(0:3, n, replace = TRUE)
)

dt_20_long <- data.table(
  cust = 20, #customerid
  week_nr = sample(200:300, n, replace = FALSE), 
  spend = runif(n, min = 1000, max = 5000), 
  online = 0,
  postal = 20000,
  volume = sample(20:90, n, replace = TRUE),
  plannedvol = sample(7:40, n, replace = TRUE),
  bulkyvol = sample(2:50, n, replace = TRUE),
  sensoryvol = sample(1:30, n, replace = TRUE),
  plannedspend = runif(n, min = 500, max = 1000),
  bulkyspend = runif(n, min = 200, max =1000),
  sensoryspend = runif(n, min = 50, max= 300),
  nr_product = sample(1:30, n, replace = TRUE),
  nr_product_deal = sample(0:7, n, replace = TRUE),
  diapers = sample(0:3, n, replace = TRUE)
)

df <- rbind(dt_1_short,dt_1_long,dt_2_short,dt_2_long,dt_3_short,dt_3_long,dt_4_short,dt_4_long,dt_5_short,dt_5_long,
            dt_6_short,dt_6_long,dt_7_short,dt_7_long,dt_8_short,dt_8_long,dt_9_short,dt_9_long,dt_10_short,dt_10_long,
            dt_11_short,dt_11_long,dt_12_short,dt_12_long,dt_13_short,dt_13_long,dt_14_short,dt_14_long,dt_15_short,dt_15_long,
            dt_16_short,dt_16_long,dt_17_short,dt_17_long,dt_18_short,dt_18_long,dt_19_short,dt_19_long,dt_20_short,dt_20_long)

df[, online := ifelse(week_nr < 90, 0, online)]

write.csv(df,"df.csv", row.names = TRUE)
