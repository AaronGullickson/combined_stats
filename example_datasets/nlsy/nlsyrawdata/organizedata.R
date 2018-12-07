#create NLSY97 data for analyzying event history models

source("for513.R")

nlsy <- new_data

#analyze highest grade completed by 1997 by current grade in 1997
table(nlsy$R0034200, nlsy$E5281700)

#these don't line up exactly I think because difference in school year
#vs calendar year, but some other weirdness like the 1192 people who
#say grade 7 is highest completed but then are listed as 9th grade in 
#1997. I think I will use the current grade in 1997 as grade

nlsy$grade1997 <- nlsy$E5281700

#for event history dates, everything is recorded in months since January 1980.
nlsy$age <- nlsy$R1193900
#add a random day to age to avoid overplotting
nlsy$age <- nlsy$age+sample(0:30/31,nrow(nlsy),replace=TRUE)

nlsy$startdate <- nlsy$R1209300
nlsy$enddate <- nlsy$Z9084800
#did the event occur or censored
nlsy$Z9084900[nlsy$Z9084900==95] <- NA
nlsy$dropout <- nlsy$Z9084900<12

#rename variables
nlsy$intdate1997 <- nlsy$startdate
nlsy$intdate1998 <- nlsy$R2568200
nlsy$intdate1999 <- nlsy$R3890100
nlsy$intdate2000 <- nlsy$R5472200
nlsy$intdate2001 <- nlsy$R7236000

nlsy$income1997 <- nlsy$R1204500
nlsy$income1998 <- nlsy$R2563300
nlsy$income1999 <- nlsy$R3884900
nlsy$income2000 <- nlsy$R5464100
nlsy$income2001 <- nlsy$R7227800

nlsy$twobio1997 <- nlsy$R1205300==1
nlsy$twobio1998 <- nlsy$R2563600==1
nlsy$twobio1999 <- nlsy$R3885200==1
nlsy$twobio2000 <- nlsy$R5464400==1
nlsy$twobio2001 <- nlsy$R7228100==1

nlsy$sex <- factor(nlsy$R0536300, 
                        levels=c(1.0,2.0), 
                        labels=c("Male",
                                 "Female"))

#simplify race to white, black, hispanic, other
nlsy$race <- rep("Other", nrow(nlsy))
nlsy$race[nlsy$R0538700==1 & nlsy$R1482600==4] <- "White"
nlsy$race[nlsy$R0538700==2 & nlsy$R1482600==1] <- "Black"
nlsy$race[nlsy$R1482600==2] <- "Hispanic"
nlsy$race <- factor(nlsy$race)
nlsy$race <- relevel(nlsy$race, "White")


#lets truncate if after december 2001 (264)
nlsy$dropout[nlsy$enddate>264] <- FALSE
nlsy$enddate[nlsy$enddate>264] <- 264

summary(nlsy[,c("age","startdate","enddate","dropout")])

#remove missing values on enddate, dropout, and individuals who were not in high school in 1997
#or had the event before startdate
nlsy <- subset(nlsy, subset=!is.na(enddate) & !is.na(dropout) & grade1997>=9 & (enddate-startdate)>0 & race!="Other" &
                 !is.na(intdate1998) & !is.na(intdate1999) & !is.na(intdate2000) & !is.na(intdate2001),
               select=c("startdate","enddate","age","dropout","grade1997", "sex", "race",
                        "intdate1997","intdate1998","intdate1999","intdate2000","intdate2001",
                        "income1997","income1998","income1999","income2000","income2001",
                        "twobio1997","twobio1998","twobio1999","twobio2000","twobio2001"))

nlsy$race <- droplevels(nlsy$race)

nrow(nlsy)
mean(nlsy$dropout)
summary(nlsy$enddate-nlsy$startdate)
hist(nlsy$enddate-nlsy$startdate, col="red")

#convert dates and age
nlsy$age <- nlsy$age/12

convertdate <- function(x) {
  return(x/12+1980)
}

nlsy[,c("startdate","enddate","intdate1997",
        "intdate1998","intdate1999","intdate2000","intdate2001")] <- convertdate(nlsy[,c("startdate",
                                                                                         "enddate","intdate1997",
                    "intdate1998","intdate1999","intdate2000","intdate2001")])
nlsy$time <- nlsy$enddate-nlsy$startdate

#MICE the missing values
library(mice)
nlsy <- complete(mice(nlsy, 1),1)

#create lexis diagram
nlsy.sample <- nlsy[sample(1:nrow(nlsy),50),]

plot(-1,-1, xlim=c(1997,2002),
     ylim=c(min(nlsy.sample$age), max(nlsy.sample$age+nlsy.sample$time)),
     las=1, xlab="calendar year", ylab="age")
abline(h=c(14:19), col="grey", lty=2)
abline(v=c(1998:2001), col="grey", lty=2)
abline(v=2002, col="darkgreen", lty=1, lwd=2)
segments(nlsy.sample$startdate, nlsy.sample$age, nlsy.sample$enddate, 
         nlsy.sample$age+nlsy.sample$time)
temp <- nlsy.sample$enddate
temp[temp>=2002] <- NA
points(temp, nlsy.sample$age+nlsy.sample$time, pch=21,
       bg=c("grey","red")[nlsy.sample$dropout+1], cex=0.7)


save(nlsy, file="../nlsydropout.RData")