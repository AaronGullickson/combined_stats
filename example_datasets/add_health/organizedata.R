#load the data
load("21600-0001-Data.rda")
base <- da21600.0001
base$AID <- as.character(base$AID)
load("21600-0003-Data.rda")
#just grab the in-degree (number of nominations) and AID for networks
network <- da21600.0003[,c("AID","IDGX2")]
colnames(network) <- c("AID","indegree")
network$AID <- as.character(network$AID)

load("21600-0004-Data.rda")
weights <- da21600.0004
weights$AID <- as.character(weights$AID)
colnames(weights) <- c("AID","cluster","sweight")


#merge them
base <- merge(base, network, by="AID")
base <- merge(base, weights, by="AID")

#remove missing values for indegree (not part of the network sample?)
base <- subset(base, !is.na(indegree))

##DEMOGRAPHIC

#race (best race+hispanicity)
base$race <-substr(as.character(base$H1GI9),8,200)
base$race[base$H1GI4=="(1) (1) Yes"] <- "Latino"
base$race <- factor(base$race, names(sort(table(base$race), decreasing=TRUE)))
base$sex <- substr(as.character(base$BIO_SEX),8,200)
base$grade <- as.numeric(base$H1GI20)+6

##ACADEMIC ACHIEVEMENT
temp <- base[,paste("H1ED",11:14,sep="")]
temp[!is.na(temp) & temp=="(5) (5) Didn't take this subject"] <- NA
temp[!is.na(temp) & temp=="(6) (6) Took subject/wasn't graded this way"] <- NA
english <- 5-as.numeric(temp[,1])
math <- 5-as.numeric(temp[,2])
history <- 5-as.numeric(temp[,3])
science <- 5-as.numeric(temp[,4])
temp <- cbind(english,math,history,science)
base$pseudoGPA <- apply(temp,1,mean,na.rm=TRUE)
base$honorsociety <- base$S44A31=="(1) (1) Marked"

##SUBSTANCE USE
#Drink at least once a month
base$alcoholuse <- base$H1TO12!="(0) (0) No (skip to Q.29)" & 
  base$H1TO15!="(6) (6) 1 or 2 days in past 12 months" &
  base$H1TO15!="(5) (5) Once a month or less (3-12 times in past 12 months)" &
  base$H1TO15!="(7) (7) Never (skip to Q.29)"

base$alcoholuse <- factor(base$alcoholuse,
                          levels=c("FALSE","TRUE"),
                          labels=c("Non-drinker","Drinker"))

#smoke more than five cigarettes in last 30 days
base$smoker <- base$H1TO1!="(0) (0) No (skip to Q.9)" & 
  base$H1TO2!="(00) (0) Never smoked a whole cigarette (skip to Q.9)" & 
  base$H1TO5>5

base$smoker <- factor(base$smoker,
                      levels=c("FALSE","TRUE"),
                      labels=c("Non-smoker","Smoker"))

###STUDENT ACTIVITIES
base$bandchoir <- base$S44A13=="(1) (1) Marked" | base$S44A15=="(1) (1) Marked" | base$S44A16=="(1) (1) Marked"
base$academicclub <- apply(base[,paste("S44A",c(1:6,10:12),sep="")]=="(1) (1) Marked",1,sum)>0
base$nsports <- apply(base[,paste("S44A",18:29,sep="")]=="(1) (1) Marked",1,sum)
#top code nsports
base$nsports[base$nsports>6] <- 6


#get final data
addhealth <- base[,c("indegree","race","sex", "grade","pseudoGPA","honorsociety",
                     "alcoholuse","smoker","bandchoir","academicclub","nsports")]

hist(addhealth$indegree, col="green")
barplot(table(addhealth$alcoholuse))
barplot(table(addhealth$smoker))

table(addhealth$alcoholuse, addhealth$smoker)

model.alcohol <- lm(indegree~alcoholuse, data=addhealth)
model.smoker <- update(model.alcohol,.~.-alcoholuse+smoker)
model.both <- update(model.alcohol,.~.+smoker)
model.demog <- update(model.both,.~.+race+sex+grade)
model.academic <- update(model.demog,.~.+pseudoGPA+honorsociety)
model.activities <- update(model.academic,.~.+bandchoir+academicclub+nsports)
model.interaction <- update(model.activities, .~.+nsports*smoker+nsports*alcoholuse)

#get the final data plus weight characteristics and income
base$parentinc <- base$PA55
#topcode parent inc at 200K
base$parentinc[base$parentinc>200] <- 200

addhealth <- base[,c("indegree","race","sex", "grade","pseudoGPA","honorsociety",
                     "alcoholuse","smoker","bandchoir","academicclub","nsports","parentinc","cluster","sweight")]

#no missing values, impute with MICE
library(mice)

addhealth  <- complete(mice(addhealth,1))

save(addhealth, file="addhealth.RData")

