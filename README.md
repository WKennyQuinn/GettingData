---
title: "README"
author: "WKennyQuinn"
date: "Saturday, December 20, 2014"
output: html_document
---

# Overview 

run_Analysis.R is a script created to fulfill the requirements of the Course Project for Coursera's Getting and Cleaning Data course. For this project, data is downloaded from the Humany Activity Recognition Using Smartphones Dataset and taken through five steps to demonstrate understanding of the concepts of tidy data. 

# Downloading Data

Source URL and download steps are included in the script. The downloaded data will be saved as "HARData.zip".

**In order for subsequent steps to work, the data from the downloaded .zip file must be extracted and placed in the working directory.**

The downloaded data will contain a README.txt file containing information about the dataset, as well as a features_info.txt file that describes the measurement variables. The pertinent text files are read into R as tables using *read.table()*. Table names are the same as the original .txt names.

# Step 1 - Merging

The downloaded data is grouped in two sets: train and test. These sets are merged using *rbind()*. 

Row-wise binding maintains the tidy-data principle of keeping each observation in a single row, and each variable in a single column.

# Step 2 - Subsetting

The measurements from the raw data which are means or standard deviations are subset to a data.frame named *HAR_Data_Subset*. Subset data is stored as a new data.frame in order to maintain the fidelity of the raw data.

The "features.txt" file from the downloaded dataset is used to determine which measurements are means and standard deviations. *rgrep()* is used to determine which column indices to select based on the measurement names from the "features.txt" file. These indices are used to subset the correct columns.

Note: per my interpretation of the directions, the MeanFreq() columns are not selected, as these are not means of a measurement.

# Step 3 - Descriptive Naming

The raw data contains activity data stored as a numeric indicator (1:6) in "y_test.txt" and "y_train.txt". A key for determing which activities correspond to the numeric indicator is stored separately in "activity_label.txt"

Tidy data should include one table for each "kind" of data. To achieve this, the numeric indicators are changed to descriptive names given in the activity_label.txt file using *mapvalues()*. **plyr package is required in order for *mapvalues()* to run**

# Step 4 - Label the dataset

Variable descriptions in the raw data set are included in the "features.txt" file.

Tidy data should have human-readable variable names which are included with the data. Therefore, the variable names are set using *colnames()*. Because the data was subset earlier, the "features.txt" names have to be subset using the same indices determined in Step 2.

# Step 5 - Summarizing

A final dataframe is created summarizing the subset data. *aggregate()* is used to collapse all data by subject and by activity. The mean for all measurements for each subject and activity pair is computed. 

Per tidy data principles, the mean of each variable is stored in a single column. Each observation (subject/activity pair) is saved as a single row. Each column is labeled with a descriptive, human-readable name.

The final data is stored as *HAR_Summary*.