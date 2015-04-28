###THE ACTUAL REPO IS https://github.com/Blowoffvalve/Getting-and-Cleaning-Data

###Read the data sets into R
###Read the training set into R
train<- read.table('UCI HAR Dataset/train/X_train.txt')
###Read the test set into R
test<-  read.table('UCI HAR Dataset/test/X_test.txt')

###Apply the activity labels for each dataSet
###For train dataset
train_label<- read.table('UCI HAR Dataset/train/y_train.txt')
###For test dataset
test_label<- read.table('UCI HAR Dataset/test/y_test.txt')

###Merge both data sets into a new dataset
###According to Step 1 of the project instructions
mergedData<- rbind(train, test)

##Merge both activity labels into a table
mergedData_ActivityLabel<- rbind(train_label,test_label)

###Assign mergedData column names
###read the variable names from features.txt
varNames<-read.table('UCI HAR Dataset/features.txt')
varNames<- varNames[[2]]
###Remove all punctuation characters from the varNames
##Load stringr package
library(stringr)
varNames<- str_replace_all(varNames, "[[:punct:]]", "")
##Assign mergedData_ActivityLabel with a column name to 
##enable us distinguish it later
colnames(mergedData_ActivityLabel)<- "activityLabel"

###Use a cbind to add mergedData_ActivityLabel as a new column
mergedData<- cbind(mergedData, mergedData_ActivityLabel)

### extract all columns that contain mean, sd
### Load dplyr first
library(dplyr)
ag <- aggregate(. ~ActivityLabels, relevantCols, function(x) c(median=median(x)))
print(ag)
