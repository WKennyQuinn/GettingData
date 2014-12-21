#run_Analysis.R fulfills the course project for Coursera's Getting and Cleaning Data
#Using data collected from smartphone accelerometers, to complete the steps outlined below

fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destfile <- "./HARData.zip"

if(!file.exists("./HARData.zip")){
    download.file(fileUrl,destfile)
    dateDownloaded <- date()
}

#Note - zip file extracted outside of R. Assumes working folder contains contents of HARData

X_test<- read.table("./test/X_test.txt")
y_test<- read.table("./test/y_test.txt")
subject_test<-read.table("./test/subject_test.txt")
X_train<- read.table("./train/X_train.txt")
y_train<-read.table("./train/y_train.txt")
subject_train<-read.table("./train/subject_train.txt")
features<-read.table("./features.txt.",stringsAsFactors=FALSE)
activity_labels<-read.table("./activity_labels.txt",stringsAsFactors=FALSE)

#1. Merges training and test sets
#   Interpretation - combine vertically (row-wise) so that train and test observations are combined
#   Also merge subject and activity columns to data
HAR_data <- rbind(X_train,X_test)
HAR_subject <- rbind(subject_train,subject_test)
HAR_activity <- rbind(y_train,y_test)

#2. Extracts only measurements on the mean and std deviation for each measurement
#   Interpretation - Subset only the columns which are means or standard deviations
#   This is any variable column that contains "mean()" or "std" & doesn't include meanFreq columns
MeanFeaturesCols <- grep("mean\\(\\)",features[,2])
StdFeaturesCols <- grep("std",features[,2])
HAR_data_subset <- HAR_data[,c(MeanFeaturesCols,StdFeaturesCols)]


#3. Uses decriptive names to name the activities in the data set
#   Interpretation - activities are contained as numerics in y_test and y_train files, merged as HAR_activity_merge
#   Character descriptive names for each activity numeric is contained in activity_label.txt
#   Use the activity labels to replace numbers in HAR_activity_merge with names in activity_label
library(plyr)
HAR_activity[,1] <- mapvalues(HAR_activity[,1],from=activity_labels[,1],to=activity_labels[,2])

#4. Appropriately labels the data set with descriptive variable names
#   Interpretation - use features as a list of variable names and assign to merged data
colnames(HAR_data_subset) = features[c(MeanFeaturesCols,StdFeaturesCols),2]
colnames(HAR_subject) = "Subject_ID"
colnames(HAR_activity) = "Activity"

#5. Creates a second, tidy data set with average of each variable for each activity and each subject
#   Interpretation - merge data set with descriptive activity list and subject. 
#   For each activity by each subject, calculate the mean of all variables
HAR_merge <- cbind(HAR_subject,HAR_activity,HAR_data_subset)
HAR_Summary = aggregate(.~Subject_ID+Activity,data=HAR_merge,mean)