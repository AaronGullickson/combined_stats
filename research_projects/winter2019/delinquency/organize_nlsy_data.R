## Organize NLSY97 data for 312 delinquency project

nlsy <- read.csv("delinquency_soc312.csv")

nlsy$gender <- factor(nlsy$KEY.SEX,
                      levels=1:2,
                      labels=c("Male","Female"))
table(nlsy$KEY.SEX, nlsy$gender, exclude=NULL)

nlsy$hard_times <- factor(ifelse(nlsy$PC8.090<0,NA,nlsy$PC8.090),
                          levels=0:1,
                          labels=c("No","Yes"))
table(nlsy$PC8.090, nlsy$hard_times, exclude = NULL)

nlsy$drop_out <- factor(ifelse(nlsy$CV_ENROLLSTAT<0, 
                               NA, nlsy$CV_ENROLLSTAT)==1,
                        levels=c(FALSE,TRUE),
                        labels=c("Enrolled","Dropout"))
table(nlsy$CV_ENROLLSTAT, nlsy$drop_out, exclude = NULL)

nlsy$held_back <- factor(ifelse(nlsy$CV_GRADES_REPEAT_EVER<0, 
                                NA, nlsy$CV_GRADES_REPEAT_EVER)>0,
                         levels=c(FALSE,TRUE),
                         labels=c("Never held back","Held back"))
table(nlsy$CV_GRADES_REPEAT_EVER, nlsy$held_back, exclude = NULL)

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

nlsy$school_type <- factor(ifelse(nlsy$CV_SCHOOL_TYPE<1, NA, nlsy$CV_SCHOOL_TYPE),
                           levels=1:4,
                           labels=c("Public","Parochial","Private","Other"))

nlsy$urbanicity <- factor(ifelse(nlsy$CV_URBAN.RURAL==2, NA, nlsy$CV_URBAN.RURAL),
                          levels=1:0,
                          labels=c("Urban","Rural"))
table(nlsy$CV_URBAN.RURAL, nlsy$urbanicity, exclude = NULL)


biodaded <- ifelse(nlsy$CV_HGC_BIO_DAD<0 | nlsy$CV_HGC_BIO_DAD==95, NA, nlsy$CV_HGC_BIO_DAD)
biomomed <- ifelse(nlsy$CV_HGC_BIO_MOM<0 | nlsy$CV_HGC_BIO_MOM==95, NA, nlsy$CV_HGC_BIO_MOM)
resdaded <- ifelse(nlsy$CV_HGC_RES_DAD<0 | nlsy$CV_HGC_RES_DAD==95, NA, nlsy$CV_HGC_RES_DAD)
resmomed <- ifelse(nlsy$CV_HGC_RES_MOM<0 | nlsy$CV_HGC_RES_MOM==95, NA, nlsy$CV_HGC_RES_MOM)

parent_ed <- cbind(biodaded, biomomed, resdaded, resmomed)
parent_ed <- apply(parent_ed, 1, max, na.rm=TRUE)
parent_ed[parent_ed==-Inf] <- NA

nlsy$high_parent_ed <- parent_ed

nlsy$deliq_score <- ifelse(nlsy$FP_YYCRIMI_DLI<0, NA, nlsy$FP_YYCRIMI_DLI)
summary(nlsy$deliq_score)

nlsy <- subset(nlsy, !is.na(hard_times) & !is.na(deliq_score),
               select=c("hard_times","deliq_score","gender","hh_income","hh_networth",
                        "high_parent_ed","family_type","urbanicity","school_type","drop_out",
                        "held_back"))

library(mice)

nlsy <-  complete(mice(nlsy, 1))

save(nlsy, file="nlsy.RData")