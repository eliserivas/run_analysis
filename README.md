# run_analysis.R
Final project for 3rd course in Data Science Specialization

## Purpose
The goal of the "run_analysis.R" script is to clean and compile a 
"tidy" data set that includes information of 30 participants' 
actions and movements from the Samsung Galaxy S smartphone.
The final tidy dataset gives the mean for each feature for a participant and action

## Steps
The script first reads in the activity and feature labels from

1) activity_labels.txt
2) features.txt

Next, it combines the x, y, and subject data from the train and test sets
from the following txt files:

1) X_train
2) X_test
3) y_train
4) y_test
5) subject_train
6) subject_test

"X" files include feature values, "y" files denote activity, and "subject"
files indicate who performed the associated action

## Relations
 * activity_labels.txt correspond to the numeric values in the "y" files
 * features.txt are the column names of the values found in the "X" files
 * data_m_std is the dataset that combines the above .txt files (x,y,and subject), filtering for mean
and standard deviation features
* tidy is the result of grouping data_m_std by activity and participant. For each action and participant,
it provides the mean for each feature
