label define vlR0000100   0 "0"
label values R0000100 vlR0000100
label define vlR0323600   0 "0"  1 "1"  2 "2"  3 "3"  4 "4"  5 "5"  6 "6"  7 "7"
label values R0323600 vlR0323600
label define vlR0323800   0 "0"  1 "1"  2 "2"  3 "3"  4 "4"  5 "5"  6 "6"  7 "7"
label values R0323800 vlR0323800
label define vlR0536300   0 "No Information"  1 "Male"  2 "Female"
label values R0536300 vlR0536300
label define vlR0536401   1 "1: January"  2 "2: February"  3 "3: March"  4 "4: April"  5 "5: May"  6 "6: June"  7 "7: July"  8 "8: August"  9 "9: September"  10 "10: October"  11 "11: November"  12 "12: December"
label values R0536401 vlR0536401
label define vlR0538600   0 "No"  1 "Yes"
label values R0538600 vlR0538600
label define vlR0538700   0 "No information"  1 "White"  2 "Black or African American"  3 "American Indian, Eskimo, or Aleut"  4 "Asian or Pacific Islander"  5 "Something else? (SPECIFY)"
label values R0538700 vlR0538700
label define vlR1204500   0 "0"
label values R1204500 vlR1204500
label define vlR1204700   0 "0"
label values R1204700 vlR1204700
label define vlR1205300   1 "Both biological parents"  2 "Two parents, biological mother"  3 "Two parents, biological father"  4 "Biological mother only"  5 "Biological father only"  6 "Adoptive parent(s)"  7 "Foster parent(s)"  8 "No parents, grandparents"  9 "No parents, other relatives"  10 "Anything else"
label values R1205300 vlR1205300
label define vlR1217500   0 "Rural"  1 "Urban"  2 "Unknown"
label values R1217500 vlR1217500
label define vlR1302400   0 "NONE"  1 "1ST GRADE"  2 "2ND GRADE"  3 "3RD GRADE"  4 "4TH GRADE"  5 "5TH GRADE"  6 "6TH GRADE"  7 "7TH GRADE"  8 "8TH GRADE"  9 "9TH GRADE"  10 "10TH GRADE"  11 "11TH GRADE"  12 "12TH GRADE"  13 "1ST YEAR COLLEGE"  14 "2ND YEAR COLLEGE"  15 "3RD YEAR COLLEGE"  16 "4TH YEAR COLLEGE"  17 "5TH YEAR COLLEGE"  18 "6TH YEAR COLLEGE"  19 "7TH YEAR COLLEGE"  20 "8TH YEAR COLLEGE OR MORE"  95 "UNGRADED"
label values R1302400 vlR1302400
label define vlR1302500   0 "NONE"  1 "1ST GRADE"  2 "2ND GRADE"  3 "3RD GRADE"  4 "4TH GRADE"  5 "5TH GRADE"  6 "6TH GRADE"  7 "7TH GRADE"  8 "8TH GRADE"  9 "9TH GRADE"  10 "10TH GRADE"  11 "11TH GRADE"  12 "12TH GRADE"  13 "1ST YEAR COLLEGE"  14 "2ND YEAR COLLEGE"  15 "3RD YEAR COLLEGE"  16 "4TH YEAR COLLEGE"  17 "5TH YEAR COLLEGE"  18 "6TH YEAR COLLEGE"  19 "7TH YEAR COLLEGE"  20 "8TH YEAR COLLEGE OR MORE"  95 "UNGRADED"
label values R1302500 vlR1302500
label define vlR1302600   0 "NONE"  1 "1ST GRADE"  2 "2ND GRADE"  3 "3RD GRADE"  4 "4TH GRADE"  5 "5TH GRADE"  6 "6TH GRADE"  7 "7TH GRADE"  8 "8TH GRADE"  9 "9TH GRADE"  10 "10TH GRADE"  11 "11TH GRADE"  12 "12TH GRADE"  13 "1ST YEAR COLLEGE"  14 "2ND YEAR COLLEGE"  15 "3RD YEAR COLLEGE"  16 "4TH YEAR COLLEGE"  17 "5TH YEAR COLLEGE"  18 "6TH YEAR COLLEGE"  19 "7TH YEAR COLLEGE"  20 "8TH YEAR COLLEGE OR MORE"  95 "UNGRADED"
label values R1302600 vlR1302600
label define vlR1302700   0 "NONE"  1 "1ST GRADE"  2 "2ND GRADE"  3 "3RD GRADE"  4 "4TH GRADE"  5 "5TH GRADE"  6 "6TH GRADE"  7 "7TH GRADE"  8 "8TH GRADE"  9 "9TH GRADE"  10 "10TH GRADE"  11 "11TH GRADE"  12 "12TH GRADE"  13 "1ST YEAR COLLEGE"  14 "2ND YEAR COLLEGE"  15 "3RD YEAR COLLEGE"  16 "4TH YEAR COLLEGE"  17 "5TH YEAR COLLEGE"  18 "6TH YEAR COLLEGE"  19 "7TH YEAR COLLEGE"  20 "8TH YEAR COLLEGE OR MORE"  95 "UNGRADED"
label values R1302700 vlR1302700
label define vlS4921000   1 "MOST OF THE TIME"  2 "SOME OF THE TIME"  3 "ONLY NOW AND THEN"  4 "HARDLY AT ALL"
label values S4921000 vlS4921000
label define vlS4921100   1 "I DID NOT VOTE (IN THE ELECTION THIS NOVEMBER)"  2 "I THOUGHT ABOUT VOTING THIS TIME, BUT DIDN'T"  3 "I USUALLY VOTE, BUT DIDN'T THIS TIME"  4 "I AM SURE I VOTED"  5 "R NOT ELIGIBLE TO VOTE"
label values S4921100 vlS4921100
label define vlZ9083900   0 "None"  1 "GED"  2 "High school diploma (Regular 12 year program)"  3 "Associate/Junior college (AA)"  4 "Bachelor's degree (BA, BS)"  5 "Master's degree (MA, MS)"  6 "PhD"  7 "Professional degree (DDS, JD, MD)"
label values Z9083900 vlZ9083900
/* Crosswalk for Reference number & Question name
 * Uncomment and edit this RENAME statement to rename variables for ease of use.
 * This command does not guarantee uniqueness
 */
  /* *start* */
