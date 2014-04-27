Human Activity Recognition Summary Dataset
========================================================
Anne75

The dataset provided here is based on the larger one found at
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
It was downloaded through http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
on Saturday, April, 12th 2014.

The original dataset is the result of an experiment carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the scientists captured 3-axial linear acceleration and 3-axial angular velocity. The activities have been video-recorded to label the data manually.
Then, 561 features were derived from these measures.
This whole dataset consists in 563 fields:
  -561 measures, 
  - a subject identifier (a number between 1 and 30)
  - a label (the activity performed: a name in walking, walkingUp, walkingDown, sitting, standing, laying)

To build the dataset presented here, only the measurements on the mean and standard deviation for each measurement have been kept. This keeps 66 of them. camelBack notation has been adopted throughout, for consistency and clarity.

Here is how the measurements have been calculated:
Time domain (noted by the prefixe t) raw signals from the accelerometer and gyroscope were measured in X,Y,Z axes and the acceleration was separated into a body and a gravitational component.
This yields here: 
For the acceleration
* tBodyAccMeanX
* tBodyAccMeanY
* tBodyAccMeanZ
* tBodyAccStdX
* tBodyAccStdY
* tBodyAccStdZ
* tGravityAccMeanX
* tGravityAccMeanY
* tGravityAccMeanZ
* tGravityAccStdX
* tGravityAccStdY
* tGravityAccStdZ
For the gyroscope
* tBodyGyroMeanX
* tBodyGyroMeanY
* tBodyGyroMeanZ
* tBodyGyroStdX
* tBodyGyroStdY
* tBodyGyroStdZ

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals. Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm.
This yields here:
For the acceleration
* tBodyAccJerkMeanX
* tBodyAccJerkMeanY
* tBodyAccJerkMeanZ
* tBodyAccJerkStdX
* tBodyAccJerkStdY
* tBodyAccJerkStdZ
* tBodyAccMagMean
* tBodyAccMagStd
* tGravityAccMagMean
* tGravityAccMagStd
* tBodyAccJerkMagMean
* tBodyAccJerkMagStd
For the gyroscope
* tBodyGyroJerkMeanX
* tBodyGyroJerkMeanY
* tBodyGyroJerkMeanZ
* tBodyGyroJerkStdX
* tBodyGyroJerkStdY
* tBodyGyroJerkStdZ
* tBodyGyroMagMean
* tBodyGyroMagStd
* tBodyGyroJerkMagMean
* tBodyGyroJerkMagStd

Finally a Fast Fourier Transform was applied to yield frequency domain signals (prefixe f).
We have:
For the accelerometer:
* fBodyAccMeanX
* fBodyAccMeanY
* fBodyAccMeanZ
* fBodyAccStdX
* fBodyAccStdY
* fBodyAccStdZ
* fBodyAccJerkMeanX
* fBodyAccJerkMeanY
* fBodyAccJerkMeanZ
* fBodyAccJerkStdX
* fBodyAccJerkStdY
* fBodyAccJerkStdZ
* fBodyAccMagMean
* fBodyAccMagStd
* fBodyAccJerkMagMean
* fBodyAccJerkMagStd

For the gyroscope:
* fBodyGyroMeanX
* fBodyGyroMeanY
* fBodyGyroMeanZ
* fBodyGyroStdX
* fBodyGyroStdY
* fBodyGyroStdZ
* fBodyGyroMagMean
* fBodyGyroMagStd
* fBodyGyroJerkMagMean
* fBodyGyroJerkMagStd

Eventually, only a summary of this is kept for the new dataset. 
We keep the average of each variable for each activity and each subject.
In order not to make the names too complex, as this is true for ALL measurements, this is NOT mentionned in the feature names.
The dataset presents itself as
-a subject identifier
-followed by an activity name
-the set of measurements.

As there are 30 volunteers performing 6 activities, the dataset consists in 180 records of 68 fields.



