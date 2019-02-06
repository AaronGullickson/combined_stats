label define vlR0000100   0 "0"
label values R0000100 vlR0000100
label define vlR0536300   0 "No Information"  1 "Male"  2 "Female"
label values R0536300 vlR0536300
label define vlR0536401   1 "1: January"  2 "2: February"  3 "3: March"  4 "4: April"  5 "5: May"  6 "6: June"  7 "7: July"  8 "8: August"  9 "9: September"  10 "10: October"  11 "11: November"  12 "12: December"
label values R0536401 vlR0536401
label define vlR0648900   0 "No"  1 "Yes"
label values R0648900 vlR0648900
label define vlR1201400   1 "Not enrolled, no high school degree, no GED"  2 "Not enrolled, GED"  3 "Not enrolled, high school degree"  4 "Not enrolled, some college"  5 "Not enrolled, 2-year college graduate"  6 "Not enrolled, 4-year college graduate"  7 "Not enrolled, graduate degree"  8 "Enrolled in grades 1-12, not a high school graduate"  9 "Enrolled in a 2-year college"  10 "Enrolled in a 4-year college"  11 "Enrolled in a graduate program"
label values R1201400 vlR1201400
label define vlR1204200   0 "0"  1 "1"  2 "2"  3 "3"  4 "4"  5 "5"  6 "6"  7 "7"  8 "8"  9 "9"  10 "10"  11 "11"  12 "12"  13 "13"  14 "14"  15 "15"  16 "16"  17 "17"  18 "18"  19 "19"
label values R1204200 vlR1204200
label define vlR1204500   0 "0"
label values R1204500 vlR1204500
label define vlR1204700   0 "0"
label values R1204700 vlR1204700
label define vlR1204900   0 "0"
label values R1204900 vlR1204900
label define vlR1205300   1 "Both biological parents"  2 "Two parents, biological mother"  3 "Two parents, biological father"  4 "Biological mother only"  5 "Biological father only"  6 "Adoptive parent(s)"  7 "Foster parent(s)"  8 "No parents, grandparents"  9 "No parents, other relatives"  10 "Anything else"
label values R1205300 vlR1205300
label define vlR1211000   1 "Public"  2 "Parochial"  3 "Private, not parochial"  4 "Other"
label values R1211000 vlR1211000
label define vlR1217500   0 "Rural"  1 "Urban"  2 "Unknown"
label values R1217500 vlR1217500
label define vlR1235800   0 "Oversample"  1 "Cross-sectional"
label values R1235800 vlR1235800
label define vlR1302400   0 "NONE"  1 "1ST GRADE"  2 "2ND GRADE"  3 "3RD GRADE"  4 "4TH GRADE"  5 "5TH GRADE"  6 "6TH GRADE"  7 "7TH GRADE"  8 "8TH GRADE"  9 "9TH GRADE"  10 "10TH GRADE"  11 "11TH GRADE"  12 "12TH GRADE"  13 "1ST YEAR COLLEGE"  14 "2ND YEAR COLLEGE"  15 "3RD YEAR COLLEGE"  16 "4TH YEAR COLLEGE"  17 "5TH YEAR COLLEGE"  18 "6TH YEAR COLLEGE"  19 "7TH YEAR COLLEGE"  20 "8TH YEAR COLLEGE OR MORE"  95 "UNGRADED"
label values R1302400 vlR1302400
label define vlR1302500   0 "NONE"  1 "1ST GRADE"  2 "2ND GRADE"  3 "3RD GRADE"  4 "4TH GRADE"  5 "5TH GRADE"  6 "6TH GRADE"  7 "7TH GRADE"  8 "8TH GRADE"  9 "9TH GRADE"  10 "10TH GRADE"  11 "11TH GRADE"  12 "12TH GRADE"  13 "1ST YEAR COLLEGE"  14 "2ND YEAR COLLEGE"  15 "3RD YEAR COLLEGE"  16 "4TH YEAR COLLEGE"  17 "5TH YEAR COLLEGE"  18 "6TH YEAR COLLEGE"  19 "7TH YEAR COLLEGE"  20 "8TH YEAR COLLEGE OR MORE"  95 "UNGRADED"
label values R1302500 vlR1302500
label define vlR1302600   0 "NONE"  1 "1ST GRADE"  2 "2ND GRADE"  3 "3RD GRADE"  4 "4TH GRADE"  5 "5TH GRADE"  6 "6TH GRADE"  7 "7TH GRADE"  8 "8TH GRADE"  9 "9TH GRADE"  10 "10TH GRADE"  11 "11TH GRADE"  12 "12TH GRADE"  13 "1ST YEAR COLLEGE"  14 "2ND YEAR COLLEGE"  15 "3RD YEAR COLLEGE"  16 "4TH YEAR COLLEGE"  17 "5TH YEAR COLLEGE"  18 "6TH YEAR COLLEGE"  19 "7TH YEAR COLLEGE"  20 "8TH YEAR COLLEGE OR MORE"  95 "UNGRADED"
label values R1302600 vlR1302600
label define vlR1302700   0 "NONE"  1 "1ST GRADE"  2 "2ND GRADE"  3 "3RD GRADE"  4 "4TH GRADE"  5 "5TH GRADE"  6 "6TH GRADE"  7 "7TH GRADE"  8 "8TH GRADE"  9 "9TH GRADE"  10 "10TH GRADE"  11 "11TH GRADE"  12 "12TH GRADE"  13 "1ST YEAR COLLEGE"  14 "2ND YEAR COLLEGE"  15 "3RD YEAR COLLEGE"  16 "4TH YEAR COLLEGE"  17 "5TH YEAR COLLEGE"  18 "6TH YEAR COLLEGE"  19 "7TH YEAR COLLEGE"  20 "8TH YEAR COLLEGE OR MORE"  95 "UNGRADED"
label values R1302700 vlR1302700
label define vlR1482600   1 "Black"  2 "Hispanic"  3 "Mixed Race (Non-Hispanic)"  4 "Non-Black / Non-Hispanic"
label values R1482600 vlR1482600
label define vlR5511500   0 "0"
label values R5511500 vlR5511500
/* Crosswalk for Reference number & Question name
 * Uncomment and edit this RENAME statement to rename variables for ease of use.
 * This command does not guarantee uniqueness
 */
  /* *start* */
