############################################################################
# This script will process the student data from the Canvas student survey.  
# This student data can be downloaded by going to the Assignment page for the 
# survey, selecting "Survey Statistics" and clicking "Student Analysis"

students <- read.csv("../ExampleDatasets/sources/studentsFall2017.csv")

students$football <- grepl("American Football",temp[,11])
students$basketball <- grepl("Basketball",temp[,11])
students$baseball <- grepl("Baseball",temp[,11])
students$soccer <- grepl("Soccer",temp[,11])
students$hockey <- grepl("Hockey",temp[,11])

#The other gender category is deductively identifiable, so treat as NA
#students$sex[students$sex=="Other"] <- NA
#students$sex <- as.factor(as.character(students$sex))
students$gender <- factor(students$gender, levels=c("Male","Female"))

#anybody who reported 6 or less for height, assume they were reporting in feet
temp <- students$height[students$height<6]
temp <- floor(temp)*12 + 10*(temp %% floor(temp))
students$height[students$height<6] <- temp

#missing values for class, and reorder
students$class[students$class==""] <- NA
students$class <- as.factor(as.character(students$class))
students$class <- relevel(students$class, "Upper class")
students$class <- relevel(students$class, "Upper middle class")
students$class <- relevel(students$class, "Middle class")
students$class <- relevel(students$class, "Working class")

students$class <- relevel(students$class, "Lower class")

#check for other errors
summary(students)

save(students, file="../ExampleDatasets/studentsCurrent.RData")

source("samplingdist.r")