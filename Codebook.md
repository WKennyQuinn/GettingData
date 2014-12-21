##Codebook.md

This codebook describes variables created and used by run_Analysis.R

Raw data for this anaylsis is sourced from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Descriptions of the files and variables used in the raw data can be found in the .txt files included in the source files.

===========================================

## EXPERIMENTAL STUDY DESIGN

Data used in this analysis was collected by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio and, Luca Oneto. Source:
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

The readme file in the source data specifies the experimental design as the following: 
"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment."



##CODE VARIABLES (in order of creation)

The following variables are used in run_Analysis.R execution
- fileURL: URL of source data
- destfile: name of downloaded source data
- dateDownloaded: date source file was downloaded

- X_test - from source data. Measurements (num) of test set. 
- y_test - from source data. Activities (int) of test set.
- subject_test - from source data. Subject ID (int) of test set.
- X_train - from source data. Measurements (num) of trial set.
- y_train - from source data. Activities (int) of trial set.
- subject_train - from source data. Subject ID (int) of trial set.
- features - from source data. Key for measurement descriptive variable names.
- activity_labels - from source data. Key for activity descriptive names.

- HAR_data - X_test and X_train merged using rbind()
- HAR_subject - subject_test and subject_trian merged using rbind()
- HAR_activity - y_test and y_train merged using rbind()

- MeanFeatureCols - Column indices (int) of HAR_data variables containing mean()
- StdFeatureCols - Column indices (int) of HAR_data variables containing std
- HAR_data_subset - Subset of HAR_data containing the column specified by indices above

- HAR_activity - converted from (int) to (chr) using descriptive names in "activity_labels.txt"

- HAR_merge - HAR_subject, HAR_activity, and HAR_data_subset merged to single data frame
- HAR_Summary - All measurements of each subject/activity pair grouped and summarized via mean. 

# DATA VARIABLES

The final *HAR_Summary* output dataframe includes the following variables:

- Subject_ID - int - numeric identifier of subject (1:30)
- Activity - chr - description of activity observed (Laying,Sitting,Standing,Walking,Walking_Downstairs,Walking_Upstairs)
- Mean of the mean and standard deviation variables from the feature selection in the source data (detailed in feature_info.txt, reproduced below for reference)


Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

