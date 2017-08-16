## Getting and Cleaning Data Week 4 Assignment 
## Author Vasudevan D 
## Date   13/Aug/2017 
## Goal is to create a tiny Data set and store proper instructions for the given Raw Data 

##1. Download & unzip the Raw data set file in data folder under working directory

if(!file.exists("./data")){dir.create("./data")}
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "./data/UCIDataSet.zip")
unzip(zipfile = "./data/UCIDataSet.zip", exdir = "./data" )

##2. List the files available in the unzipped folder 
fp <- file.path("./data", "UCI HAR Dataset")
fileSet <- list.files(path = fp , recursive = TRUE) 
fileSet

## For the purposes of this project, the files in the Inertial Signals folders are not used. The files that will be used to load data are listed as follows:
##test/subject_test.txt
##test/X_test.txt
##test/y_test.txt
##train/subject_train.txt
##train/X_train.txt
##train/y_train.txt

## See Readme.txt available in the UCI HAR Dataset folder for dataset conditions 

##3. Extract the Test, train and variable data from the above mentioned text files 
library(dplyr)

## Read Training Data 
X_train  <- read.table(file.path(path= fp, "train" , "X_train.txt"), header = FALSE) 
Y_train  <- read.table(file.path(path= fp, "train" , "y_train.txt"), header = FALSE) 
S_train  <- read.table(file.path(path= fp, "train" , "subject_train.txt"), header = FALSE) 

## Read Test Data 
X_test  <- read.table(file.path(path= fp, "test" , "X_test.txt"), header = FALSE) 
Y_test  <- read.table(file.path(path= fp, "test" , "y_test.txt"), header = FALSE) 
S_test  <- read.table(file.path(path= fp, "test" , "subject_test.txt"), header = FALSE) 

## Read Data Description 
vNames <- read.table(file.path(path= fp, "features.txt"), header = FALSE) 

## Read Activity Lables 
aLables <- read.table(file.path(path= fp, "activity_labels.txt"), header = FALSE) 

## Look at the Data extracted 
str(X_train)
str(Y_train)
str(S_train)
str(X_test)
str(Y_test)
str(S_test)
str(vNames)
str(aLables)


##4. Merges the training and test data set in to one 
X_merged <- rbind(X_train, X_test)
Y_merged <- rbind(Y_train, Y_test)
S_merged <- rbind(S_train, S_test)

## Look at the merged data 
head(X_merged)
head(Y_merged)
head(S_merged)

##5. Extract only the measurements on mean and standard deviation for each of the measurement

msdVariables <- vNames[grep("mean\\(\\)|std\\(\\)", vNames[,2]),] 
X_merged <- X_merged[,msdVariables[,1]]

## Look at the subset of merged data with mean and std vaues alone
X_merged

##6. Use Descriptive Activity names to name the activities in the data set 
colnames(Y_merged) <- "activity"
Y_merged$activitylabel <- factor(Y_merged$activity, labels = as.character(aLables[,2]))
activitylabel <- Y_merged[,-1]

## Look at the new Y_merged Data 
Y_merged  

##7. Appropriately label the data set with descriptive variable names 
colnames(X_merged) <- vNames[msdVariables[,1],2]

##In this part, Names of Features will labelled using descriptive variable names.
##prefix t is replaced by time
##Acc is replaced by Accelerometer
##Gyro is replaced by Gyroscope
##prefix f is replaced by frequency
##Mag is replaced by Magnitude
##BodyBody is replaced by Body

names(X_merged)<-gsub("^t", "time", names(X_merged))
names(X_merged)<-gsub("^f", "frequency", names(X_merged))
names(X_merged)<-gsub("Acc", "Accelerometer", names(X_merged))
names(X_merged)<-gsub("Gyro", "Gyroscope", names(X_merged))
names(X_merged)<-gsub("Mag", "Magnitude", names(X_merged))
names(X_merged)<-gsub("BodyBody", "Body", names(X_merged))

## Look at the new X_merged 
X_merged


##8. From the Data set in the above step, create a second independent tidy data set 
## with the average of each variable for each activity and each subject 
colnames(S_merged) <- "subject"
newDataSet <- cbind(X_merged, activitylabel, S_merged)
newDSMean <- newDataSet %>% group_by(activitylabel,subject) %>% summarize_all(funs(mean))
write.table(newDSMean, file = "./data/UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)










