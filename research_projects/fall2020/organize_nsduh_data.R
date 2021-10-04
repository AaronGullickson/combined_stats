load("NSDUH_2018.RData")

library(dplyr)

nsduh <- PUF2018_100819

#remove underage because a bunch of stuff missing
nsduh <- subset(nsduh, AGE2>=7)

#drug use in past 12 months
nsduh$coke_use <- ifelse(nsduh$cocrec>91, NA, nsduh$cocrec<=2)
nsduh$crack_use <- ifelse(nsduh$crakrec>91, NA, nsduh$crakrec<=2)
nsduh$heroin_use <- ifelse(nsduh$herrec>91, NA, nsduh$herrec<=2)
nsduh$inhale_use <- ifelse(nsduh$inhalrec>91, NA, nsduh$inhalrec<=2)
nsduh$meth_use <- ifelse(nsduh$methamrec>91, NA, nsduh$methamrec<=2)

nsduh$drug_use <- nsduh$coke_use | nsduh$crack_use | nsduh$heroin_use | 
  nsduh$inhale_use | nsduh$meth_use

#age

nsduh$age <- factor(ifelse(nsduh$AGE2<12, 12, nsduh$AGE2),
                    levels=c(12:17),
                    labels=c("18-25","26-29",
                             "30-34","35-49","50-64","65 and older"))
table(nsduh$AGE2, nsduh$age, exclude=NULL)

nsduh$mil_service <- factor(ifelse(nsduh$service==99, 2, nsduh$service),
                            levels=2:1,
                            labels=c("No","Yes"))
table(nsduh$service, nsduh$mil_service, exclude=NULL)

nsduh$sexual_identity <- factor(nsduh$sexident, 
                                levels=1:3,
                                labels=c("Heterosexual","Gay or Lesbian",
                                         "Bisexual"))
table(nsduh$sexual_identity, nsduh$sexident, exclude=NULL)

nsduh$gender <- factor(nsduh$irsex,
                       levels=1:2,
                       labels=c("Male","Female"))
table(nsduh$irsex, nsduh$gender)

nsduh$mar_stat <- factor(nsduh$irmarit,
                         levels=c(4,1:3),
                         labels=c("Never Married","Married","Widowed","Divorced"))
table(nsduh$irmarit, nsduh$mar_stat, exclude=NULL)

nsduh$education <- factor(ifelse(nsduh$IREDUHIGHST2<7, 7, 
                                 ifelse(nsduh$IREDUHIGHST2==9, 8, 
                                        nsduh$IREDUHIGHST2)),
                          levels=c(7,8,10,11),
                          labels=c("Less than HS","HS diploma",
                                   "Associate degree","Bachelors or higher"))
table(nsduh$education, nsduh$IREDUHIGHST2, exclude=NULL)

nsduh$emp_status <- factor(ifelse(nsduh$WRKSTATWK2>=98, NA,
                                  ifelse(nsduh$WRKSTATWK2<=3, 1,
                                         ifelse(nsduh$WRKSTATWK2>4, 5, 4))),
                           levels=c(1,4,5),
                           labels=c("Employed","Unemployed","Not in labor force"))
table(nsduh$emp_status, nsduh$WRKSTATWK2, exclude=NULL)


nsduh$income <- factor(nsduh$IRPINC3, 
                       levels=1:7,
                       labels=c("Less than $10,000",
                                "$10,000-$19,999",
                                "$20,000-$29,999",
                                "$30,000-$39,999",
                                "$40,000-$49,999",
                                "$50,000-$74,999",
                                "$75,000 or more"))
table(nsduh$income, nsduh$IRPINC3, exclude=NULL)


nsduh <- nsduh %>% mutate(
  incomec = case_when(
    IRPINC3==1~5000,
    IRPINC3==2~15000,
    IRPINC3==3~25000,
    IRPINC3==4~35000,
    IRPINC3==5~45000,
    IRPINC3==6~62500,
    IRPINC3==7~80000
    
  )
)
tapply(nsduh$incomec, nsduh$IRPINC3, mean)

#lets just randomize income a bit for better displays
nsduh$income_random <- sample(-5:5, nrow(nsduh), replace = TRUE)*1000
nsduh$income <- (nsduh$incomec+nsduh$income_random)/1000

nsduh <- subset(nsduh, !is.na(nsduh$drug_use),
                select=c("drug_use","income","age","gender","sexual_identity",
                         "education","emp_status","mil_service"))

library(mice)

nsduh <- complete(mice(nsduh, 1))

summary(lm(drug_use~income*gender+age+sexual_identity+education+emp_status+mil_service, data=nsduh))

save(nsduh, file="nsduh.RData")
