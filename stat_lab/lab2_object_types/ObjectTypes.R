
# Atomic Modes ------------------------------------------------------------

a <- 3
b <- "bob said"
c <- TRUE
a
mode(a)
class(a)
b
mode(b)
class(b)
c
mode(c)
class(c)

# Vectors and Matrices ----------------------------------------------------

#vectors
name <- c("Bob","Juan","Maria","Jane","Howie")
age <- c(15,25,19,12,21)
ate_breakfast <- c(TRUE,FALSE,TRUE,TRUE,FALSE)
name
age
ate_breakfast
mode(name)
class(name)
mode(age)
class(age)
mode(ate_breakfast)
class(ate_breakfast)

#calculate statistics on a vector
mean(age)
mean(ate_breakfast)

#force mode change
as.character(age)
as.numeric(ate_breakfast)
as.numeric(name)

#matrices
x <- matrix(c(4,5,3,9,7,8), 3, 2)
x
mode(x)
class(x)

#create matrix by binding together vectors
a <- c(4,5,3)
b <- c(9,7,8)
cbind(a,b)
rbind(a,b)

#what goes wrong here?
cbind(name, age, ate_breakfast)

#Indexing
name[4]

x
#value in 2nd row, 1st column
x[2,1]
#2nd row
x[2,]
#1st column
x[,1]
#1st and 2nd row
x[c(1,2),]


# Factors -----------------------------------------------------------------

#strings are not categorical variables
high_degree <- c("Less than HS", "College", "HS Diploma", "HS Diploma", "College")
summary(high_degree)

#create a factor
high_degree_fctr <- factor(high_degree)
levels(high_degree_fctr)
summary(high_degree_fctr)
mode(high_degree_fctr)
class(high_degree_fctr)

#re-ordering factors
high_degree_fctr = factor(high_degree,
                           levels=c("Less than HS","HS Diploma","College"))
levels(high_degree_fctr)
summary(high_degree_fctr)

levels(high_degree_fctr)
levels(relevel(high_degree_fctr,"HS Diploma"))

high_degree_nmbr <- c(1,3,2,2,3)
factor(high_degree_nmbr, 
       labels=c("Less than HS","HS Diploma","College"))

# Logical Values and Boolean Statements -----------------------------------

#single statements
age>=18
high_degree=="College"
high_degree!="College"

#compound statements
high_degree=="College" | high_degree=="HS Diploma"
age>=20 & age<25
(age>=20 & age<25) & (high_degree=="College" | high_degree=="HS Diploma")

#reverse a logical value
!ate_breakfast


# Missing Values ----------------------------------------------------------

age[4] <- NA
age

mean(age)
mean(age, na.rm=TRUE)

is.na(age)
!is.na(age)


# Lists -------------------------------------------------------------------

my_list <- list(name, age, ate_breakfast, high_degree_fctr)
my_list
mode(my_list)
class(my_list)

#indexing a list
my_list[[3]]
my_list[[3]][4]

#naming objects in the list and using $ to access
my_list <- list(name=name, age=age, 
                ate_breakfast=ate_breakfast, high_degree=high_degree_fctr)
my_list$age
mean(my_list$age, na.rm=TRUE)

#lapply!
summary(my_list)
lapply(my_list, summary)


# Data Frames -------------------------------------------------------------

my_data <- data.frame(name, age, ate_breakfast, high_degree=high_degree_fctr)
my_data

summary(my_data)

#pull out variables with $
mean(my_data$age, na.rm=TRUE)

#indexing data frame
my_data[3,2]
my_data[3,c("age","ate_breakfast")]

#rename variable
colnames(my_data)
colnames(my_data) <- c("Name","Age","Ate_breakfast","High_degree")
my_data
colnames(my_data)[3] <- "Breakfast"
my_data

#Subsetting data frames
my_data[my_data$High_degree=="College",]
#watch out for missing values!
my_data[my_data$Age>=18,]
my_data[!is.na(my_data$Age) & my_data$Age>=18,]

#subset command is better
subset(my_data, Age>=18)

#keep only certain variables
my_data[,c("Age","High_degree")]
my_data[,c(-1,-3)]

subset(my_data, select=c("Age","High_degree"))


#clean up data
rownames(my_data) <- my_data$Name
my_data2 <- subset(my_data, 
                   !is.na(Age),
                   select=c("Age","Breakfast",
                            "High_degree"))
my_data2


