## Getting and Cleaning Data Week 4 Assignment 
## Author Vasudevan D 
## Date   13/Aug/2017 
## Goal is to create a tiny Data set and store proper instructions for the given Raw Data 

##1. Download & unzip the Raw data set file in data folder under working directory

##if(!file.exists("./data")){dir.create("./data")}
##fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
##download.file(fileURL, destfile = "./data/UCIDataSet.zip")
##unzip(zipfile = "./data/UCIDataSet.zip", exdir = "./data" )

##2. List the files available in the unzipped folder 
fp <- file.path("./data", "UCI HAR Dataset")
fileSet <- list.files(path = fp , recursive = TRUE) 
fileSet


