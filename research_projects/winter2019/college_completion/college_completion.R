
# Set working directory
# setwd()


new_data <- read.table('college_completion.dat', sep=' ')
names(new_data) <- c('R0000100',
  'R0536300',
  'R0536401',
  'R0536402',
  'R0538600',
  'R0538700',
  'R1204500',
  'R1204700',
  'R1205300',
  'R1235800',
  'R1302400',
  'R1302500',
  'R1302600',
  'R1302700',
  'R1482600',
  'Z9083800',
  'Z9083900',
  'Z9084200',
  'Z9084400',
  'Z9085100')


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
  data$Z9083800 <- factor(data$Z9083800, 
    levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0,20.0,95.0), 
    labels=c("None",
      "1st grade",
      "2nd grade",
      "3rd grade",
      "4th grade",
      "5th grade",
      "6th grade",
      "7th grade",
      "8th grade",
      "9th grade",
      "10th grade",
      "11th grade",
      "12th grade",
      "1st year college",
      "2nd year college",
      "3rd year college",
      "4th year college",
      "5th year college",
      "6th year college",
      "7th year college",
      "8th year college or more",
      "Ungraded"))
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
  data$Z9084200[0.0 <= data$Z9084200 & data$Z9084200 <= 200.0] <- 0.0
  data$Z9084200[201.0 <= data$Z9084200 & data$Z9084200 <= 220.0] <- 201.0
  data$Z9084200[221.0 <= data$Z9084200 & data$Z9084200 <= 240.0] <- 221.0
  data$Z9084200[241.0 <= data$Z9084200 & data$Z9084200 <= 260.0] <- 241.0
  data$Z9084200[261.0 <= data$Z9084200 & data$Z9084200 <= 280.0] <- 261.0
  data$Z9084200[281.0 <= data$Z9084200 & data$Z9084200 <= 300.0] <- 281.0
  data$Z9084200[301.0 <= data$Z9084200 & data$Z9084200 <= 320.0] <- 301.0
  data$Z9084200[321.0 <= data$Z9084200 & data$Z9084200 <= 340.0] <- 321.0
  data$Z9084200[341.0 <= data$Z9084200 & data$Z9084200 <= 360.0] <- 341.0
  data$Z9084200[361.0 <= data$Z9084200 & data$Z9084200 <= 380.0] <- 361.0
  data$Z9084200[381.0 <= data$Z9084200 & data$Z9084200 <= 400.0] <- 381.0
  data$Z9084200[401.0 <= data$Z9084200 & data$Z9084200 <= 420.0] <- 401.0
  data$Z9084200[421.0 <= data$Z9084200 & data$Z9084200 <= 440.0] <- 421.0
  data$Z9084200 <- factor(data$Z9084200, 
    levels=c(0.0,201.0,221.0,241.0,261.0,281.0,301.0,321.0,341.0,361.0,381.0,401.0,421.0), 
    labels=c("0 TO 200",
      "201 TO 220",
      "221 TO 240",
      "241 TO 260",
      "261 TO 280",
      "281 TO 300",
      "301 TO 320",
      "321 TO 340",
      "341 TO 360",
      "361 TO 380",
      "381 TO 400",
      "401 TO 420",
      "421 TO 440"))
  data$Z9084400[0.0 <= data$Z9084400 & data$Z9084400 <= 200.0] <- 0.0
  data$Z9084400[201.0 <= data$Z9084400 & data$Z9084400 <= 220.0] <- 201.0
  data$Z9084400[221.0 <= data$Z9084400 & data$Z9084400 <= 240.0] <- 221.0
  data$Z9084400[241.0 <= data$Z9084400 & data$Z9084400 <= 260.0] <- 241.0
  data$Z9084400[261.0 <= data$Z9084400 & data$Z9084400 <= 280.0] <- 261.0
  data$Z9084400[281.0 <= data$Z9084400 & data$Z9084400 <= 300.0] <- 281.0
  data$Z9084400[301.0 <= data$Z9084400 & data$Z9084400 <= 320.0] <- 301.0
  data$Z9084400[321.0 <= data$Z9084400 & data$Z9084400 <= 340.0] <- 321.0
  data$Z9084400[341.0 <= data$Z9084400 & data$Z9084400 <= 360.0] <- 341.0
  data$Z9084400[361.0 <= data$Z9084400 & data$Z9084400 <= 380.0] <- 361.0
  data$Z9084400[381.0 <= data$Z9084400 & data$Z9084400 <= 400.0] <- 381.0
  data$Z9084400[401.0 <= data$Z9084400 & data$Z9084400 <= 420.0] <- 401.0
  data$Z9084400[421.0 <= data$Z9084400 & data$Z9084400 <= 440.0] <- 421.0
  data$Z9084400 <- factor(data$Z9084400, 
    levels=c(0.0,201.0,221.0,241.0,261.0,281.0,301.0,321.0,341.0,361.0,381.0,401.0,421.0), 
    labels=c("0 TO 200",
      "201 TO 220",
      "221 TO 240",
      "241 TO 260",
      "261 TO 280",
      "281 TO 300",
      "301 TO 320",
      "321 TO 340",
      "341 TO 360",
      "361 TO 380",
      "381 TO 400",
      "401 TO 420",
      "421 TO 440"))
  data$Z9085100 <- factor(data$Z9085100, 
    levels=c(1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0), 
    labels=c("Round 1",
      "Round 2",
      "Round 3",
      "Round 4",
      "Round 5",
      "Round 6",
      "Round 7",
      "Round 8",
      "Round 9",
      "Round 10",
      "Round 11",
      "Round 12",
      "Round 13",
      "Round 14",
      "Round 15",
      "Round 16",
      "Round 17"))
  return(data)
}

