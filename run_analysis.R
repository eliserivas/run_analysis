library(dplyr)
setwd("C:/Users/elrivas/Documents/Trainings/JHU/Class3/Course Project/UCI HAR Dataset")

### Merges the training and the test sets to create one data set.

# Load labels
activity_labels <- read.table("activity_labels.txt", col.names = c("Activity", "Activity_Name"))
feature_names <- read.table("features.txt", col.names = c("Feature_Num", "Feature"))

# Stores feature names in a vector to use as col.names in x train and test tables
features <- feature_names$Feature

# Load train data
x_train <- read.table("./train/X_train.txt", col.names = features)
y_train <- read.table("./train/y_train.txt", col.names = "Activity")
subject_train <- read.table("./train/subject_train.txt", col.names = "Subject")

# Load test data
x_test <- read.table("./test/X_test.txt", col.names = features)
y_test <- read.table("./test/y_test.txt", col.names = "Activity")
subject_test <- read.table("./test/subject_test.txt", col.names = "Subject")

# Merge data
measures <- rbind(x_train, x_test)
activity <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

data <- cbind(subject, activity, measures)

### Extracts only the measurements on the mean and standard deviation for each measurement.

# Returns indeces of features we want to use, checks if string ends in mean or std
features_index <- grep("mean|std", feature_names$Feature)

# Get the feature names of the indeces
features <- feature_names[features_index,2]

# Subset the full data to these features, keeps the subject and activity
data_m_std <- data[,c(1,2,features)]

### Uses descriptive activity names to name the activities in the data set

# Use the factor function to set the labels to what's in the activity_labels data frame
data_m_std$Activity <- factor(data_m_std$Activity, levels = activity_labels$Activity, labels = activity_labels$Activity_Name)

### Appropriately labels the dataset with descriptive variable names.

# Remove parentheses and dashes
names(data_m_std) <- gsub("\\()","", names(data_m_std))
# If it begins with t or f, give it time or frequency
names(data_m_std) <- gsub("^(t)","time", names(data_m_std))
names(data_m_std) <- gsub("^(f)","freq", names(data_m_std))
# Anytime mag appears, change to magnitude
names(data_m_std) <- gsub("([Mm]ag)", "Magnitude", names(data_m_std))
# Change body body or body to Body
names(data_m_std) <- gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",names(data_m_std))
# Change acc to acceleration
names(data_m_std) <- gsub("[Aa]cc", "Acceleration", names(data_m_std))

### From the data set in step 4, creates a second, 
### independent tidy data set with the average of 
### each variable for each activity and each subject.

# Use dplyr groupBy and summarize to tabulate on subject, activity, and variable
# found in data wrangling cheat sheet

tidy <- data_m_std %>% group_by(Subject, Activity) %>% summarise_each(funs(mean))

write.table(tidy, file = "C:/Users/elrivas/Documents/Trainings/JHU/Class3/Course Project/tidy.txt", row.names = FALSE)


