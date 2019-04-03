library(readr)
library(ggplot2)

# Read in Data ------------------------------------------------------------


cps <- read_fwf("cps_00003.dat.gz", 
                col_positions = fwf_positions(start = c(1,10,67,69,70,73,74,81,82,85,87,92,101,104,106,111,121,125,126,127,135,140),
                                              end   = c(4,11,68,69,72,73,74,81,84,86,87,95,103,105,108,120,124,125,126,134,137,140),
                                              col_names = c("year","month","age","sex","race","marst",
                                                            "nchild","nativity","hispan","empstat","labforce",
                                                            "occ2010","ahrsworkt","wkstat","educ","earningwt",
                                                            "hourwage","paidhour","union","earnweek","uhrswork",
                                                            "eligorg")),
                col_types = cols(.default = "i"), #ensure that all variables are read in as integers
                progress = TRUE)

#adjust some variables for decimal places
cps$earningwt <- cps$earningwt/10000
cps$hourwage <- cps$hourwage/100
cps$earnweek <- cps$earnweek/100


# Calculate Hourly Wage ---------------------------------------------------

#use hourly wage if provided
cps$wages <- ifelse(cps$hourwage==99.99, NA, cps$hourwage)
summary(cps$wages)
tapply(is.na(cps$wages), cps$paidhour, mean)

#use earnings last week and hours worked in a typical week for cases paidhour==1
cps$ahrsworkt <- ifelse(cps$ahrsworkt==999, NA, cps$ahrsworkt)
tapply(is.na(cps$ahrsworkt), cps$paidhour, sum)
cps$wages <- ifelse(cps$paidhour==1, cps$earnweek/cps$ahrsworkt, cps$wages)
summary(cps$wages)
tapply(cps$wages, cps$paidhour, summary)

#how many wages below $1?
sum(cps$wages<1, na.rm=TRUE)

#remove all missing wages and wages less than $1
cps <- subset(cps, !is.na(wages) & wages>=1)


#top-code wages from salary at $99.99/hour
cps$wages <- ifelse(cps$wages>99.99, 99.99, cps$wages)
summary(cps$wages)
ggplot(cps, aes(x=wages, y=..density..))+
  geom_histogram(fill="grey", color="black")+
  geom_density(alpha=0.5, fill="grey")+
  theme_bw()


# Code Other Variables ----------------------------------------------------

### Gender
cps$gender <- factor(cps$sex, 
                     levels=1:2, 
                     labels=c("Male","Female"))
table(cps$gender, cps$sex, exclude=NULL)

### Race
cps$racecombo <- factor(ifelse(cps$hispan>0, "Latino",
                               ifelse(cps$race==100, "White",
                                      ifelse(cps$race==200, "Black",
                                             ifelse(cps$race==300 | cps$race==652, "Indigenous",
                                                    ifelse(cps$race==651, "Asian", "Other/Multiple"))))),
                        levels=c("White","Black","Latino","Asian","Indigenous","Other/Multiple"))
table(cps$race, cps$racecombo, exclude=NULL)
table(cps$hispan, cps$racecombo, exclude=NULL)
cps$race <- cps$racecombo

### Marital Status
cps$marstat <- factor(ifelse(cps$marst==1 | cps$marst==2,"Married",
                             ifelse(cps$marst==3 | cps$marst==4, "Divorced/Separated",
                                    ifelse(cps$marst==5, "Widowed",
                                           ifelse(cps$marst==6, "Never Married", NA)))),
                      levels=c("Never Married","Married","Divorced/Separated","Widowed"))
table(cps$marst, cps$marstat, exclude=NULL)

### Nativity
cps$foreign_born <- factor(ifelse(cps$nativity==0, NA, 
                                  ifelse(cps$nativity==5, "Yes", "No")),
                           levels=c("No","Yes"))
table(cps$nativity, cps$foreign_born, exclude=NULL)

### Education
cps$education <- factor(ifelse(cps$educ==999, NA,
                               ifelse(cps$educ<73, "No HS Diploma",
                                      ifelse(cps$educ<90, "HS Diploma",
                                             ifelse(cps$educ<111, "AA Degree",
                                                    ifelse(cps$educ<123, "Bachelors Degree", "Graduate Degree"))))),
                        levels=c("No HS Diploma","HS Diploma","AA Degree","Bachelors Degree","Graduate Degree"))
table(cps$educ, cps$education, exclude=NULL)

### wage/salary worker
cps$earn_type <- factor(ifelse(cps$paidhour==1, "Wage",
                               ifelse(cps$paidhour==2, "Salary", NA)))
table(cps$earn_type, cps$paidhour, exclude=NULL)

#Big Occupations
cps$occup <- factor(ifelse(cps$occ2010<430, "Manager",
                           ifelse(cps$occ2010<1000, "Business/Finance Specialist", 
                                  ifelse(cps$occ2010<2000, "STEM",
                                         ifelse(cps$occ2010<2100, "Social Services",
                                                ifelse(cps$occ2010<2200, "Legal", 
                                                       ifelse(cps$occ2010<2600, "Education",
                                                              ifelse(cps$occ2010<3000, "Arts, Design, and Media",
                                                                     ifelse(cps$occ2010<=3120 & cps$occ2010!=3110, "Doctors",
                                                                            ifelse(cps$occ2010<3600, "Other Healthcare",
                                                                                   ifelse(cps$occ2010<4700, "Service",
                                                                                          ifelse(cps$occ2010<5000, "Sales",
                                                                                                 ifelse(cps$occ2010<6000, "Administrative Support",
                                                                                                        "Manual")))))))))))),
                    levels=c("Manual","Administrative Support", "Sales", "Service","Social Services", "Other Healthcare",
                             "Arts, Design, and Media", "Education","Legal","Doctors","STEM","Business/Finance Specialist","Manager"))
table(cps$occup, exclude=NULL)


# Finalize Dataset --------------------------------------------------------

#limit this to ages 18 to 65
cps <- subset(cps, age>=18 & age<65, 
              select=c("wages","age","gender","race","marstat","education",
                       "occup","nchild","foreign_born","earn_type","earningwt"))

#de-tibble
cps <- as.data.frame(cps)
summary(cps)

#only 171 missing values for foreign born so just drop
cps <- na.omit(cps)
earnings <- cps

save(earnings, file="earnings.RData")
