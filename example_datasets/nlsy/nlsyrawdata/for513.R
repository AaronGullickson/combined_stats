
# Set working directory
# setwd()


new_data <- read.table('for513.dat', sep=' ')
names(new_data) <- c('E5281700',
  'R0000100',
  'R0034200',
  'R0536300',
  'R0536401',
  'R0536402',
  'R0538700',
  'R1193900',
  'R1194100',
  'R1204500',
  'R1205300',
  'R1209300',
  'R1235800',
  'R1482600',
  'R2553400',
  'R2553500',
  'R2563300',
  'R2563600',
  'R2568200',
  'R3876200',
  'R3876300',
  'R3884900',
  'R3885200',
  'R3890100',
  'R5464100',
  'R5464400',
  'R5472200',
  'R7227800',
  'R7228100',
  'R7236000',
  'S1541700',
  'S1542000',
  'S1550800',
  'T8122500',
  'Z9083800',
  'Z9083900',
  'Z9084800',
  'Z9084900',
  'Z9085000')


# Handle missing values

  new_data[new_data == -1] = NA  # Refused 
  new_data[new_data == -2] = NA  # Dont know 
  new_data[new_data == -3] = NA  # Invalid missing 
  new_data[new_data == -4] = NA  # Valid missing 
  new_data[new_data == -5] = NA  # Non-interview 


# If there are values not categorized they will be represented as NA

