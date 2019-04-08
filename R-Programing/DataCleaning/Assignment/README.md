<ul>

This is a homework assignment for data cleaning using R. The data (Human Activity Recognition Using Smartphones Dataset, Version 1.0) was collected from the accelerometers from the Samsung Galaxy S smartphone and could be extracted from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The feature measurements were collected from total of 30 participants with n=21 in training dataset and n=9 in testing dataset. As quoted from the study file, “Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist”.  The feature measurements used in this cleaning data assignment included (total of 33 features * 2 for mean + standard deviation from the signals): 

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

<li> From the “run_analysis.R” file, I did the following steps and resulted with a tidy file named “tidy.ave.dat”.
<br/>1.	Merges the training and the test sets to create one data set.  
<br/>2.	Extracts only the measurements on the mean and standard deviation for each measurement.  
<br/>3.	Uses descriptive activity names to name the activities in the data set  
<br/>4.	Appropriately labels the data set with descriptive variable names.   
<br/>5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  <br />
</li>



The CodeBook.md provided the variable information that presented in the “tidy.ave.dat”.

Reference: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012


</ul>

