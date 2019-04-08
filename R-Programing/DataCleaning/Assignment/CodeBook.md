# CodeBook

| Column        |    Summary        | Note  |
| ------------- |:-------------:| -----:|
| ID            | Number: 1 - 30 | Participant ID |
| Act.label     |  Character: activity performance     |   coded as 1-6 in the datasheet |
|               | WALKING      |     |


<li>“ID”: participant ID; range from 1-30.

<li>“Act.label”: Activity label; 6 activities were performed: 
<br />1.	WALKING,  
<br />2.	WALKING_UPSTAIRS,  
<br />3.	WALKING_DOWNSTAIRS,  
<br />4.	SITTING,  
<br />5.	STANDING,  
<br />6.	LAYING  

<li>“dat.set”: Which dataset were extracted for the participant: 
<br />1.	Train: from training data directory,  
<br />2.	Test:  from testing data directory  

<li>The variables from column D – BQ (“tBodyAcc-mean-X” – “fBodyBodyGyroJerkMag-std”) were continuous variables to average the corresponding repeated measurements for each participant who performed that specific activity. For example, column “tBodyAcc-mean-X” is the average value for the feature variable “tBodyAcc-mean()-X” in the dataset for a specific participant performing a specific activity.
 
