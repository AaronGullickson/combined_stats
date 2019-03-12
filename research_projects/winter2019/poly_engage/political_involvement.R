
# Set working directory
# setwd()


new_data <- read.table('political_involvement.dat', sep=' ')
names(new_data) <- c('R0000100',
  'R0323600',
  'R0323800',
  'R0536300',
  'R0536401',
  'R0536402',
  'R0538600',
  'R0538700',
  'R1204500',
  'R1204700',
  'R1205300',
  'R1217500',
  'R1302400',
  'R1302500',
  'R1302600',
  'R1302700',
  'R1485600',
  'S4921000',
  'S4921100',
  'Z9083900')


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
  data$R0323600 <- factor(data$R0323600, 
    levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0), 
    labels=c("0",
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7"))
  data$R0323800 <- factor(data$R0323800, 
    levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0), 
    labels=c("0",
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7"))
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
  data$R0538600 <- factor(data$R0538600, 
    levels=c(0.0,1.0), 
    labels=c("No",
      "Yes"))
  data$R0538700 <- factor(data$R0538700, 
    levels=c(0.0,1.0,2.0,3.0,4.0,5.0), 
    labels=c("No information",
      "White",
      "Black or African American",
      "American Indian, Eskimo, or Aleut",
      "Asian or Pacific Islander",
      "Something else? (SPECIFY)"))
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
  data$R1217500 <- factor(data$R1217500, 
    levels=c(0.0,1.0,2.0), 
    labels=c("Rural",
      "Urban",
      "Unknown"))
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
  data$R1485600[0.0 <= data$R1485600 & data$R1485600 <= 4.0] <- 0.0
  data$R1485600[5.0 <= data$R1485600 & data$R1485600 <= 8.0] <- 5.0
  data$R1485600[9.0 <= data$R1485600 & data$R1485600 <= 12.0] <- 9.0
  data$R1485600[13.0 <= data$R1485600 & data$R1485600 <= 16.0] <- 13.0
  data$R1485600[17.0 <= data$R1485600 & data$R1485600 <= 20.0] <- 17.0
  data$R1485600[21.0 <= data$R1485600 & data$R1485600 <= 24.0] <- 21.0
  data$R1485600[25.0 <= data$R1485600 & data$R1485600 <= 28.0] <- 25.0
  data$R1485600 <- factor(data$R1485600, 
    levels=c(0.0,5.0,9.0,13.0,17.0,21.0,25.0), 
    labels=c("0 TO 4",
      "5 TO 8",
      "9 TO 12",
      "13 TO 16",
      "17 TO 20",
      "21 TO 24",
      "25 TO 28"))
  data$S4921000 <- factor(data$S4921000, 
    levels=c(1.0,2.0,3.0,4.0), 
    labels=c("MOST OF THE TIME",
      "SOME OF THE TIME",
      "ONLY NOW AND THEN",
      "HARDLY AT ALL"))
  data$S4921100 <- factor(data$S4921100, 
    levels=c(1.0,2.0,3.0,4.0,5.0), 
    labels=c("I DID NOT VOTE (IN THE ELECTION THIS NOVEMBER)",
      "I THOUGHT ABOUT VOTING THIS TIME, BUT DIDN'T",
      "I USUALLY VOTE, BUT DIDN'T THIS TIME",
      "I AM SURE I VOTED",
      "R NOT ELIGIBLE TO VOTE"))
  data$Z9083900 <- factor(data$Z9083900, 
    levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0), 
    labels=c("None",
      "GED",
      "High school diploma (Regular 12 year program)",
      "Associate/Junior college (AA)",
      "Bachelor's degree (BA, BS)",
      "Master's degree (MA, MS)",
      "PhD",
      "Professional degree (DDS, JD, MD)"))
  return(data)
}

varlabels <- c("PUBID - YTH ID CODE 1997",
  "# DAYS/WK TYP EAT WITH FAM 1997",
  "# DAYS/WK TYP FAM FUN 1997",
  "KEY!SEX (SYMBOL) 1997",
  "KEY!BDATE M/Y (SYMBOL) 1997",
  "KEY!BDATE M/Y (SYMBOL) 1997",
  "KEY!ETHNICITY (SYMBOL) 1997",
  "KEY!RACE (SYMBOL) 1997",
  "CV_INCOME_GROSS_YR 1997",
  "CV_HH_NET_WORTH_P 1997",
  "CV_YTH_REL_HH_CURRENT 1997",
  "CV_URBAN-RURAL 1997",
  "CV_HGC_BIO_DAD 1997",
  "CV_HGC_BIO_MOM 1997",
  "CV_HGC_RES_DAD 1997",
  "CV_HGC_RES_MOM 1997",
  "INDEX OF FAMILY ROUTINES, YTH RPT 1997",
  "INTEREST IN GOVT AND PUB AFFAIRS 2004",
  "DID R VOTE IN NOVEMBER, 2004? 2004",
  "CVC_HIGHEST_DEGREE_EVER"
)


# Use qnames rather than rnums

qnames = function(data) {
  names(data) <- c("PUBID_1997",
    "YSAQ-007_1997",
    "YSAQ-009_1997",
    "KEY_SEX_1997",
    "KEY_BDATE_M_1997",
    "KEY_BDATE_Y_1997",
    "KEY_ETHNICITY_1997",
    "KEY_RACE_1997",
    "CV_INCOME_GROSS_YR_1997",
    "CV_HH_NET_WORTH_P_1997",
    "CV_YTH_REL_HH_CURRENT_1997",
    "CV_URBAN-RURAL_1997",
    "CV_HGC_BIO_DAD_1997",
    "CV_HGC_BIO_MOM_1997",
    "CV_HGC_RES_DAD_1997",
    "CV_HGC_RES_MOM_1997",
    "FP_YHROUTIN_1997",
    "YPOL-105_2004",
    "YPOL-110_2004",
    "CVC_HIGHEST_DEGREE_EVER_XRND")
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