/*
  rename R0000100 PUBID_1997 
  rename R0536300 KEY!SEX_1997 
  rename R0536401 KEY!BDATE_M_1997 
  rename R0536402 KEY!BDATE_Y_1997 
  rename R0648900 PC8_090_1997   // PC8-090
  rename R1201400 CV_ENROLLSTAT_1997 
  rename R1204200 CV_GRADES_REPEAT_EVER_1997 
  rename R1204500 CV_INCOME_GROSS_YR_1997 
  rename R1204700 CV_HH_NET_WORTH_P_1997 
  rename R1204900 CV_HH_POV_RATIO_1997 
  rename R1205300 CV_YTH_REL_HH_CURRENT_1997 
  rename R1211000 CV_SCHOOL_TYPE_1997 
  rename R1217500 CV_URBAN_RURAL_1997   // CV_URBAN-RURAL
  rename R1235800 CV_SAMPLE_TYPE_1997 
  rename R1302400 CV_HGC_BIO_DAD_1997 
  rename R1302500 CV_HGC_BIO_MOM_1997 
  rename R1302600 CV_HGC_RES_DAD_1997 
  rename R1302700 CV_HGC_RES_MOM_1997 
  rename R1482600 KEY!RACE_ETHNICITY_1997 
  rename R5511500 FP_YYCRIMI_DLI_2000 
*/
  /* *end* */  
/* To convert variable names to lower case use the TOLOWER command 
 *      (type findit tolower and follow the links to install).
 * TOLOWER VARLIST will change listed variables to lower case; 
 *  TOLOWER without a specified variable list will convert all variables in the dataset to lower case
 */
/* tolower */
