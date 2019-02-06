
# Set working directory
# setwd()


new_data <- read.table('delinquency_soc312.dat', sep=' ')
names(new_data) <- c('R0000100',
  'R0536300',
  'R0536401',
  'R0536402',
  'R0648900',
  'R1201400',
  'R1204200',
  'R1204500',
  'R1204700',
  'R1204900',
  'R1205300',
  'R1211000',
  'R1217500',
  'R1235800',
  'R1302400',
  'R1302500',
  'R1302600',
  'R1302700',
  'R1482600',
  'R5511500')


# Handle missing values

  new_data[new_data == -1] = NA  # Refused 
  new_data[new_data == -2] = NA  # Dont know 
  new_data[new_data == -3] = NA  # Invalid missing 
  new_data[new_data == -4] = NA  # Valid missing 
  new_data[new_data == -5] = NA  # Non-interview 


# If there are values not categorized they will be represented as NA

vallabels = function(data) {
  data$R0000100[1.0 <= data$R0000100 & data$R0000100 <= 999.0] <- 1.0
  data$R0000100[1000.0 <= data$R0000100 & data$R0000100 <= 1999.0] <- 1000.0
  data$R0000100[2000.0 <= data$R0000100 & data$R0000100 <= 2999.0] <- 2000.0
  data$R0000100[3000.0 <= data$R0000100 & data$R0000100 <= 3999.0] <- 3000.0
  data$R0000100[4000.0 <= data$R0000100 & data$R0000100 <= 4999.0] <- 4000.0
  data$R0000100[5000.0 <= data$R0000100 & data$R0000100 <= 5999.0] <- 5000.0
  data$R0000100[6000.0 <= data$R0000100 & data$R0000100 <= 6999.0] <- 6000.0
  data$R0000100[7000.0 <= data$R0000100 & data$R0000100 <= 7999.0] <- 7000.0
  data$R0000100[8000.0 <= data$R0000100 & data$R0000100 <= 8999.0] <- 8000.0
  data$R0000100[9000.0 <= data$R0000100 & data$R0000100 <= 9999.0] <- 9000.0
  data$R0000100 <- factor(data$R0000100, 
    levels=c(0.0,1.0,1000.0,2000.0,3000.0,4000.0,5000.0,6000.0,7000.0,8000.0,9000.0), 
    labels=c("0",
      "1 TO 999",
      "1000 TO 1999",
      "2000 TO 2999",
      "3000 TO 3999",
      "4000 TO 4999",
      "5000 TO 5999",
      "6000 TO 6999",
      "7000 TO 7999",
      "8000 TO 8999",
      "9000 TO 9999"))
  data$R0536300 <- factor(data$R0536300, 
    levels=c(0.0,1.0,2.0), 
    labels=c("No Information",
      "Male",
      "Female"))
  data$R0536401 <- factor(data$R0536401, 
    levels=c(1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0), 
    labels=c("1: January",
      "2: February",
      "3: March",
      "4: April",
      "5: May",
      "6: June",
      "7: July",
      "8: August",
      "9: September",
      "10: October",
      "11: November",
      "12: December"))
  data$R0648900 <- factor(data$R0648900, 
    levels=c(0.0,1.0), 
    labels=c("No",
      "Yes"))
  data$R1201400 <- factor(data$R1201400, 
    levels=c(1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0), 
    labels=c("Not enrolled, no high school degree, no GED",
      "Not enrolled, GED",
      "Not enrolled, high school degree",
      "Not enrolled, some college",
      "Not enrolled, 2-year college graduate",
      "Not enrolled, 4-year college graduate",
      "Not enrolled, graduate degree",
      "Enrolled in grades 1-12, not a high school graduate",
      "Enrolled in a 2-year college",
      "Enrolled in a 4-year college",
      "Enrolled in a graduate program"))
  data$R1204200[20.0 <= data$R1204200 & data$R1204200 <= 99.0] <- 20.0
  data$R1204200 <- factor(data$R1204200, 
    levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0,20.0), 
    labels=c("0",
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9",
      "10",
      "11",
      "12",
      "13",
      "14",
      "15",
      "16",
      "17",
      "18",
      "19",
      "20 TO 99: 20+"))
  data$R1204500[-999999.0 <= data$R1204500 & data$R1204500 <= -3000.0] <- -999999.0
  data$R1204500[-2999.0 <= data$R1204500 & data$R1204500 <= -2000.0] <- -2999.0
  data$R1204500[-1999.0 <= data$R1204500 & data$R1204500 <= -1000.0] <- -1999.0
  data$R1204500[-999.0 <= data$R1204500 & data$R1204500 <= -1.0] <- -999.0
  data$R1204500[1.0 <= data$R1204500 & data$R1204500 <= 1000.0] <- 1.0
  data$R1204500[1001.0 <= data$R1204500 & data$R1204500 <= 2000.0] <- 1001.0
  data$R1204500[2001.0 <= data$R1204500 & data$R1204500 <= 3000.0] <- 2001.0
  data$R1204500[3001.0 <= data$R1204500 & data$R1204500 <= 5000.0] <- 3001.0
  data$R1204500[5001.0 <= data$R1204500 & data$R1204500 <= 10000.0] <- 5001.0
  data$R1204500[10001.0 <= data$R1204500 & data$R1204500 <= 20000.0] <- 10001.0
  data$R1204500[20001.0 <= data$R1204500 & data$R1204500 <= 30000.0] <- 20001.0
  data$R1204500[30001.0 <= data$R1204500 & data$R1204500 <= 40000.0] <- 30001.0
  data$R1204500[40001.0 <= data$R1204500 & data$R1204500 <= 50000.0] <- 40001.0
  data$R1204500[50001.0 <= data$R1204500 & data$R1204500 <= 65000.0] <- 50001.0
  data$R1204500[65001.0 <= data$R1204500 & data$R1204500 <= 80000.0] <- 65001.0
  data$R1204500[80001.0 <= data$R1204500 & data$R1204500 <= 100000.0] <- 80001.0
  data$R1204500[100001.0 <= data$R1204500 & data$R1204500 <= 150000.0] <- 100001.0
  data$R1204500[150001.0 <= data$R1204500 & data$R1204500 <= 200000.0] <- 150001.0
  data$R1204500[200001.0 <= data$R1204500 & data$R1204500 <= 999999.0] <- 200001.0
  data$R1204500 <- factor(data$R1204500, 
    levels=c(-999999.0,-2999.0,-1999.0,-999.0,0.0,1.0,1001.0,2001.0,3001.0,5001.0,10001.0,20001.0,30001.0,40001.0,50001.0,65001.0,80001.0,100001.0,150001.0,200001.0), 
    labels=c("-999999 TO -3000: < -2999",
      "-2999 TO -2000",
      "-1999 TO -1000",
      "-999 TO -1",
      "0",
      "1 TO 1000",
      "1001 TO 2000",
      "2001 TO 3000",
      "3001 TO 5000",
      "5001 TO 10000",
      "10001 TO 20000",
      "20001 TO 30000",
      "30001 TO 40000",
      "40001 TO 50000",
      "50001 TO 65000",
      "65001 TO 80000",
      "80001 TO 100000",
      "100001 TO 150000",
      "150001 TO 200000",
      "200001 TO 999999: 200001+"))
  data$R1204700[-999999.0 <= data$R1204700 & data$R1204700 <= -3000.0] <- -999999.0
  data$R1204700[-2999.0 <= data$R1204700 & data$R1204700 <= -2000.0] <- -2999.0
  data$R1204700[-1999.0 <= data$R1204700 & data$R1204700 <= -1000.0] <- -1999.0
  data$R1204700[-999.0 <= data$R1204700 & data$R1204700 <= -6.0] <- -999.0
  data$R1204700[1.0 <= data$R1204700 & data$R1204700 <= 1000.0] <- 1.0
  data$R1204700[1001.0 <= data$R1204700 & data$R1204700 <= 2000.0] <- 1001.0
  data$R1204700[2001.0 <= data$R1204700 & data$R1204700 <= 3000.0] <- 2001.0
  data$R1204700[3001.0 <= data$R1204700 & data$R1204700 <= 5000.0] <- 3001.0
  data$R1204700[5001.0 <= data$R1204700 & data$R1204700 <= 10000.0] <- 5001.0
  data$R1204700[10001.0 <= data$R1204700 & data$R1204700 <= 20000.0] <- 10001.0
  data$R1204700[20001.0 <= data$R1204700 & data$R1204700 <= 30000.0] <- 20001.0
  data$R1204700[30001.0 <= data$R1204700 & data$R1204700 <= 40000.0] <- 30001.0
  data$R1204700[40001.0 <= data$R1204700 & data$R1204700 <= 50000.0] <- 40001.0
  data$R1204700[50001.0 <= data$R1204700 & data$R1204700 <= 65000.0] <- 50001.0
  data$R1204700[65001.0 <= data$R1204700 & data$R1204700 <= 80000.0] <- 65001.0
  data$R1204700[80001.0 <= data$R1204700 & data$R1204700 <= 100000.0] <- 80001.0
  data$R1204700[100001.0 <= data$R1204700 & data$R1204700 <= 150000.0] <- 100001.0
  data$R1204700[150001.0 <= data$R1204700 & data$R1204700 <= 200000.0] <- 150001.0
  data$R1204700[200001.0 <= data$R1204700 & data$R1204700 <= 500000.0] <- 200001.0
  data$R1204700[500001.0 <= data$R1204700 & data$R1204700 <= 1000000.0] <- 500001.0
  data$R1204700[1000001.0 <= data$R1204700 & data$R1204700 <= 1500000.0] <- 1000001.0
  data$R1204700[1500001.0 <= data$R1204700 & data$R1204700 <= 2000000.0] <- 1500001.0
  data$R1204700[2000001.0 <= data$R1204700 & data$R1204700 <= 9.99999999E8] <- 2000001.0
  data$R1204700 <- factor(data$R1204700, 
    levels=c(-999999.0,-2999.0,-1999.0,-999.0,0.0,1.0,1001.0,2001.0,3001.0,5001.0,10001.0,20001.0,30001.0,40001.0,50001.0,65001.0,80001.0,100001.0,150001.0,200001.0,500001.0,1000001.0,1500001.0,2000001.0), 
    labels=c("-999999 TO -3000: < -2999",
      "-2999 TO -2000",
      "-1999 TO -1000",
      "-999 TO -6",
      "0",
      "1 TO 1000",
      "1001 TO 2000",
      "2001 TO 3000",
      "3001 TO 5000",
      "5001 TO 10000",
      "10001 TO 20000",
      "20001 TO 30000",
      "30001 TO 40000",
      "40001 TO 50000",
      "50001 TO 65000",
      "65001 TO 80000",
      "80001 TO 100000",
      "100001 TO 150000",
      "150001 TO 200000",
      "200001 TO 500000",
      "500001 TO 1000000",
      "1000001 TO 1500000",
      "1500001 TO 2000000",
      "2000001 TO 999999999: 2000001+"))
  data$R1204900[1.0 <= data$R1204900 & data$R1204900 <= 99.0] <- 1.0
  data$R1204900[100.0 <= data$R1204900 & data$R1204900 <= 199.0] <- 100.0
  data$R1204900[200.0 <= data$R1204900 & data$R1204900 <= 299.0] <- 200.0
  data$R1204900[300.0 <= data$R1204900 & data$R1204900 <= 399.0] <- 300.0
  data$R1204900[400.0 <= data$R1204900 & data$R1204900 <= 499.0] <- 400.0
  data$R1204900[500.0 <= data$R1204900 & data$R1204900 <= 599.0] <- 500.0
  data$R1204900[600.0 <= data$R1204900 & data$R1204900 <= 699.0] <- 600.0
  data$R1204900[700.0 <= data$R1204900 & data$R1204900 <= 799.0] <- 700.0
  data$R1204900[800.0 <= data$R1204900 & data$R1204900 <= 899.0] <- 800.0
  data$R1204900[900.0 <= data$R1204900 & data$R1204900 <= 999.0] <- 900.0
  data$R1204900[1000.0 <= data$R1204900 & data$R1204900 <= 1099.0] <- 1000.0
  data$R1204900[1100.0 <= data$R1204900 & data$R1204900 <= 1199.0] <- 1100.0
  data$R1204900[1200.0 <= data$R1204900 & data$R1204900 <= 1299.0] <- 1200.0
  data$R1204900[1300.0 <= data$R1204900 & data$R1204900 <= 1399.0] <- 1300.0
  data$R1204900[1400.0 <= data$R1204900 & data$R1204900 <= 1499.0] <- 1400.0
  data$R1204900[1500.0 <= data$R1204900 & data$R1204900 <= 1599.0] <- 1500.0
  data$R1204900[1600.0 <= data$R1204900 & data$R1204900 <= 1699.0] <- 1600.0
  data$R1204900[1700.0 <= data$R1204900 & data$R1204900 <= 1799.0] <- 1700.0
  data$R1204900[1800.0 <= data$R1204900 & data$R1204900 <= 1899.0] <- 1800.0
  data$R1204900[1900.0 <= data$R1204900 & data$R1204900 <= 1999.0] <- 1900.0
  data$R1204900[2000.0 <= data$R1204900 & data$R1204900 <= 2999.0] <- 2000.0
  data$R1204900[3000.0 <= data$R1204900 & data$R1204900 <= 9999.0] <- 3000.0
  data$R1204900 <- factor(data$R1204900, 
    levels=c(0.0,1.0,100.0,200.0,300.0,400.0,500.0,600.0,700.0,800.0,900.0,1000.0,1100.0,1200.0,1300.0,1400.0,1500.0,1600.0,1700.0,1800.0,1900.0,2000.0,3000.0), 
    labels=c("0",
      "1 TO 99: .01-.99",
      "100 TO 199: 1.00-1.99",
      "200 TO 299: 2.00-2.99",
      "300 TO 399: 3.00-3.99",
      "400 TO 499: 4.00-4.99",
      "500 TO 599: 5.00-5.99",
      "600 TO 699: 6.00-6.99",
      "700 TO 799: 7.00-7.99",
      "800 TO 899: 8.00-8.99",
      "900 TO 999: 9.00-9.99",
      "1000 TO 1099: 10.00-10.99",
      "1100 TO 1199: 11.00-11.99",
      "1200 TO 1299: 12.00-12.99",
      "1300 TO 1399: 13.00-13.99",
      "1400 TO 1499: 14.00-14.99",
      "1500 TO 1599: 15.00-15.99",
      "1600 TO 1699: 16.00-16.99",
      "1700 TO 1799: 17.00-17.99",
      "1800 TO 1899: 18.00-18.99",
      "1900 TO 1999: 19.00-19.99",
      "2000 TO 2999: 20.00-29.99",
      "3000 TO 9999: 30.00+"))
  data$R1205300 <- factor(data$R1205300, 
    levels=c(1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0), 
    labels=c("Both biological parents",
      "Two parents, biological mother",
      "Two parents, biological father",
      "Biological mother only",
      "Biological father only",
      "Adoptive parent(s)",
      "Foster parent(s)",
      "No parents, grandparents",
      "No parents, other relatives",
      "Anything else"))
  data$R1211000 <- factor(data$R1211000, 
    levels=c(1.0,2.0,3.0,4.0), 
    labels=c("Public",
      "Parochial",
      "Private, not parochial",
      "Other"))
  data$R1217500 <- factor(data$R1217500, 
    levels=c(0.0,1.0,2.0), 
    labels=c("Rural",
      "Urban",
      "Unknown"))
  data$R1235800 <- factor(data$R1235800, 
    levels=c(0.0,1.0), 
    labels=c("Oversample",
      "Cross-sectional"))
  data$R1302400 <- factor(data$R1302400, 
    levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0,20.0,95.0), 
    labels=c("NONE",
      "1ST GRADE",
      "2ND GRADE",
      "3RD GRADE",
      "4TH GRADE",
      "5TH GRADE",
      "6TH GRADE",
      "7TH GRADE",
      "8TH GRADE",
      "9TH GRADE",
      "10TH GRADE",
      "11TH GRADE",
      "12TH GRADE",
      "1ST YEAR COLLEGE",
      "2ND YEAR COLLEGE",
      "3RD YEAR COLLEGE",
      "4TH YEAR COLLEGE",
      "5TH YEAR COLLEGE",
      "6TH YEAR COLLEGE",
      "7TH YEAR COLLEGE",
      "8TH YEAR COLLEGE OR MORE",
      "UNGRADED"))
  data$R1302500 <- factor(data$R1302500, 
    levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0,20.0,95.0), 
    labels=c("NONE",
      "1ST GRADE",
      "2ND GRADE",
      "3RD GRADE",
      "4TH GRADE",
      "5TH GRADE",
      "6TH GRADE",
      "7TH GRADE",
      "8TH GRADE",
      "9TH GRADE",
      "10TH GRADE",
      "11TH GRADE",
      "12TH GRADE",
      "1ST YEAR COLLEGE",
      "2ND YEAR COLLEGE",
      "3RD YEAR COLLEGE",
      "4TH YEAR COLLEGE",
      "5TH YEAR COLLEGE",
      "6TH YEAR COLLEGE",
      "7TH YEAR COLLEGE",
      "8TH YEAR COLLEGE OR MORE",
      "UNGRADED"))
  data$R1302600 <- factor(data$R1302600, 
    levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0,20.0,95.0), 
    labels=c("NONE",
      "1ST GRADE",
      "2ND GRADE",
      "3RD GRADE",
      "4TH GRADE",
      "5TH GRADE",
      "6TH GRADE",
      "7TH GRADE",
      "8TH GRADE",
      "9TH GRADE",
      "10TH GRADE",
      "11TH GRADE",
      "12TH GRADE",
      "1ST YEAR COLLEGE",
      "2ND YEAR COLLEGE",
      "3RD YEAR COLLEGE",
      "4TH YEAR COLLEGE",
      "5TH YEAR COLLEGE",
      "6TH YEAR COLLEGE",
      "7TH YEAR COLLEGE",
      "8TH YEAR COLLEGE OR MORE",
      "UNGRADED"))
  data$R1302700 <- factor(data$R1302700, 
    levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0,20.0,95.0), 
    labels=c("NONE",
      "1ST GRADE",
      "2ND GRADE",
      "3RD GRADE",
      "4TH GRADE",
      "5TH GRADE",
      "6TH GRADE",
      "7TH GRADE",
      "8TH GRADE",
      "9TH GRADE",
      "10TH GRADE",
      "11TH GRADE",
      "12TH GRADE",
      "1ST YEAR COLLEGE",
      "2ND YEAR COLLEGE",
      "3RD YEAR COLLEGE",
      "4TH YEAR COLLEGE",
      "5TH YEAR COLLEGE",
      "6TH YEAR COLLEGE",
      "7TH YEAR COLLEGE",
      "8TH YEAR COLLEGE OR MORE",
      "UNGRADED"))
  data$R1482600 <- factor(data$R1482600, 
    levels=c(1.0,2.0,3.0,4.0), 
    labels=c("Black",
      "Hispanic",
      "Mixed Race (Non-Hispanic)",
      "Non-Black / Non-Hispanic"))
  data$R5511500[1.0 <= data$R5511500 & data$R5511500 <= 2.0] <- 1.0
  data$R5511500[3.0 <= data$R5511500 & data$R5511500 <= 4.0] <- 3.0
  data$R5511500[5.0 <= data$R5511500 & data$R5511500 <= 6.0] <- 5.0
  data$R5511500[7.0 <= data$R5511500 & data$R5511500 <= 8.0] <- 7.0
  data$R5511500[9.0 <= data$R5511500 & data$R5511500 <= 10.0] <- 9.0
  data$R5511500 <- factor(data$R5511500, 
    levels=c(0.0,1.0,3.0,5.0,7.0,9.0), 
    labels=c("0",
      "1 TO 2",
      "3 TO 4",
      "5 TO 6",
      "7 TO 8",
      "9 TO 10"))
  return(data)
}

