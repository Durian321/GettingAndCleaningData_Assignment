#0.1 Import libraries
library(plyr, dplyr, reshape)

#0.2 Read data from files
  #test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
  #train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
  #test_X <- read.table("UCI HAR Dataset/test/X_test.txt")
  #train_X <- read.table("UCI HAR Dataset/train/X_train.txt")
  #test_Y <- read.table("UCI HAR Dataset/test/Y_test.txt")
  #train_Y <- read.table("UCI HAR Dataset/train/Y_train.txt")
  #features <- read.table("UCI HAR Dataset/features.txt")
  #activities <- read.table("UCI HAR Dataset/activity_labels.txt")


# .:STEP 1:. Merge the training and test sets to create one data set
# 1.0 Merge the training and test sets (these are combined into a single data set later)
bound_subjects <- bind_rows(test_subjects, train_subjects)
bound_X <- bind_rows(test_X, train_X)
bound_Y <- bind_rows(test_Y, train_Y)

# 1.1 Rename Columns to describe data
colnames(bound_subjects) <- "Subject"
colnames(bound_X) <- features$V2
colnames(bound_Y) <- "Activity"


# .:STEP 2:. Extract only the measurements on mean and std for each measurement
# 2.0 Identify which columns contain measurements on mean and std
relevant_cols <- grep("mean|std", features$V2)

# 2.1 Combining all data sets into a single data frame, extracting only the mean and std
combined_data <- bind_cols(bound_subjects, bound_Y, bound_X[,relevant_cols])


# .:STEP 3:. Use descriptive activity names to name the activities in data set
# 3.0 Renaming activities using data from activity_labels.txt
combined_data$Activity <- factor(combined_data$Activity, labels = activities$V2)


# .:STEP 4:. Labels the data set with descriptive variable names
# 4.0 See step 1.1, the variable names have followed through

# .:STEP 5:. Create a second, independent tidy data set with average of each variable 
# for each activity and each subject
tidy_data <- ddply(combined_data, c("Subject", "Activity"), numcolwise(mean))
write.table(tidy_data,file="tidy_data.txt", row.name=FALSE)