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
  c. Merges data from train and test sets binding them by row.  

**2 - Labeling and subsetting**

  a. Reads the features file and assigns label to columns in merged dataframe.  
  b. picks relevant features and subsets the dataframe.  

  **Please note** based on assignment description n°2
  the regex expression filters out:
- set of *meanFreq()* variables  

  All of the following vectors used on the angle() variable:
- *gravityMean*
- *tBodyAccMean*
- *tBodyAccJerkMean*
- *tBodyGyroMean*
- *tBodyGyroJerkMean*

**3 - Editing the activity variable**

  a. Reads the activity labels file.  
  b. Replaces activity ids with activity names.  

**4 - Creating a second tidy dataset**

There are different viable ways to achieve this, either by aggregating, reshaping or
using `dplyr` (and probably many other as well).

I went the `dplyr` way as it guarantees best readability in code:

  a. assign the merged dataframe to a "local" dataframe.  
  b. group the local dataframe by activity and subject.  
  c. taking averages of measurement values by group as requested.  
  d. order by activity and subject.  
  e. write resulting tidy dataset to file.  

I added code for other aggregation and reshaping implementation at the bottom of the script and commented them, feel free to uncomment and use them instead of the dplyr code, they lead to same results.

## One note regarding labeling  

Points can be made on the need for relabeling both the original dataset and the tidy dataset after taking the means of numerical measurements.  

In first case I didn't proceed with relabeling as there was no way (IMHO obviously) to make labels cleaner while retaining the same degree of semantics depth.  

In second case (and assuming first case) adding any kind of "mean" related prefix or suffix to labels would add semantic mess instad of tidyness. What the value represent is highlighted though in the CodeBook file.

## How to test the script

1. Download [dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
and extract to your working directory (or just set your working directory to the dir you extracted the dataset in after extraction).  
2. Go to the [script page](https://github.com/LoGreHub/gettingandcleaningdata/blob/master/run_analysis.R), copy the script text and paste it to console in R-Studio, then execute.  
You will find a new *tidy_dataset.txt* file created in your working directory.

## Dependencies

Only dependency is `dplyr`. It will be installed by the script in case it is not already installed in your system.  
In case you want to experiment with the `reshape2` method at the bottom , the script will take care of installing duties as well.  
