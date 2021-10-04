## Reading in data adventures!

library(readr)
library(haven)
library(readxl)


# Reading in Text Files ---------------------------------------------------

#read in basic csv
my_data <- read_csv("data.csv")

#read in another delimiter
my_data <- read_delim("data_tab.txt", delim = "\t")
my_data <- read_delim("data.csv", delim = ",")

#messier data
my_data <- read_csv("data_messy.csv", comment = "*",
                    skip = 3, na = c("na"))

#reading in fixed-width
#by width
my_data <- read_fwf("data_fw.txt", 
                    col_positions = fwf_widths(widths=c(5,10,5,6,2),
                                               col_names=c("name","location",
                                                           "race","gender",
                                                           "yrsed")))
#load in some social explorer data


#by starting and end position (useful for skipping)
my_data <- read_fwf("data_fw.txt", 
                    col_positions=fwf_positions(start=c(1, 6,16,21,27),
                                                end  =c(5,15,20,26,28),
                                                col_names=c("name","location",
                                                            "race","gender",
                                                            "yrsed")))

#lets read in some big ipums data
acs2018 <- read_fwf("usa_00084.dat.gz",
                    col_positions=fwf_positions(start=c(55,74,84,85,88,94),
                                                end  =c(56,83,84,87,91,96),
                                                col_names=c("statefip","perwt",
                                                            "gender","age",
                                                            "yrmarr","educ")),
                    col_types=cols(.default = "i"),
                    progress=TRUE)

acs2018$gender <- factor(acs2018$gender,
                         levels=1:2,
                         labels=c("Male","Female"))


# Reading in Binary Data --------------------------------------------------

#reading and writing RData
save(my_data, file="my_data.RData")
load("my_data.RData")

#reading data from other binary formats

#SPSS format SAV
gss2018 <- read_sav("GSS2018.sav")

#read in excel file
my_data <- read_excel("data.xlsx", sheet=1)