varlabels <- c("PUBID - YTH ID CODE 1997",
  "KEY!SEX (SYMBOL) 1997",
  "KEY!BDATE M/Y (SYMBOL) 1997",
  "KEY!BDATE M/Y (SYMBOL) 1997",
  "KEY!ETHNICITY (SYMBOL) 1997",
  "KEY!RACE (SYMBOL) 1997",
  "CV_INCOME_GROSS_YR 1997",
  "CV_HH_NET_WORTH_P 1997",
  "CV_YTH_REL_HH_CURRENT 1997",
  "CV_SAMPLE_TYPE 1997",
  "CV_HGC_BIO_DAD 1997",
  "CV_HGC_BIO_MOM 1997",
  "CV_HGC_RES_DAD 1997",
  "CV_HGC_RES_MOM 1997",
  "KEY!RACE_ETHNICITY (SYMBOL) 1997",
  "CVC_HGC_EVER",
  "CVC_HIGHEST_DEGREE_EVER",
  "CVC_HS_DIPLOMA",
  "CVC_BA_DEGREE",
  "CVC_RND"
)


# Use qnames rather than rnums

qnames = function(data) {
  names(data) <- c("PUBID_1997",
    "KEY_SEX_1997",
    "KEY_BDATE_M_1997",
    "KEY_BDATE_Y_1997",
    "KEY_ETHNICITY_1997",
    "KEY_RACE_1997",
    "CV_INCOME_GROSS_YR_1997",
    "CV_HH_NET_WORTH_P_1997",
    "CV_YTH_REL_HH_CURRENT_1997",
    "CV_SAMPLE_TYPE_1997",
    "CV_HGC_BIO_DAD_1997",
    "CV_HGC_BIO_MOM_1997",
    "CV_HGC_RES_DAD_1997",
    "CV_HGC_RES_MOM_1997",
    "KEY_RACE_ETHNICITY_1997",
    "CVC_HGC_EVER_XRND",
    "CVC_HIGHEST_DEGREE_EVER_XRND",
    "CVC_HS_DIPLOMA_XRND",
    "CVC_BA_DEGREE_XRND",
    "CVC_RND_XRND")
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