varlabels <- c("PUBID - YTH ID CODE 1997",
  "KEY!SEX (SYMBOL) 1997",
  "KEY!BDATE M/Y (SYMBOL) 1997",
  "KEY!BDATE M/Y (SYMBOL) 1997",
  "R EVER LIVE HARD TIMES? 1997",
  "CV_ENROLLSTAT 1997",
  "CV_GRADES_REPEAT_EVER 1997",
  "CV_INCOME_GROSS_YR 1997",
  "CV_HH_NET_WORTH_P 1997",
  "CV_HH_POV_RATIO 1997",
  "CV_YTH_REL_HH_CURRENT 1997",
  "CV_SCHOOL_TYPE 1997",
  "CV_URBAN-RURAL 1997",
  "CV_SAMPLE_TYPE 1997",
  "CV_HGC_BIO_DAD 1997",
  "CV_HGC_BIO_MOM 1997",
  "CV_HGC_RES_DAD 1997",
  "CV_HGC_RES_MOM 1997",
  "KEY!RACE_ETHNICITY (SYMBOL) 1997",
  "DELINQUENCY SCORE INDEX (DLI) 2000"
)


# Use qnames rather than rnums

qnames = function(data) {
  names(data) <- c("PUBID_1997",
    "KEY_SEX_1997",
    "KEY_BDATE_M_1997",
    "KEY_BDATE_Y_1997",
    "PC8-090_1997",
    "CV_ENROLLSTAT_1997",
    "CV_GRADES_REPEAT_EVER_1997",
    "CV_INCOME_GROSS_YR_1997",
    "CV_HH_NET_WORTH_P_1997",
    "CV_HH_POV_RATIO_1997",
    "CV_YTH_REL_HH_CURRENT_1997",
    "CV_SCHOOL_TYPE_1997",
    "CV_URBAN-RURAL_1997",
    "CV_SAMPLE_TYPE_1997",
    "CV_HGC_BIO_DAD_1997",
    "CV_HGC_BIO_MOM_1997",
    "CV_HGC_RES_DAD_1997",
    "CV_HGC_RES_MOM_1997",
    "KEY_RACE_ETHNICITY_1997",
    "FP_YYCRIMI_DLI_2000")
  return(data)
}


#********************************************************************************************************

# Remove the '#' before the following line to create a data file called "categories" with value labels. 
#categories <- vallabels(new_data)

# Remove the '#' before the following lines to rename variables using Qnames instead of Reference Numbers
#new_data <- qnames(new_data)
#categories <- qnames(categories)

# Produce summaries for the raw (uncategorized) data file
summary(new_data)

# Remove the '#' before the following lines to produce summaries for the "categories" data file.
#categories <- vallabels(new_data)
#summary(categories)

#************************************************************************************************************

