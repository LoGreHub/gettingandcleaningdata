## Project Description
Tidy dataset creation assignment

## Study design and data processing

### Collection of the raw data
Data was downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Original dataset can be found at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Notes on the original (raw) data
Please download the dataset from the above link and consult:

- readme.txt
- features_info.txt

## Creating the tidy datafile

### Guide to create the tidy data file

1. Download data
2. Merge data
3. Subselect data
4. Summarise data
5. Order data

### Cleaning of the data
Please refer to [this](https://github.com/LoGreHub/gettingandcleaningdata/blob/master/README.md) link for details.

## Description of the variables in the tiny_data.txt file
Tidy dataset consists of 180 observations and 68 variables, describing 66 **average** measurements grouped by
activity and subject.

Measurement variable labels follow both schema and naming of the original dataset **but values actually represent the mean of the values of original measurements grouped by activity and subject.** 

First 2 columns contain categorical data (activity, subject) while all other 66 contain numerical data.

**Activity** may assume 6 different values, namely:

- LAYING
- SITTING
- STANDING
- WALKING
- WALKING_DOWNSTAIRS
- WALKING_UPSTAIRS

**Subject** values range from 1 to 30, representing the 30 people participating in the original experiment.

Please consult the above mentioned documentation for units of measurements of numerical data
(g or radians/second). Please note all numerical variables are normalized in [-1,1].
