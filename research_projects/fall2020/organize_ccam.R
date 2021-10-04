library(haven)
library(dplyr)
ccam <- read_sav("input/ccam/CCAM SPSS Data 2008-2018.sav")

ccam$cc_happening <- factor(ccam$happening, 
                            levels = 1:3,
                            labels = c("No","Don't Know","Yes"))
table(ccam$happening, ccam$cc_happening, exclude=NULL)

#code in responses for global warming cause
ccam$cc_cause <- factor(ccam$cause_recoded,
                        levels=3:6,
                        labels=c("not happening",
                                 "mostly natural",
                                 "equally natural and human",
                                 "mostly human"))

#drop missing values
ccam <- subset(ccam, !is.na(cc_happening))


#what else to keep

#age
ccam$age <- as.numeric(ccam$age)

#gender
ccam$gender <- factor(ccam$gender,
                      levels=1:2,
                      labels=c("Male","Female"))

#education
ccam$education <- factor(ifelse(ccam$educ<9, "less than HS",
                                ifelse(ccam$educ<11,"HS diploma",
                                       ifelse(ccam$educ<12,"associate degree",
                                              "bachelors degree or more"))),
                         levels=c("less than HS","HS diploma",
                                  "associate degree", "bachelors degree or more"))
table(ccam$education, ccam$educ, exclude=NULL)

#income - need to convert into actual mid-point values
ccam <- ccam %>%
  mutate(
    incomed = case_when(
      income==1  ~ 2500,
      income==2  ~ 6250,
      income==3  ~ 8750,
      income==4  ~ 11250,
      income==5  ~ 13750,
      income==6  ~ 17500,
      income==7  ~ 22500,
      income==8  ~ 27500,
      income==9  ~ 32500,
      income==10 ~ 37500,
      income==11 ~ 45000,
      income==12 ~ 55000,
      income==13 ~ 67500,
      income==14 ~ 80000,
      income==15 ~ 92500,
      income==16 ~ 112500,
      income==17 ~ 137500,
      income==18 ~ 162500,
      income==19 ~ 187500,
      income==20 ~ 225000,
      income==21 ~ 275000) 
  )
tapply(ccam$incomed, ccam$income, mean)
ccam$income <- ccam$incomed/1000

#ideology - leave as a score centered on zero
ccam$conservative <- ifelse(ccam$ideology<0, NA, ccam$ideology-3)
table(ccam$ideology, ccam$conservative, exclude=NULL)

#party affiliation
ccam <- ccam %>%
  mutate(
    party_affil = case_when(
      party==1 ~ "Republican",
      party==2 ~ "Democrat",
      party==3 ~ "Independent",
      party==4 | party==5 ~ "Other"
    )
  )
ccam$party_affil <- factor(ccam$party_affil,
                           levels=c("Democrat","Republican","Independent",
                                    "Other"))
table(ccam$party_affil, ccam$party, exclude=NULL)

#employment
ccam <- ccam %>%
  mutate(
    employ_status = case_when(
      employment==1 | employment==2 ~ "employed",
      employment==4 ~ "unemployed",
      employment==3 | employment>=4 ~ "not in the labor force"
    )
  )
ccam$employ_status <- factor(ccam$employ_status,
                             levels=c("employed","unemployed",
                                      "not in the labor force"))
table(ccam$employment, ccam$employ_status, exclude=NULL)

ccam$race <- factor(ifelse(ccam$race==1, "White",
                           ifelse(ccam$race==2, "Black",
                                  ifelse(ccam$race==4, "Hispanic","Other"))),
                    levels=c("White","Black","Hispanic","Other"))
                    
ccam <- subset(ccam,
               select=c("cc_happening","age","gender","race","education",
                        "income","conservative","party_affil","employ_status"))

summary(lm(I(cc_happening=="Yes")~income*party_affil+education+gender+race+employ_status+conservative, data=ccam))

ggplot(ccam, aes(x=cc_happening, y=income))+geom_boxplot()

library(mice)
#impute missing values for conservative and party_affil
ccam <- complete(mice(ccam, m=1))

save(ccam, file="output/ccam.RData")
