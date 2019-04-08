
#1.	Merges the training and the test sets to create one data set.

feature.dat <- read.table("./UCI HAR Dataset/features.txt", 
                          col.names = c("Column", "Feature Name"))
dim(feature.dat) ### total of 561 features
feature.dat$Feature.Name <- as.character(feature.dat$Feature.Name)

#### Trainning data######
#### train.sub: subject ID
#### train.x: measurments (at each column) for each row
#### train.y: activity lable for each row
train.sub <- read.table("./UCI HAR Dataset/train/subject_train.txt", 
                        col.names = c("ID"))

train.sub$dat.set <- "Train" ### indicator of which data

train.x <- read.table("./UCI HAR Dataset/train/X_train.txt", 
                      col.names = paste("F",c(1:561),sep=".")) ### col.names temperary named as F.XX (feature XX)

train.y <- read.table("./UCI HAR Dataset/train/y_train.txt",
                      col.names = "Act.label") ### column indicates the corresponding activity label: 1-6

##### Testing data. repeat the above step ###
test.sub <- read.table("./UCI HAR Dataset/test/subject_test.txt", 
                       col.names = c("ID"))
test.sub$dat.set <- "Test" ### indicator of which data

test.x <- read.table("./UCI HAR Dataset/test/X_test.txt", 
                     col.names = paste("F",c(1:561),sep=".")) ### col.names temperary named as F.XX (feature XX)

test.y <- read.table("./UCI HAR Dataset/test/y_test.txt",
                     col.names = "Act.label") ### column indicates the corresponding activity label: 1-6

#### double check for the length of rows in train/test data
#### and the same column rows between train and test data #### 
(dim(train.sub)[1]==dim(train.x)[1] & dim(train.sub)[1]==dim(train.y)[1])
(dim(test.sub)[1]==dim(test.x)[1] & dim(test.sub)[1]==dim(test.y)[1])
dim(train.x)[2]==dim(test.x)[2]


#2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
### dat.temp: we use grep to get the columns contained "mean()" or "std()" words ###

use.feature.col <- sort(union(grep("mean\\(\\)",feature.dat$Feature.Name),
                              grep("std\\(\\)",feature.dat$Feature.Name)))

## based on features.information.txt with 33 feature variables * 2 for mean and std
length(use.feature.col)
## [1] 66

dat.temp <- data.frame(rbind(cbind(train.sub,train.y,train.x[,use.feature.col]),
                             cbind(test.sub,test.y,test.x[,use.feature.col])))
names(dat.temp)[-c(1:3)] <- feature.dat$Feature.Name[use.feature.col] ### label features to the column names 

#3.	Uses descriptive activity names to name the activities in the data set
act.label.dat <- read.table("./UCI HAR Dataset/activity_labels.txt", 
                            col.names = c("activity.num", "label"))
act.label.dat$label <- as.character(act.label.dat$label)

dat.temp$Act.label <- factor(dat.temp$Act.label,
                             levels = c(1:6),
                             labels = act.label.dat$label)

#4.	Appropriately labels the data set with descriptive variable names.
### I just renamed the variable name like "-mean()-X" as ".mean.X"
names(dat.temp) <- gsub("\\(\\)", "",names(dat.temp))

#5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
### Applied reshape2 package then for each activity and each participant, calculate the average of each variable measurement.  ###
### Note, I think "average of each variable" means the average the repeated measurements for each variable (for example: "tBodyAcc-mean()-X") for each activity and for subject.

library(reshape2)
dat.long <- melt(dat.temp, id.vars=c("ID", "dat.set","Act.label"),
                 variable.name = "Measurement", value.name="Reading")

ave.dat.byfeat.byactivity.byid<-dcast(dat.long, ID+Act.label+dat.set ~ Measurement, mean, na.rm=TRUE, 
                                      value.var = "Reading")

### it will show (30 patients * 6 activities) = 180 rows, with 69 columns (33*2 for mean/sd measurements +  3 for ID, activity lable, and train/testing data)
dim(ave.dat.byfeat.byactivity.byid)
## [1] 180 69

write.csv(ave.dat.byfeat.byactivity.byid, "tidy.ave.dat.csv", row.names=FALSE)

