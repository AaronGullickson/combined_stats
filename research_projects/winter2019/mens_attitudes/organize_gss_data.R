source("GSS.r")


GSS$sex_orient <- factor(ifelse(GSS$SEXORNT>=8 | GSS$SEXORNT==0, NA, 
                                ifelse(GSS$SEXORNT==2, 1, GSS$SEXORNT)),
                         levels=c(1,3),
                         labels=c("Gay/Bisexual","Heterosexual"))
table(GSS$SEXORNT, GSS$sex_orient, exclude = NULL)

GSS$age <- ifelse(GSS$AGE>89, NA, GSS$AGE)

GSS$birth_cohort <- GSS$YEAR - GSS$age

GSS$region <- factor(ifelse(GSS$REGION<3, "Northeast", 
                            ifelse(GSS$REGION<5, "Midwest",
                                   ifelse(GSS$REGION<8, "South", "West"))))
table(GSS$REGION, GSS$region, exclude = NULL)

GSS$educ <- ifelse(GSS$EDUC>20, NA, GSS$EDUC)

GSS$marstat <- factor(ifelse(GSS$MARITAL==9, NA,
                             ifelse(GSS$MARITAL==4, 3, GSS$MARITAL)),
                      levels = c(1:3,5),
                      labels = c("Married","Widowed","Divorced/Separated","Never Married"))
table(GSS$MARITAL, GSS$marstat, exclude = NULL)


GSS$race <- factor(GSS$RACE,
                   levels=1:3,
                   labels=c("White","Black","Other"))
table(GSS$RACE, GSS$race, exclude=NULL)


GSS$women_nopolitics <- ifelse(GSS$FEPOL>2, NA, GSS$FEPOL)==1
table(GSS$FEPOL, GSS$women_nopolitics, exclude = NULL)
GSS$workmom_nohealthy <- ifelse(GSS$FECHLD>4, NA, GSS$FECHLD)>=3
table(GSS$FECHLD, GSS$workmom_nohealthy, exclude = NULL)
GSS$breadwinner_model <- ifelse(GSS$FEFAM>4, NA, GSS$FEFAM)<3
table(GSS$FEFAM, GSS$breadwinner_model, exclude = NULL)

GSS$year <- GSS$YEAR


gss <- subset(GSS, SEX==1 & !is.na(sex_orient),
              select = c("year","birth_cohort","educ","marstat","sex_orient","race","region",
                         "women_nopolitics","workmom_nohealthy","breadwinner_model"))

library(mice)
gss <- complete(mice(gss,1))

gss$women_attitude <- gss$women_nopolitics + gss$workmom_nohealthy + gss$breadwinner_model

save(gss, file="gss.RData")
