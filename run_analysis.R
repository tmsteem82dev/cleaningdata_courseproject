#load libraries
library(dplyr)
library(readr)
library(tidyr)
library(ggplot2)


#load data
root_path = "./Data/UCI HAR Dataset"
test_path = paste(root_path,"/test", sep="")
train_path = paste(root_path,"/train", sep="")

#test data
test.x = read_table2(paste(test_path,"/X_test.txt", sep=""),col_names = FALSE)
test.y = read_table2(paste(test_path,"/Y_test.txt", sep=""),col_names = FALSE)
test.subject = read_table2(paste(test_path,"/subject_test.txt", sep=""),col_names = FALSE)

#train data
train.x = read_table2(paste(train_path,"/X_train.txt", sep=""),col_names = FALSE)
train.y = read_table2(paste(train_path,"/y_train.txt", sep=""),col_names = FALSE)
train.subject = read_table2(paste(train_path,"/subject_train.txt", sep=""),col_names = FALSE)

# load feature names data
varnames = read_table2(paste(root_path,"/features.txt", sep=""), col_names = FALSE)
# change column names on data set to be more descriptive
names(test.x) = varnames$X2
names(train.x) = varnames$X2

# merge subject and y data with x for training data
train.complete = train.x
train.complete$activity = train.y$X1
train.complete$subject = train.subject$X1

# merge subject and y data with x for test data
test.complete = test.x
test.complete$activity = test.y$X1
test.complete$subject = test.subject$X1

#merge training and test sets into one data set
data.complete = rbind(train.complete,test.complete)

#Extract only the measurements on the mean and the standard deviation for each measurement
# also keep the subject and activity columns
data.complete.filtered = data.complete[,grepl("std|activity|mean|subject", names(data.complete)) & 
                                         !grepl("Freq",names(data.complete))]

#Use descriptive activity names to name the activities in the data set
#read in the label data
labeldata = read_table2(paste(root_path,"/activity_labels.txt", sep=""), col_names = FALSE)
#use the label data to replace the activity column values with text
data.complete.filtered$activity = labeldata$X2[data.complete.filtered$activity]

# check column names
names(data.complete.filtered)

# From the data set in step 4, creates a second, independent 
#tidy data set with the average of each variable for each activity and each subject
averagedGroups = aggregate(data.complete.filtered[,1:66], list(data.complete.filtered$subject, data.complete.filtered$activity), mean)
#set subject and activity column names again for new data frame
names(averagedGroups)[1:2] = c("subject", "activity")


# simple plot to look at part of the data
averagedGroups$subject = as.factor(averagedGroups$subject)
averagedGroups$activity = as.factor(averagedGroups$activity)
averagedGroups %>% ggplot(aes(`tBodyAcc-mean()-X`, `tBodyAcc-mean()-Y`, color=subject)) + 
  geom_point() +
  facet_grid(.~activity)

