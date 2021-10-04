library(haven)
library(dplyr)
library(mice)

pew <- read_sav("input/pew_teens_tech/March 7-April 10, 2018 - Teens and Tech Survey - SPSS.sav")

#drop non-internet households
pew <- subset(pew, INTERNET==1)

#sum up positive social media feelings
pew$soc_media_pos <- ifelse(pew$SOC2POSA>3, NA, pew$SOC2POSA)+
  ifelse(pew$SOC2POSB>3, NA, pew$SOC2POSB)+
  ifelse(pew$SOC2POSC>3, NA, pew$SOC2POSC)

pew$soc_media_neg <- ifelse(pew$SOC2NEGA>3, NA, pew$SOC2NEGA)+
  ifelse(pew$SOC2NEGB>3, NA, pew$SOC2NEGB)+
  ifelse(pew$SOC2NEGC>3, NA, pew$SOC2NEGC)

pew$soc_media_feeling <- pew$soc_media_pos-pew$soc_media_neg

pew$soc_media_insecure <- ifelse(pew$SOC4B>2, NA, pew$SOC4B==2)

#internet use
pew$internet_use <- factor(pew$INTREQ,
                           levels=5:1,
                           labels=c("Less often","Several times a week",
                                    "About once a day","Several times a day",
                                    "Almost constantly"))
table(pew$internet_use, pew$INTREQ, exclude=NULL)

#gender
pew$gender <- factor(pew$GENDER,
                     levels=1:2,
                     labels=c("Male","Female"))
table(pew$GENDER, pew$gender, exclude=NULL)

tapply(pew$soc_media_feeling, pew$gender, mean, na.rm=TRUE)
tapply(pew$soc_media_insecure, pew$gender, mean, na.rm=TRUE)


#age
pew$age <- as.numeric(pew$AGE)

#parental education
pew$parent_ed <- factor(ifelse(pew$P_EDUC<9, "Less than HS",
                               ifelse(pew$P_EDUC<11, "HS diploma",
                                      ifelse(pew$P_EDUC<12, "Associate degree",
                                             ifelse(pew$P_EDUC<=14, "Bachelors degree or more", NA)))),
                        levels=c("Less than HS","HS diploma", "Associate degree",
                                 "Bachelors degree or more"))
table(pew$parent_ed, pew$P_EDUC, exclude=NULL)

#race.ethnicity
pew$race <- factor(pew$RACETHNICITY,
                   levels=c(1,2,4,3),
                   labels=c("White","Black","Hispanic","Other"))
table(pew$race, pew$RACETHNICITY, exclude=NULL)

#income
pew <- pew %>%
  mutate(
    income = case_when(
      INCOME==1  ~ 2500,
      INCOME==2  ~ 7500,
      INCOME==3  ~ 12500,
      INCOME==4  ~ 17500,
      INCOME==5  ~ 22500,
      INCOME==6  ~ 27500,
      INCOME==7  ~ 32500,
      INCOME==8  ~ 37500,
      INCOME==9  ~ 45000,
      INCOME==10 ~ 55000,
      INCOME==11 ~ 65000,
      INCOME==12 ~ 82500,
      INCOME==13 ~ 92500,
      INCOME==14 ~ 112500,
      INCOME==15 ~ 137500,
      INCOME==16 ~ 162500,
      INCOME==17 ~ 187500,
      INCOME==18 ~ 200000
    ) 
  )
tapply(pew$income, pew$INCOME, mean)
pew$income <- pew$income/1000

#metro area
pew$metro_area <- factor(pew$METRO, 
                         levels=0:1,
                         labels=c("Non-metro area","Metro area"))
table(pew$metro_area, pew$METRO, exclude=NULL)

#hh size
pew$hhsize <- as.numeric(pew$HHSIZE)

pew <- subset(pew, !is.na(soc_media_insecure),
              select=c("soc_media_insecure","internet_use",
                       "gender","age","race","income","parent_ed",
                       "metro_area","hhsize"))

pew <- complete(mice(pew, 1))


summary(lm(soc_media_insecure~gender*parent_ed+race+internet_use+age+race+income+metro_area+hhsize, data=pew))

save(pew, file="output/pew_teens_tech.RData")