/*
  rename R0000100 PUBID_1997 
  rename R0323600 YSAQ_007_1997   // YSAQ-007
  rename R0323800 YSAQ_009_1997   // YSAQ-009
  rename R0536300 KEY!SEX_1997 
  rename R0536401 KEY!BDATE_M_1997 
  rename R0536402 KEY!BDATE_Y_1997 
  rename R0538600 KEY!ETHNICITY_1997 
  rename R0538700 KEY!RACE_1997 
  rename R1204500 CV_INCOME_GROSS_YR_1997 
  rename R1204700 CV_HH_NET_WORTH_P_1997 
  rename R1205300 CV_YTH_REL_HH_CURRENT_1997 
  rename R1217500 CV_URBAN_RURAL_1997   // CV_URBAN-RURAL
  rename R1302400 CV_HGC_BIO_DAD_1997 
  rename R1302500 CV_HGC_BIO_MOM_1997 
  rename R1302600 CV_HGC_RES_DAD_1997 
  rename R1302700 CV_HGC_RES_MOM_1997 
  rename R1485600 FP_YHROUTIN_1997 
  rename S4921000 YPOL_105_2004   // YPOL-105
  rename S4921100 YPOL_110_2004   // YPOL-110
  rename Z9083900 CVC_HIGHEST_DEGREE_EVER_XRND 
*/
  /* *end* */  
/* To convert variable names to lower case use the TOLOWER command 
 *      (type findit tolower and follow the links to install).
 * TOLOWER VARLIST will change listed variables to lower case; 
 *  TOLOWER without a specified variable list will convert all variables in the dataset to lower case
 */
/* tolower */
