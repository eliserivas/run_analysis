# CodeBook

## Data Source

The raw data for this analysis is sourced from the UCI Human Activity Recognition Using Smartphones Data Set.
It follows the actions of 30 volunteers within an age bracket of 19-48 years using a Samsung smartphone.

The 6 actions captured by the sensor were: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.
Accelerometer and gyroscope signals were captured every 2.56 seconds for these actions

All measurements are in Hz

## Files

*'features_info.txt': Shows information about the variables used on the feature vector.
*'features.txt': List of all features.
*'activity_labels.txt': Links the class labels with their activity name.
*'X_train.txt': Training data for the features
*'y_train.txt': Training activity labels
*'X_test.txt': Test data for the features
*'y_test.txt': Test activity labels
* 'subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* 'subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

### Final Data Derived
* data_m_std
* tidy

## Feature Selection and Name Changes

### Data Combination
* The feature names from features.txt were assigned as the column names in the x train and test data
* The activity labels from activity_labels.txt were assigned as the column names for the y train and test data
* train, test, activity, and subject data were combined to create a data set that 
displays the sensor measurements of a subject performing a certain action

### Feature Subsets
* Features containing mean and standard deviation measurements were maintained for the final dataset, 79 features remained
* Features beginning in 't' and 'f' were changed to "time" and "frequency" to be more informative
* Parentheses () were removed from column names
* Features containing "[Mm]ag" were changed to Magnitude
* "Body Body" and/or "body" were changed to "Body"
* "Acc" was changed to acceleration

The resulting dataset is called data_m_std and contains the signals for several actions performed by each of the 30 participants

## Final Tidy Data

The final tidy dataset, called tidy.txt, captures the mean of each of the 79 features from data_m_std for each subject and action.
There are 180 rows, 30 participants by 6 activities. 

Columns include the "Subject", "Activity", and 79 mean/standard deviation features
