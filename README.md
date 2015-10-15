# Getting and Cleaning Data Course Project
## Assignment description

You should create one R script called run_analysis.R that does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## How the run_analyse script works

**1 - Reading and merging data**

  a. Reads data for train set (subject,x,y) and binds it by columns.  
  b. Repeats step "a" for test set.  
  c. Merges data from train and test set binding them by row.  

**2 - Labeling and subsetting**

  a. Reads the features file and assigns label to columns in merged dataframe.  
  b. picks relevant features and subsets the dataframe.  

  **Please note** based on assignment description n°2
  the regex expression filters out:

    - set of meanFreq() variables

    All of the following vectors used on the angle() variable

      - gravityMean
      - tBodyAccMean
      - tBodyAccJerkMean
      - tBodyGyroMean
      - tBodyGyroJerkMean

**3 - Editing the activity variable**

  a. Reads the activity labels file.  
  b. Replaces activity ids with activity names.  

**4 - Creating a second tidy dataset**

There are different viable ways to achieve this, either by aggregating, reshaping or
using dplyr. I went the **dplyr** way:

  a. assign the merged dataframe to a "local" dataframe.  
  b. group the local dataframe by activity and subject.  
  c. summarise each column via mean function.  
  d. arrange by activity and subject.  
  e. write resulting tidy dataset to file.  


## How to test the script

1. Download [dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
and extract to your working directory (or just set your working directory to the dir you extracted the dataset in after extraction).  
2. [Download]("https://github.com/LoGreHub/gettingandcleaningdata/blob/master/run_analysis.R") the script
and place it into your working directory.  
3. Execute source("run_analysis.R").  
4. Execute submit() and it will generate a new file called "tiny_dataset.txt" in your working directory.

## Dependencies

Only dependency is dplyr. It will be installed by the script in case it is not already installed.  
