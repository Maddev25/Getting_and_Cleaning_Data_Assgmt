# Getting_and_Cleaning_Data_Assignment
Week 4 Assignment for Getting and Cleaning Data Course 

This repo was created as part of the assignment for week 4 of Getting and Cleaning Data course in Data Sceience Specilization.

Steps to follow

    1. Firstly download the R source code "run_analysis.R" into your R working directory.
    2. Then execute R source code to generate tidy data file which would download the raw data set as mentioned in the assignment
       and generate tidy data set

Data description

  The variables in the data X are sensor signals measured with waist-mounted smartphone from 30 subjects. 
  The variable in the data Y indicates activity type the subjects performed during recording.

Code explanation

  The code combined training dataset and test dataset, and extracted partial variables to create another dataset with the averages of each variable for each activity.
  New dataset

  The new generated dataset contained variables calculated based on the mean and standard deviation. Each row of the dataset is an 
  average of each activity type for all subjects.The code was written based on the instruction of this assignment

Read training and test dataset into R environment. Read variable names into R envrionment. Read subject index into R environment.

    Merges the training and the test sets to create one data set. Use command rbind to combine training and test set
    Extracts only the measurements on the mean and standard deviation for each measurement. 
    Use grep command to get column indexes for variable name contains "mean()" or "std()"
    Uses descriptive activity names to name the activities in the data set. 
    Convert activity labels to characters and add a new column as factor
    Appropriately labels the data set with descriptive variable names. 
    Give the selected descriptive names to variable columns
    From the data set created in last step, creates a second, independent tidy data set with the average of 
    each variable for each activity and each subject. 
    Use chaining operator available under dplyr package to create a new tidy dataset with 
    command group_by and summarize_all functions. 

