library(readr)
library(mice)
library(dplyr)

gss <- read_fwf("input/gss_relig_exogamy/GSS.dat",
                col_positions = fwf_positions(start=seq( from=1, to=481, by=20),
                                              end=  seq(from=20, to=500, by=20),
                                              col_names = c("year","relig","denom",
                                                            "fund","sprel","spden",
                                                            "spfund","hapmar","marnum",
                                                            "spmarnum","ballot","region",
                                                            "race","spdeg","id_","wrkstat",
                                                            "marital","agewed","spwrksta",
                                                            "childs","age","educ","speduc",
                                                            "degree","income16")))

#limit to those married and first marriages
gss <- subset(gss, marital==1)

gss <- gss %>%
  mutate(
    religion = case_when(
      relig==1 & fund==1 ~ "Fundamentalist Protestant",
      relig==1 & fund!=1 ~ "Mainline Protestant",
      relig==2 ~ "Catholic",
      relig==3 ~ "Jewish",
      relig==4 ~ "None",
      relig==6 ~ "Buddhist",
      relig==7 ~ "Hindu",
      relig==9 ~ "Muslim",
      relig==10 ~ "Orthodox"))
gss$religion <- factor(gss$religion,
                       levels=c("Fundamentalist Protestant",
                                "Mainline Protestant",
                                "Catholic",
                                "Orthodox",
                                "Jewish",
                                "Muslim",
                                "Buddhist",
                                "Hindu",
                                "None"))
table(gss$religion, gss$relig, exclude=NULL)

gss <- gss %>%
  mutate(
    religion_spouse = case_when(
      sprel==1 & spfund==1 ~ "Fundamentalist Protestant",
      sprel==1 & spfund!=1 ~ "Mainline Protestant",
      sprel==2 ~ "Catholic",
      sprel==3 ~ "Jewish",
      sprel==4 ~ "None",
      sprel==6 ~ "Buddhist",
      sprel==7 ~ "Hindu",
      sprel==9 ~ "Muslim",
      sprel==10 ~ "Orthodox"))
gss$religion_spouse <- factor(gss$religion_spouse,
                              levels=levels(gss$religion))

table(gss$religion, gss$religion_spouse)


gss$relig_mar <- factor(gss$religion==gss$religion_spouse,
                        levels=c(TRUE, FALSE),
                        labels=c("spouses same religion",
                                 "spouses different religion"))

gss$mar_happy_score <- ifelse(gss$hapmar==0 | gss$hapmar>=8, NA, 4-gss$hapmar)
gss$mar_happy_cat <- factor(gss$mar_happy_score,
                            levels=1:3,
                            labels=c("not too happy","pretty happy","very happy"))
table(gss$mar_happy_cat, gss$mar_happy_score, exclude=NULL)

gss$age <- ifelse(gss$age>89, NA, gss$age)

gss$region <- factor(ifelse(gss$region<=2, "Northeast",
                            ifelse(gss$region<=4, "Midwest",
                                   ifelse(gss$region<=7, "South", "West"))),
                     levels=c("Northeast","Midwest","South","West"))

gss$num_child <- ifelse(gss$childs>8, NA, gss$childs)

gss$emp_status <- factor(ifelse(gss$wrkstat<=2, "employed",
                                ifelse(gss$wrkstat<=4, "unemployed",
                                       ifelse(gss$wrkstat<=8, "not in labor force", NA))),
                         levels=c("employed","unemployed","not in labor force"))

gss$emp_status_sp <- factor(ifelse(gss$spwrksta<=2, "employed",
                                ifelse(gss$spwrksta<=4, "unemployed",
                                       ifelse(gss$spwrksta<=8, "not in labor force", NA))),
                         levels=c("employed","unemployed","not in labor force"))
table(gss$emp_status, gss$emp_status_sp, exclude=NULL)

gss$family_work <- ifelse(gss$emp_status=="not in labor force" & gss$emp_status_sp=="not in labor force","both partners out of labor force",
                          ifelse(gss$emp_status!="not in labor force" & gss$emp_status_sp!="not in labor force", "both partners working", "one partner working"))
gss$family_work <- factor(gss$family_work, 
                          levels=c("both partners working","one partner working","both partners out of labor force"))
table(gss$family_work, exclude=NULL)

gss$degree <- ifelse(gss$degree>4, NA, gss$degree)
gss$spdeg <- ifelse(gss$spdeg>4, NA, gss$spdeg)

gss$ed_homog <- factor(ifelse(gss$degree>2 & gss$spdeg>2, "both partners college educated",
                              ifelse(gss$degree<=2 & gss$spdeg<=2, "neither partner college educated",
                                     "one partner college educated")),
                       levels=c("neither partner college educated","one partner college educated",
                                "both partners college educated"))

gss <- subset(gss, !is.na(gss$relig_mar) & !is.na(mar_happy_score),
              select=c("mar_happy_cat","mar_happy_score","relig_mar",
                       "age","region","num_child","family_work","ed_homog"))

summary(lm(mar_happy_score~relig_mar*num_child+family_work+num_child+region+ed_homog, 
           data=gss))

gss <- complete(mice(gss, m=1))

save(gss, file="output/gss_relig_exogamy.RData")