vallabels = function(data) {
  data$E5281700 <- factor(data$E5281700, 
    levels=c(1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0,20.0,21.0,91.0,92.0,93.0,95.0), 
    labels=c("1st grade",
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
      "1st year of college",
      "2nd year of college",
      "3rd year of college",
      "4th year of college",
      "5th year of college",
      "6th year of college",
      "7th year of college",
      "8th year of college",
      "9th year of college",
      "Kindergarten - 1st year",
      "Kindergarten - 2nd year",
      "Head Start",
      "Ungraded"))
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
  data$R0034200 <- factor(data$R0034200, 
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
  data$R0538700 <- factor(data$R0538700, 
    levels=c(0.0,1.0,2.0,3.0,4.0,5.0), 
    labels=c("No information",
      "White",
      "Black or African American",
      "American Indian, Eskimo, or Aleut",
      "Asian or Pacific Islander",
      "Something else? (SPECIFY)"))
  data$R1193900[0.0 <= data$R1193900 & data$R1193900 <= 139.0] <- 0.0
  data$R1193900[140.0 <= data$R1193900 & data$R1193900 <= 150.0] <- 140.0
  data$R1193900[151.0 <= data$R1193900 & data$R1193900 <= 160.0] <- 151.0
  data$R1193900[161.0 <= data$R1193900 & data$R1193900 <= 170.0] <- 161.0
  data$R1193900[171.0 <= data$R1193900 & data$R1193900 <= 180.0] <- 171.0
  data$R1193900[181.0 <= data$R1193900 & data$R1193900 <= 190.0] <- 181.0
  data$R1193900[191.0 <= data$R1193900 & data$R1193900 <= 200.0] <- 191.0
  data$R1193900[201.0 <= data$R1193900 & data$R1193900 <= 210.0] <- 201.0
  data$R1193900[211.0 <= data$R1193900 & data$R1193900 <= 220.0] <- 211.0
  data$R1193900[221.0 <= data$R1193900 & data$R1193900 <= 230.0] <- 221.0
  data$R1193900 <- factor(data$R1193900, 
    levels=c(0.0,140.0,151.0,161.0,171.0,181.0,191.0,201.0,211.0,221.0), 
    labels=c("0 TO 139: <140",
      "140 TO 150",
      "151 TO 160",
      "161 TO 170",
      "171 TO 180",
      "181 TO 190",
      "191 TO 200",
      "201 TO 210",
      "211 TO 220",
      "221 TO 230"))
  data$R1194100[0.0 <= data$R1194100 & data$R1194100 <= 11.0] <- 0.0
  data$R1194100[19.0 <= data$R1194100 & data$R1194100 <= 999.0] <- 19.0
  data$R1194100 <- factor(data$R1194100, 
    levels=c(0.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0), 
    labels=c("0 TO 11: LESS THAN 12",
      "12",
      "13",
      "14",
      "15",
      "16",
      "17",
      "18",
      "19 TO 999: GREATER THAN 18"))
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
  data$R1209300[0.0 <= data$R1209300 & data$R1209300 <= 139.0] <- 0.0
  data$R1209300[140.0 <= data$R1209300 & data$R1209300 <= 150.0] <- 140.0
  data$R1209300[151.0 <= data$R1209300 & data$R1209300 <= 160.0] <- 151.0
  data$R1209300[161.0 <= data$R1209300 & data$R1209300 <= 170.0] <- 161.0
  data$R1209300[171.0 <= data$R1209300 & data$R1209300 <= 180.0] <- 171.0
  data$R1209300[181.0 <= data$R1209300 & data$R1209300 <= 190.0] <- 181.0
  data$R1209300[191.0 <= data$R1209300 & data$R1209300 <= 200.0] <- 191.0
  data$R1209300[201.0 <= data$R1209300 & data$R1209300 <= 210.0] <- 201.0
  data$R1209300[211.0 <= data$R1209300 & data$R1209300 <= 220.0] <- 211.0
  data$R1209300[221.0 <= data$R1209300 & data$R1209300 <= 230.0] <- 221.0
  data$R1209300 <- factor(data$R1209300, 
    levels=c(0.0,140.0,151.0,161.0,171.0,181.0,191.0,201.0,211.0,221.0), 
    labels=c("0 TO 139: <140",
      "140 TO 150",
      "151 TO 160",
      "161 TO 170",
      "171 TO 180",
      "181 TO 190",
      "191 TO 200",
      "201 TO 210",
      "211 TO 220",
      "221 TO 230"))
  data$R1235800 <- factor(data$R1235800, 
    levels=c(0.0,1.0), 
    labels=c("Oversample",
      "Cross-sectional"))
  data$R1482600 <- factor(data$R1482600, 
    levels=c(1.0,2.0,3.0,4.0), 
    labels=c("Black",
      "Hispanic",
      "Mixed Race (Non-Hispanic)",
      "Non-Black / Non-Hispanic"))
  data$R2553400[0.0 <= data$R2553400 & data$R2553400 <= 139.0] <- 0.0
  data$R2553400[140.0 <= data$R2553400 & data$R2553400 <= 150.0] <- 140.0
  data$R2553400[151.0 <= data$R2553400 & data$R2553400 <= 160.0] <- 151.0
  data$R2553400[161.0 <= data$R2553400 & data$R2553400 <= 170.0] <- 161.0
  data$R2553400[171.0 <= data$R2553400 & data$R2553400 <= 180.0] <- 171.0
  data$R2553400[181.0 <= data$R2553400 & data$R2553400 <= 190.0] <- 181.0
  data$R2553400[191.0 <= data$R2553400 & data$R2553400 <= 200.0] <- 191.0
  data$R2553400[201.0 <= data$R2553400 & data$R2553400 <= 210.0] <- 201.0
  data$R2553400[211.0 <= data$R2553400 & data$R2553400 <= 220.0] <- 211.0
  data$R2553400[221.0 <= data$R2553400 & data$R2553400 <= 230.0] <- 221.0
  data$R2553400[231.0 <= data$R2553400 & data$R2553400 <= 240.0] <- 231.0
  data$R2553400 <- factor(data$R2553400, 
    levels=c(0.0,140.0,151.0,161.0,171.0,181.0,191.0,201.0,211.0,221.0,231.0), 
    labels=c("0 TO 139: <140",
      "140 TO 150",
      "151 TO 160",
      "161 TO 170",
      "171 TO 180",
      "181 TO 190",
      "191 TO 200",
      "201 TO 210",
      "211 TO 220",
      "221 TO 230",
      "231 TO 240"))
  data$R2553500[0.0 <= data$R2553500 & data$R2553500 <= 11.0] <- 0.0
  data$R2553500[19.0 <= data$R2553500 & data$R2553500 <= 999.0] <- 19.0
  data$R2553500 <- factor(data$R2553500, 
    levels=c(0.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0), 
    labels=c("0 TO 11: LESS THAN 12",
      "12",
      "13",
      "14",
      "15",
      "16",
      "17",
      "18",
      "19 TO 999: GREATER THAN 18"))
  data$R2563300[-999999.0 <= data$R2563300 & data$R2563300 <= -3000.0] <- -999999.0
  data$R2563300[-2999.0 <= data$R2563300 & data$R2563300 <= -2000.0] <- -2999.0
  data$R2563300[-1999.0 <= data$R2563300 & data$R2563300 <= -1000.0] <- -1999.0
  data$R2563300[-999.0 <= data$R2563300 & data$R2563300 <= -1.0] <- -999.0
  data$R2563300[1.0 <= data$R2563300 & data$R2563300 <= 1000.0] <- 1.0
  data$R2563300[1001.0 <= data$R2563300 & data$R2563300 <= 2000.0] <- 1001.0
  data$R2563300[2001.0 <= data$R2563300 & data$R2563300 <= 3000.0] <- 2001.0
  data$R2563300[3001.0 <= data$R2563300 & data$R2563300 <= 5000.0] <- 3001.0
  data$R2563300[5001.0 <= data$R2563300 & data$R2563300 <= 10000.0] <- 5001.0
  data$R2563300[10001.0 <= data$R2563300 & data$R2563300 <= 20000.0] <- 10001.0
  data$R2563300[20001.0 <= data$R2563300 & data$R2563300 <= 30000.0] <- 20001.0
  data$R2563300[30001.0 <= data$R2563300 & data$R2563300 <= 40000.0] <- 30001.0
  data$R2563300[40001.0 <= data$R2563300 & data$R2563300 <= 50000.0] <- 40001.0
  data$R2563300[50001.0 <= data$R2563300 & data$R2563300 <= 65000.0] <- 50001.0
  data$R2563300[65001.0 <= data$R2563300 & data$R2563300 <= 80000.0] <- 65001.0
  data$R2563300[80001.0 <= data$R2563300 & data$R2563300 <= 100000.0] <- 80001.0
  data$R2563300[100001.0 <= data$R2563300 & data$R2563300 <= 150000.0] <- 100001.0
  data$R2563300[150001.0 <= data$R2563300 & data$R2563300 <= 200000.0] <- 150001.0
  data$R2563300[200001.0 <= data$R2563300 & data$R2563300 <= 999999.0] <- 200001.0
  data$R2563300 <- factor(data$R2563300, 
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
  data$R2563600 <- factor(data$R2563600, 
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
  data$R2568200[0.0 <= data$R2568200 & data$R2568200 <= 139.0] <- 0.0
  data$R2568200[140.0 <= data$R2568200 & data$R2568200 <= 150.0] <- 140.0
  data$R2568200[151.0 <= data$R2568200 & data$R2568200 <= 160.0] <- 151.0
  data$R2568200[161.0 <= data$R2568200 & data$R2568200 <= 170.0] <- 161.0
  data$R2568200[171.0 <= data$R2568200 & data$R2568200 <= 180.0] <- 171.0
  data$R2568200[181.0 <= data$R2568200 & data$R2568200 <= 190.0] <- 181.0
  data$R2568200[191.0 <= data$R2568200 & data$R2568200 <= 200.0] <- 191.0
  data$R2568200[201.0 <= data$R2568200 & data$R2568200 <= 210.0] <- 201.0
  data$R2568200[211.0 <= data$R2568200 & data$R2568200 <= 220.0] <- 211.0
  data$R2568200[221.0 <= data$R2568200 & data$R2568200 <= 230.0] <- 221.0
  data$R2568200[231.0 <= data$R2568200 & data$R2568200 <= 240.0] <- 231.0
  data$R2568200 <- factor(data$R2568200, 
    levels=c(0.0,140.0,151.0,161.0,171.0,181.0,191.0,201.0,211.0,221.0,231.0), 
    labels=c("0 TO 139: <140",
      "140 TO 150",
      "151 TO 160",
      "161 TO 170",
      "171 TO 180",
      "181 TO 190",
      "191 TO 200",
      "201 TO 210",
      "211 TO 220",
      "221 TO 230",
      "231 TO 240"))
  data$R3876200[0.0 <= data$R3876200 & data$R3876200 <= 139.0] <- 0.0
  data$R3876200[140.0 <= data$R3876200 & data$R3876200 <= 150.0] <- 140.0
  data$R3876200[151.0 <= data$R3876200 & data$R3876200 <= 160.0] <- 151.0
  data$R3876200[161.0 <= data$R3876200 & data$R3876200 <= 170.0] <- 161.0
  data$R3876200[171.0 <= data$R3876200 & data$R3876200 <= 180.0] <- 171.0
  data$R3876200[181.0 <= data$R3876200 & data$R3876200 <= 190.0] <- 181.0
  data$R3876200[191.0 <= data$R3876200 & data$R3876200 <= 200.0] <- 191.0
  data$R3876200[201.0 <= data$R3876200 & data$R3876200 <= 210.0] <- 201.0
  data$R3876200[211.0 <= data$R3876200 & data$R3876200 <= 220.0] <- 211.0
  data$R3876200[221.0 <= data$R3876200 & data$R3876200 <= 230.0] <- 221.0
  data$R3876200[231.0 <= data$R3876200 & data$R3876200 <= 240.0] <- 231.0
  data$R3876200[241.0 <= data$R3876200 & data$R3876200 <= 250.0] <- 241.0
  data$R3876200 <- factor(data$R3876200, 
    levels=c(0.0,140.0,151.0,161.0,171.0,181.0,191.0,201.0,211.0,221.0,231.0,241.0), 
    labels=c("0 TO 139: <140",
      "140 TO 150",
      "151 TO 160",
      "161 TO 170",
      "171 TO 180",
      "181 TO 190",
      "191 TO 200",
      "201 TO 210",
      "211 TO 220",
      "221 TO 230",
      "231 TO 240",
      "241 TO 250"))
  data$R3876300[0.0 <= data$R3876300 & data$R3876300 <= 11.0] <- 0.0
  data$R3876300[19.0 <= data$R3876300 & data$R3876300 <= 999.0] <- 19.0
  data$R3876300 <- factor(data$R3876300, 
    levels=c(0.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0), 
    labels=c("0 TO 11: LESS THAN 12",
      "12",
      "13",
      "14",
      "15",
      "16",
      "17",
      "18",
      "19 TO 999: GREATER THAN 18"))
  data$R3884900[-999999.0 <= data$R3884900 & data$R3884900 <= -3000.0] <- -999999.0
  data$R3884900[-2999.0 <= data$R3884900 & data$R3884900 <= -2000.0] <- -2999.0
  data$R3884900[-1999.0 <= data$R3884900 & data$R3884900 <= -1000.0] <- -1999.0
  data$R3884900[-999.0 <= data$R3884900 & data$R3884900 <= -1.0] <- -999.0
  data$R3884900[1.0 <= data$R3884900 & data$R3884900 <= 1000.0] <- 1.0
  data$R3884900[1001.0 <= data$R3884900 & data$R3884900 <= 2000.0] <- 1001.0
  data$R3884900[2001.0 <= data$R3884900 & data$R3884900 <= 3000.0] <- 2001.0
  data$R3884900[3001.0 <= data$R3884900 & data$R3884900 <= 5000.0] <- 3001.0
  data$R3884900[5001.0 <= data$R3884900 & data$R3884900 <= 10000.0] <- 5001.0
  data$R3884900[10001.0 <= data$R3884900 & data$R3884900 <= 20000.0] <- 10001.0
  data$R3884900[20001.0 <= data$R3884900 & data$R3884900 <= 30000.0] <- 20001.0
  data$R3884900[30001.0 <= data$R3884900 & data$R3884900 <= 40000.0] <- 30001.0
  data$R3884900[40001.0 <= data$R3884900 & data$R3884900 <= 50000.0] <- 40001.0
  data$R3884900[50001.0 <= data$R3884900 & data$R3884900 <= 65000.0] <- 50001.0
  data$R3884900[65001.0 <= data$R3884900 & data$R3884900 <= 80000.0] <- 65001.0
  data$R3884900[80001.0 <= data$R3884900 & data$R3884900 <= 100000.0] <- 80001.0
  data$R3884900[100001.0 <= data$R3884900 & data$R3884900 <= 150000.0] <- 100001.0
  data$R3884900[150001.0 <= data$R3884900 & data$R3884900 <= 200000.0] <- 150001.0
  data$R3884900[200001.0 <= data$R3884900 & data$R3884900 <= 999999.0] <- 200001.0
  data$R3884900 <- factor(data$R3884900, 
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
  data$R3885200 <- factor(data$R3885200, 
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
  data$R3890100[0.0 <= data$R3890100 & data$R3890100 <= 139.0] <- 0.0
  data$R3890100[140.0 <= data$R3890100 & data$R3890100 <= 150.0] <- 140.0
  data$R3890100[151.0 <= data$R3890100 & data$R3890100 <= 160.0] <- 151.0
  data$R3890100[161.0 <= data$R3890100 & data$R3890100 <= 170.0] <- 161.0
  data$R3890100[171.0 <= data$R3890100 & data$R3890100 <= 180.0] <- 171.0
  data$R3890100[181.0 <= data$R3890100 & data$R3890100 <= 190.0] <- 181.0
  data$R3890100[191.0 <= data$R3890100 & data$R3890100 <= 200.0] <- 191.0
  data$R3890100[201.0 <= data$R3890100 & data$R3890100 <= 210.0] <- 201.0
  data$R3890100[211.0 <= data$R3890100 & data$R3890100 <= 220.0] <- 211.0
  data$R3890100[221.0 <= data$R3890100 & data$R3890100 <= 230.0] <- 221.0
  data$R3890100[231.0 <= data$R3890100 & data$R3890100 <= 240.0] <- 231.0
  data$R3890100[241.0 <= data$R3890100 & data$R3890100 <= 250.0] <- 241.0
  data$R3890100 <- factor(data$R3890100, 
    levels=c(0.0,140.0,151.0,161.0,171.0,181.0,191.0,201.0,211.0,221.0,231.0,241.0), 
    labels=c("0 TO 139: <140",
      "140 TO 150",
      "151 TO 160",
      "161 TO 170",
      "171 TO 180",
      "181 TO 190",
      "191 TO 200",
      "201 TO 210",
      "211 TO 220",
      "221 TO 230",
      "231 TO 240",
      "241 TO 250"))
  data$R5464100[-999999.0 <= data$R5464100 & data$R5464100 <= -3000.0] <- -999999.0
  data$R5464100[-2999.0 <= data$R5464100 & data$R5464100 <= -2000.0] <- -2999.0
  data$R5464100[-1999.0 <= data$R5464100 & data$R5464100 <= -1000.0] <- -1999.0
  data$R5464100[-999.0 <= data$R5464100 & data$R5464100 <= -1.0] <- -999.0
  data$R5464100[1.0 <= data$R5464100 & data$R5464100 <= 1000.0] <- 1.0
  data$R5464100[1001.0 <= data$R5464100 & data$R5464100 <= 2000.0] <- 1001.0
  data$R5464100[2001.0 <= data$R5464100 & data$R5464100 <= 3000.0] <- 2001.0
  data$R5464100[3001.0 <= data$R5464100 & data$R5464100 <= 5000.0] <- 3001.0
  data$R5464100[5001.0 <= data$R5464100 & data$R5464100 <= 10000.0] <- 5001.0
  data$R5464100[10001.0 <= data$R5464100 & data$R5464100 <= 20000.0] <- 10001.0
  data$R5464100[20001.0 <= data$R5464100 & data$R5464100 <= 30000.0] <- 20001.0
  data$R5464100[30001.0 <= data$R5464100 & data$R5464100 <= 40000.0] <- 30001.0
  data$R5464100[40001.0 <= data$R5464100 & data$R5464100 <= 50000.0] <- 40001.0
  data$R5464100[50001.0 <= data$R5464100 & data$R5464100 <= 65000.0] <- 50001.0
  data$R5464100[65001.0 <= data$R5464100 & data$R5464100 <= 80000.0] <- 65001.0
  data$R5464100[80001.0 <= data$R5464100 & data$R5464100 <= 100000.0] <- 80001.0
  data$R5464100[100001.0 <= data$R5464100 & data$R5464100 <= 150000.0] <- 100001.0
  data$R5464100[150001.0 <= data$R5464100 & data$R5464100 <= 200000.0] <- 150001.0
  data$R5464100[200001.0 <= data$R5464100 & data$R5464100 <= 999999.0] <- 200001.0
  data$R5464100 <- factor(data$R5464100, 
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
  data$R5464400 <- factor(data$R5464400, 
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
  data$R5472200[0.0 <= data$R5472200 & data$R5472200 <= 139.0] <- 0.0
  data$R5472200[140.0 <= data$R5472200 & data$R5472200 <= 150.0] <- 140.0
  data$R5472200[151.0 <= data$R5472200 & data$R5472200 <= 160.0] <- 151.0
  data$R5472200[161.0 <= data$R5472200 & data$R5472200 <= 170.0] <- 161.0
  data$R5472200[171.0 <= data$R5472200 & data$R5472200 <= 180.0] <- 171.0
  data$R5472200[181.0 <= data$R5472200 & data$R5472200 <= 190.0] <- 181.0
  data$R5472200[191.0 <= data$R5472200 & data$R5472200 <= 200.0] <- 191.0
  data$R5472200[201.0 <= data$R5472200 & data$R5472200 <= 210.0] <- 201.0
  data$R5472200[211.0 <= data$R5472200 & data$R5472200 <= 220.0] <- 211.0
  data$R5472200[221.0 <= data$R5472200 & data$R5472200 <= 230.0] <- 221.0
  data$R5472200[231.0 <= data$R5472200 & data$R5472200 <= 240.0] <- 231.0
  data$R5472200[241.0 <= data$R5472200 & data$R5472200 <= 250.0] <- 241.0
  data$R5472200[251.0 <= data$R5472200 & data$R5472200 <= 260.0] <- 251.0
  data$R5472200 <- factor(data$R5472200, 
    levels=c(0.0,140.0,151.0,161.0,171.0,181.0,191.0,201.0,211.0,221.0,231.0,241.0,251.0), 
    labels=c("0 TO 139: <140",
      "140 TO 150",
      "151 TO 160",
      "161 TO 170",
      "171 TO 180",
      "181 TO 190",
      "191 TO 200",
      "201 TO 210",
      "211 TO 220",
      "221 TO 230",
      "231 TO 240",
      "241 TO 250",
      "251 TO 260"))
  data$R7227800[-999999.0 <= data$R7227800 & data$R7227800 <= -3000.0] <- -999999.0
  data$R7227800[-2999.0 <= data$R7227800 & data$R7227800 <= -2000.0] <- -2999.0
  data$R7227800[-1999.0 <= data$R7227800 & data$R7227800 <= -1000.0] <- -1999.0
  data$R7227800[-999.0 <= data$R7227800 & data$R7227800 <= -1.0] <- -999.0
  data$R7227800[1.0 <= data$R7227800 & data$R7227800 <= 1000.0] <- 1.0
  data$R7227800[1001.0 <= data$R7227800 & data$R7227800 <= 2000.0] <- 1001.0
  data$R7227800[2001.0 <= data$R7227800 & data$R7227800 <= 3000.0] <- 2001.0
  data$R7227800[3001.0 <= data$R7227800 & data$R7227800 <= 5000.0] <- 3001.0
  data$R7227800[5001.0 <= data$R7227800 & data$R7227800 <= 10000.0] <- 5001.0
  data$R7227800[10001.0 <= data$R7227800 & data$R7227800 <= 20000.0] <- 10001.0
  data$R7227800[20001.0 <= data$R7227800 & data$R7227800 <= 30000.0] <- 20001.0
  data$R7227800[30001.0 <= data$R7227800 & data$R7227800 <= 40000.0] <- 30001.0
  data$R7227800[40001.0 <= data$R7227800 & data$R7227800 <= 50000.0] <- 40001.0
  data$R7227800[50001.0 <= data$R7227800 & data$R7227800 <= 65000.0] <- 50001.0
  data$R7227800[65001.0 <= data$R7227800 & data$R7227800 <= 80000.0] <- 65001.0
  data$R7227800[80001.0 <= data$R7227800 & data$R7227800 <= 100000.0] <- 80001.0
  data$R7227800[100001.0 <= data$R7227800 & data$R7227800 <= 150000.0] <- 100001.0
  data$R7227800[150001.0 <= data$R7227800 & data$R7227800 <= 200000.0] <- 150001.0
  data$R7227800[200001.0 <= data$R7227800 & data$R7227800 <= 999999.0] <- 200001.0
  data$R7227800 <- factor(data$R7227800, 
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
  data$R7228100 <- factor(data$R7228100, 
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
  data$R7236000[0.0 <= data$R7236000 & data$R7236000 <= 139.0] <- 0.0
  data$R7236000[140.0 <= data$R7236000 & data$R7236000 <= 150.0] <- 140.0
  data$R7236000[151.0 <= data$R7236000 & data$R7236000 <= 160.0] <- 151.0
  data$R7236000[161.0 <= data$R7236000 & data$R7236000 <= 170.0] <- 161.0
  data$R7236000[171.0 <= data$R7236000 & data$R7236000 <= 180.0] <- 171.0
  data$R7236000[181.0 <= data$R7236000 & data$R7236000 <= 190.0] <- 181.0
  data$R7236000[191.0 <= data$R7236000 & data$R7236000 <= 200.0] <- 191.0
  data$R7236000[201.0 <= data$R7236000 & data$R7236000 <= 210.0] <- 201.0
  data$R7236000[211.0 <= data$R7236000 & data$R7236000 <= 220.0] <- 211.0
  data$R7236000[221.0 <= data$R7236000 & data$R7236000 <= 230.0] <- 221.0
  data$R7236000[231.0 <= data$R7236000 & data$R7236000 <= 240.0] <- 231.0
  data$R7236000[241.0 <= data$R7236000 & data$R7236000 <= 250.0] <- 241.0
  data$R7236000[251.0 <= data$R7236000 & data$R7236000 <= 260.0] <- 251.0
  data$R7236000[261.0 <= data$R7236000 & data$R7236000 <= 270.0] <- 261.0
  data$R7236000 <- factor(data$R7236000, 
    levels=c(0.0,140.0,151.0,161.0,171.0,181.0,191.0,201.0,211.0,221.0,231.0,241.0,251.0,261.0), 
    labels=c("0 TO 139: <140",
      "140 TO 150",
      "151 TO 160",
      "161 TO 170",
      "171 TO 180",
      "181 TO 190",
      "191 TO 200",
      "201 TO 210",
      "211 TO 220",
      "221 TO 230",
      "231 TO 240",
      "241 TO 250",
      "251 TO 260",
      "261 TO 270"))
  data$S1541700[-999999.0 <= data$S1541700 & data$S1541700 <= -3000.0] <- -999999.0
  data$S1541700[-2999.0 <= data$S1541700 & data$S1541700 <= -2000.0] <- -2999.0
  data$S1541700[-1999.0 <= data$S1541700 & data$S1541700 <= -1000.0] <- -1999.0
  data$S1541700[-999.0 <= data$S1541700 & data$S1541700 <= -1.0] <- -999.0
  data$S1541700[1.0 <= data$S1541700 & data$S1541700 <= 1000.0] <- 1.0
  data$S1541700[1001.0 <= data$S1541700 & data$S1541700 <= 2000.0] <- 1001.0
  data$S1541700[2001.0 <= data$S1541700 & data$S1541700 <= 3000.0] <- 2001.0
  data$S1541700[3001.0 <= data$S1541700 & data$S1541700 <= 5000.0] <- 3001.0
  data$S1541700[5001.0 <= data$S1541700 & data$S1541700 <= 10000.0] <- 5001.0
  data$S1541700[10001.0 <= data$S1541700 & data$S1541700 <= 20000.0] <- 10001.0
  data$S1541700[20001.0 <= data$S1541700 & data$S1541700 <= 30000.0] <- 20001.0
  data$S1541700[30001.0 <= data$S1541700 & data$S1541700 <= 40000.0] <- 30001.0
  data$S1541700[40001.0 <= data$S1541700 & data$S1541700 <= 50000.0] <- 40001.0
  data$S1541700[50001.0 <= data$S1541700 & data$S1541700 <= 65000.0] <- 50001.0
  data$S1541700[65001.0 <= data$S1541700 & data$S1541700 <= 80000.0] <- 65001.0
  data$S1541700[80001.0 <= data$S1541700 & data$S1541700 <= 100000.0] <- 80001.0
  data$S1541700[100001.0 <= data$S1541700 & data$S1541700 <= 150000.0] <- 100001.0
  data$S1541700[150001.0 <= data$S1541700 & data$S1541700 <= 200000.0] <- 150001.0
  data$S1541700[200001.0 <= data$S1541700 & data$S1541700 <= 999999.0] <- 200001.0
  data$S1541700 <- factor(data$S1541700, 
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
  data$S1542000 <- factor(data$S1542000, 
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
  data$S1550800[0.0 <= data$S1550800 & data$S1550800 <= 139.0] <- 0.0
  data$S1550800[140.0 <= data$S1550800 & data$S1550800 <= 150.0] <- 140.0
  data$S1550800[151.0 <= data$S1550800 & data$S1550800 <= 160.0] <- 151.0
  data$S1550800[161.0 <= data$S1550800 & data$S1550800 <= 170.0] <- 161.0
  data$S1550800[171.0 <= data$S1550800 & data$S1550800 <= 180.0] <- 171.0
  data$S1550800[181.0 <= data$S1550800 & data$S1550800 <= 190.0] <- 181.0
  data$S1550800[191.0 <= data$S1550800 & data$S1550800 <= 200.0] <- 191.0
  data$S1550800[201.0 <= data$S1550800 & data$S1550800 <= 210.0] <- 201.0
  data$S1550800[211.0 <= data$S1550800 & data$S1550800 <= 220.0] <- 211.0
  data$S1550800[221.0 <= data$S1550800 & data$S1550800 <= 230.0] <- 221.0
  data$S1550800[231.0 <= data$S1550800 & data$S1550800 <= 240.0] <- 231.0
  data$S1550800[241.0 <= data$S1550800 & data$S1550800 <= 250.0] <- 241.0
  data$S1550800[251.0 <= data$S1550800 & data$S1550800 <= 260.0] <- 251.0
  data$S1550800[261.0 <= data$S1550800 & data$S1550800 <= 270.0] <- 261.0
  data$S1550800[271.0 <= data$S1550800 & data$S1550800 <= 280.0] <- 271.0
  data$S1550800[281.0 <= data$S1550800 & data$S1550800 <= 290.0] <- 281.0
  data$S1550800[291.0 <= data$S1550800 & data$S1550800 <= 300.0] <- 291.0
  data$S1550800 <- factor(data$S1550800, 
    levels=c(0.0,140.0,151.0,161.0,171.0,181.0,191.0,201.0,211.0,221.0,231.0,241.0,251.0,261.0,271.0,281.0,291.0), 
    labels=c("0 TO 139: <140",
      "140 TO 150",
      "151 TO 160",
      "161 TO 170",
      "171 TO 180",
      "181 TO 190",
      "191 TO 200",
      "201 TO 210",
      "211 TO 220",
      "221 TO 230",
      "231 TO 240",
      "241 TO 250",
      "251 TO 260",
      "261 TO 270",
      "271 TO 280",
      "281 TO 290",
      "291 TO 300"))
  data$T8122500 <- factor(data$T8122500, 
    levels=c(429.0), 
    labels=c("Month of current release in a continuous month format"))
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
  data$Z9084800[0.0 <= data$Z9084800 & data$Z9084800 <= 200.0] <- 0.0
  data$Z9084800[201.0 <= data$Z9084800 & data$Z9084800 <= 220.0] <- 201.0
  data$Z9084800[221.0 <= data$Z9084800 & data$Z9084800 <= 240.0] <- 221.0
  data$Z9084800[241.0 <= data$Z9084800 & data$Z9084800 <= 260.0] <- 241.0
  data$Z9084800[261.0 <= data$Z9084800 & data$Z9084800 <= 280.0] <- 261.0
  data$Z9084800[281.0 <= data$Z9084800 & data$Z9084800 <= 300.0] <- 281.0
  data$Z9084800[301.0 <= data$Z9084800 & data$Z9084800 <= 320.0] <- 301.0
  data$Z9084800[321.0 <= data$Z9084800 & data$Z9084800 <= 340.0] <- 321.0
  data$Z9084800[341.0 <= data$Z9084800 & data$Z9084800 <= 360.0] <- 341.0
  data$Z9084800[361.0 <= data$Z9084800 & data$Z9084800 <= 380.0] <- 361.0
  data$Z9084800[381.0 <= data$Z9084800 & data$Z9084800 <= 400.0] <- 381.0
  data$Z9084800[401.0 <= data$Z9084800 & data$Z9084800 <= 420.0] <- 401.0
  data$Z9084800 <- factor(data$Z9084800, 
    levels=c(0.0,201.0,221.0,241.0,261.0,281.0,301.0,321.0,341.0,361.0,381.0,401.0), 
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
      "401 TO 420"))
  data$Z9084900 <- factor(data$Z9084900, 
    levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,95.0), 
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
      "Ungraded"))
  data$Z9085000 <- factor(data$Z9085000, 
    levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,95.0), 
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
      "Ungraded"))
  return(data)
}

varlabels <- c("1997 SCH: GRADE ATTENDED",
  "PUBID - YTH ID CODE 1997",
  "WHAT HGC? 1997",
  "KEY!SEX (SYMBOL) 1997",
  "KEY!BDATE M/Y (SYMBOL) 1997",
  "KEY!BDATE M/Y (SYMBOL) 1997",
  "KEY!RACE (SYMBOL) 1997",
  "CV_AGE(MONTHS)_INT_DATE 1997",
  "CV_AGE_INT_DATE 1997",
  "CV_INCOME_GROSS_YR 1997",
  "CV_YTH_REL_HH_CURRENT 1997",
  "CV_INTERVIEW_CMONTH 1997",
  "CV_SAMPLE_TYPE 1997",
  "KEY!RACE_ETHNICITY (SYMBOL) 1997",
  "CV_AGE(MONTHS)_INT_DATE 1998",
  "CV_AGE_INT_DATE 1998",
  "CV_INCOME_GROSS_YR 1998",
  "CV_YTH_REL_HH_CURRENT 1998",
  "CV_INTERVIEW_CMONTH 1998",
  "CV_AGE(MONTHS)_INT_DATE 1999",
  "CV_AGE_INT_DATE 1999",
  "CV_INCOME_GROSS_YR 1999",
  "CV_YTH_REL_HH_CURRENT 1999",
  "CV_INTERVIEW_CMONTH 1999",
  "CV_INCOME_GROSS_YR 2000",
  "CV_YTH_REL_HH_CURRENT 2000",
  "CV_INTERVIEW_CMONTH 2000",
  "CV_INCOME_GROSS_YR 2001",
  "CV_YTH_REL_HH_CURRENT 2001",
  "CV_INTERVIEW_CMONTH 2001",
  "CV_INCOME_GROSS_YR 2002",
  "CV_YTH_REL_HH_CURRENT 2002",
  "CV_INTERVIEW_CMONTH 2002",
  "R16 RELEASE VERSION NUMBER 2013",
  "CVC_HGC_EVER",
  "CVC_HIGHEST_DEGREE_EVER",
  "CVC_HS_LEFT_DATE",
  "CVC_HS_LEFT_HGC",
  "CVC_HS_LEFT_HGA"
)


# Use qnames rather than rnums

qnames = function(data) {
  names(data) <- c("SCH_YEAR_TO_GRADE_1997_XRND",
    "PUBID_1997",
    "YSCH-5000_1997",
    "KEY_SEX_1997",
    "KEY_BDATE_M_1997",
    "KEY_BDATE_Y_1997",
    "KEY_RACE_1997",
    "CV_AGE(MONTHS)_INT_DATE_1997",
    "CV_AGE_INT_DATE_1997",
    "CV_INCOME_GROSS_YR_1997",
    "CV_YTH_REL_HH_CURRENT_1997",
    "CV_INTERVIEW_CMONTH_1997",
    "CV_SAMPLE_TYPE_1997",
    "KEY_RACE_ETHNICITY_1997",
    "CV_AGE(MONTHS)_INT_DATE_1998",
    "CV_AGE_INT_DATE_1998",
    "CV_INCOME_GROSS_YR_1998",
    "CV_YTH_REL_HH_CURRENT_1998",
    "CV_INTERVIEW_CMONTH_1998",
    "CV_AGE(MONTHS)_INT_DATE_1999",
    "CV_AGE_INT_DATE_1999",
    "CV_INCOME_GROSS_YR_1999",
    "CV_YTH_REL_HH_CURRENT_1999",
    "CV_INTERVIEW_CMONTH_1999",
    "CV_INCOME_GROSS_YR_2000",
    "CV_YTH_REL_HH_CURRENT_2000",
    "CV_INTERVIEW_CMONTH_2000",
    "CV_INCOME_GROSS_YR_2001",
    "CV_YTH_REL_HH_CURRENT_2001",
    "CV_INTERVIEW_CMONTH_2001",
    "CV_INCOME_GROSS_YR_2002",
    "CV_YTH_REL_HH_CURRENT_2002",
    "CV_INTERVIEW_CMONTH_2002",
    "VERSION_R16_2013",
    "CVC_HGC_EVER_XRND",
    "CVC_HIGHEST_DEGREE_EVER_XRND",
    "CVC_HS_LEFT_DATE_XRND",
    "CVC_HS_LEFT_HGC_XRND",
    "CVC_HS_LEFT_HGA_XRND")
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

