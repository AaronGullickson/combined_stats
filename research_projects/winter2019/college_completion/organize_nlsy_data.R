## Organize NLSY97 data for 312 college completion project

nlsy <- read.csv("college_completion.csv")

nlsy$gender <- factor(nlsy$KEY.SEX,
                      levels=1:2,
                      labels=c("Male","Female"))
table(nlsy$KEY.SEX, nlsy$gender, exclude=NULL)

nlsy$hh_income <- ifelse(nlsy$CV_INCOME_GROSS_YR < -5, 0, 
                         ifelse(nlsy$CV_INCOME_GROSS_YR<0, NA, nlsy$CV_INCOME_GROSS_YR))/1000
plot(nlsy$CV_INCOME_GROSS_YR, nlsy$hh_income)

nlsy$hh_networth <- ifelse(nlsy$CV_HH_NET_WORTH_P<0 & nlsy$CV_HH_NET_WORTH_P>-6,
                           NA, nlsy$CV_HH_NET_WORTH_P)/1000
summary(nlsy$hh_networth)

nlsy$family_type <- factor(ifelse(nlsy$CV_YTH_REL_HH_CURRENT<1, NA,
                                  ifelse(nlsy$CV_YTH_REL_HH_CURRENT==1 | 
                                           nlsy$CV_YTH_REL_HH_CURRENT==6,"Two bio/adoptive parents",
                                         ifelse(nlsy$CV_YTH_REL_HH_CURRENT<4, "Bio + step parent",
                                                ifelse(nlsy$CV_YTH_REL_HH_CURRENT<6, "Single bio parent","Other")))),
                           levels=c("Two bio/adoptive parents","Bio + step parent","Single bio parent","Other"))
table(nlsy$CV_YTH_REL_HH_CURRENT, nlsy$family_type, exclude = NULL)

biodaded <- ifelse(nlsy$CV_HGC_BIO_DAD<0 | nlsy$CV_HGC_BIO_DAD==95, NA, nlsy$CV_HGC_BIO_DAD)
biomomed <- ifelse(nlsy$CV_HGC_BIO_MOM<0 | nlsy$CV_HGC_BIO_MOM==95, NA, nlsy$CV_HGC_BIO_MOM)
resdaded <- ifelse(nlsy$CV_HGC_RES_DAD<0 | nlsy$CV_HGC_RES_DAD==95, NA, nlsy$CV_HGC_RES_DAD)
resmomed <- ifelse(nlsy$CV_HGC_RES_MOM<0 | nlsy$CV_HGC_RES_MOM==95, NA, nlsy$CV_HGC_RES_MOM)

parent_ed <- cbind(biodaded, biomomed, resdaded, resmomed)
parent_ed <- apply(parent_ed, 1, max, na.rm=TRUE)
parent_ed[parent_ed==-Inf] <- NA

nlsy$high_parent_ed <- parent_ed

nlsy$race <- factor(ifelse(nlsy$KEY.ETHNICITY==1, "Latino",
                           ifelse(nlsy$KEY.RACE==1, "White",
                                  ifelse(nlsy$KEY.RACE==2, "Black",
                                         ifelse(nlsy$KEY.RACE==3,"American Indian",
                                                ifelse(nlsy$KEY.RACE==4, "Asian/Pacific Islander",
                                                       ifelse(nlsy$KEY.RACE==5, "Other", NA)))))),
                    levels=c("White","Black","Latino","Asian/Pacific Islander","American Indian","Other"))
table(nlsy$KEY.RACE, nlsy$race, exclude=NULL)
table(nlsy$KEY.ETHNICITY, nlsy$race, exclude=NULL)

#lets restrict our sample to individuals who completed high school by 2008 and were present 
#in the most recent wave (2015-2016)

nlsy <- subset(nlsy, CVC_RND==17 & 
                 CVC_HS_DIPLOMA>0 & CVC_HS_DIPLOMA<=336 & 
                 CVC_HIGHEST_DEGREE_EVER>=0)
table(nlsy$CVC_HIGHEST_DEGREE_EVER)

nlsy$attend_college <- as.numeric(nlsy$CVC_HGC_EVER>12 | nlsy$CVC_HIGHEST_DEGREE_EVER>=3)
nlsy$complete_college <- as.numeric(nlsy$CVC_HIGHEST_DEGREE_EVER>=4)
table(nlsy$attend_college, nlsy$complete_college)

nlsy <- subset(nlsy, 
               select=c("gender","race","family_type","hh_income","hh_networth","high_parent_ed",
                        "attend_college","complete_college"))

library(mice)

nlsy <-  complete(mice(nlsy, 1))

save(nlsy, file="nlsy.RData")