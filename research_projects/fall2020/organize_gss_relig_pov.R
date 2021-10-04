library(readr)
library(mice)
library(dplyr)

gss <- read_fwf("input/gss_relig_poverty/gss.dat",
                col_positions = fwf_positions(start=c( 1,21,41,61, 81,101,121,141,161,181),
                                              end=  c(20,40,60,80,100,120,140,160,180,200),
                                              col_names = c("year","attend","region",
                                                            "homepop","race","sex",
                                                            "age","childs","wrkstat",
                                                            "income16")))


#religious attendance - leave as a score
gss$attend_score <- ifelse(gss$attend==9, NA, gss$attend)
gss$attend_cat <- factor(gss$attend_score,
                         levels=0:8,
                         labels=c("never","less than once a year",
                                  "once a year","several times a year",
                                  "once a month","2-3 times a month",
                                  "nearly every week","every week",
                                  "more than once a week"))
table(gss$attend_cat, gss$attend_score, exclude=NULL)

#poverty line should 7880+4180*number of people in hh according to
#https://aspe.hhs.gov/2017-poverty-guidelines for 2017

gss$povline <- 7880+4180*gss$homepop


gss <- gss %>%
  mutate(
    fam_inc = case_when(
      income16==1  ~ 1000,
      income16==2  ~ 3000,
      income16==3  ~ 4000,
      income16==4  ~ 5000,
      income16==5  ~ 6000,
      income16==6  ~ 7000,
      income16==7  ~ 8000,
      income16==8  ~ 9000,
      income16==9  ~ 10000,
      income16==10 ~ 15000,
      income16==11 ~ 17500,
      income16==12 ~ 20000,
      income16==13 ~ 22500,
      income16==14 ~ 25000,
      income16==15 ~ 30000,
      income16==16 ~ 35000,
      income16==17 ~ 40000,
      income16==18 ~ 50000,
      income16==19 ~ 60000,
      income16==20 ~ 75000,
      income16==21 ~ 90000,
      income16==22 ~ 110000,
      income16==23 ~ 130000,
      income16==24 ~ 150000,
      income16==25 ~ 170000,
      income16==26 ~ 175000
      
      ) 
  )
tapply(gss$fam_inc, gss$income16, mean)

gss$poverty <- factor(gss$fam_inc<gss$povline,
                      levels=c(FALSE, TRUE),
                      labels=c("Not below poverty line","Below poverty line"))

gss$gender <- factor(gss$sex,
                     levels=1:2,
                     labels=c("Male","Female"))

gss$age <- ifelse(gss$age>89, NA, gss$age)

gss$race <- factor(gss$race,
                   levels=1:3,
                   labels=c("White","Black","Other"))

gss$region <- factor(ifelse(gss$region<=2, "Northeast",
                            ifelse(gss$region<=4, "Midwest",
                                   ifelse(gss$region<=7, "South", "West"))),
                     levels=c("Northeast","Midwest","South","West"))
                     
gss$emp_status <- factor(ifelse(gss$wrkstat<=2, "employed",
                                ifelse(gss$wrkstat<=4, "unemployed",
                                       ifelse(gss$wrkstat<=8, "not in labor force", NA))),
                         levels=c("employed","unemployed","not in labor force"))
table(gss$emp_status, gss$wrkstat, exclude=NULL)

gss$num_child <- ifelse(gss$childs>8, NA, gss$childs)

gss <- subset(gss, !is.na(poverty) & !is.na(attend_score),
              select=c("attend_score","attend_cat","poverty",
                       "gender","age","race","region","emp_status","num_child"))

gss <- complete(mice(gss, m=1))

summary(lm(attend_score~poverty+region+gender+age+race+emp_status+num_child,
           data=gss))

save(gss, file="output/gss_relig_poverty.RData")
