# Code book
This is the code book for the data cleaning coursera project.
Find here descriptions of variables, data and any transformations peformed to clean up the data.

## Data
X_train.txt: Measurements train data.
Y_train.txt: Activity train data. Numbers represent activities.
subject_train.txt: Subject number labels for the training set. 
X_test.txt: Measurements test data.
Y_test.txt: Activity test data. Numbers represent activities.
subject_test.txt: Subject number labels for the test set.
features.txt: names for all the columns in the measurement data.

## Variables
root_path: the path to the data root.
test_path: the path to the test data root.
train_path: the path to the train data root.

test.x: temporary variable containing X data for the test set _(X_test.txt)_.
test.y: temporary variable containing Y data for the test set _(Y_test.txt)_.
test.subject: temporary variable containing a list of numbers representing (part of) the 30 test subjects _(subject_test.txt)_.

train.x: temporary variable containing X data for the train set _(X_train.txt)_.
train.y: temporary variable containing Y data for the train set _(Y_train.txt)_.
train.subject: temporary variable containing a list of numbers representing (part of) the 30 test subjects _(subject_train.txt)_.

varnames: contains the variable/feature names. Read from _"features.txt"_.
train.complete: combines train.x, train.y and train.subject into one data set.
test.complete: combines test.x, test.y and test.subject into one data set.
data.complete: combines train.complete and test.complete into one data set.

labeldata: names for the various activities in the data set.
data.complete.filtered: this is a sub set of the _data.complete_ set. Only the mean and standard deviation columns are selected. As well as activity and subject.

averagedGroups: the _data.complete.filtered_ set grouped by _subject_ and _activity_ columns and with the values averaged.

## Transformations
Train and test data was read in and combined using rbind. 
The required columns were selected using a regular expression.
Activity labels were added based on numbers in the activity column and data in the activity_labels.txt file.
Data was grouped and averaged using the _aggregate_ function to produce a the final data set __averagedGroups__.


