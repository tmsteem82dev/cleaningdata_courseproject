# Cleaning data coursera project
This project contains one script "run_analysis.R". All actions are contained withing the script. 
The script will load data contained in the "./data/UCI HAR Dataset" folder and its subfolders.
Merge the various files for (X,Y, subjects, features) into one data set for both train and test data. It will then combine the two data sets, train and test, into one data set.

Finally a new data set is created where the averages of the mean and standard deviation of measurements have been calculated and grouped by subject and activity.

### The data
The data represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
Taken from 30 subjects during 6 different categories: 
* Laying
* Sitting
* Standing
* Walking
* Walking downstairs
* Walking upstairs

 
