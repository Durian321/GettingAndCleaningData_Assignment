# GettingAndCleaningData_Assignment
Assignment for Coursera Course Getting and Cleaning Data

How the script works:

0.1 The libraries plyr, dplyr and reshape are imported into the R environment
0.2 The separate files in the test and trial folders are read into R and stored as data frames

1.0 The training and test data sets are combined
1.1 The columns of each data set are named with titles to describe the variables

2.0 A list is created that recognises which variables contain mean or standard deviation data in the X files
2.1 The data sets are combined into a single data frame, containing only the mean and standard deviation data

3.0 The activity variable is modified to store a string describing the activity instead of an integer

4.0 The variables have already been given descriptive names in step 1.1

5.0 A second, independent tidy data set is created, which contains the average of each veriable per subject per activity
