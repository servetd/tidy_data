The run_analysis.R script performs the data preparation and then followed by the 8 steps required as described in the course project’s definition.

1. Download the dataset
Download file fron link "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" and uzzip tidy_data directory
Set working directory tidy_data

2. Assign each data to variables
features <- features.txt : 561 rows, 2 columns 
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
activities <- activity_labels.txt : 6 rows, 2 columns 
List of activities performed when the corresponding measurements were taken and its codes (labels)

3. Tidiy feature names
Appropriately labels the data set with descriptive variable names
code column in features renamed into activities
All Acc in column’s name replaced by Accelerometer
All Gyro in column’s name replaced by Gyroscope
All BodyBody in column’s name replaced by Body
All Mag in column’s name replaced by Magnitude
All start with character f in column’s name replaced by Frequency
All start with character t in column’s name replaced by Time
All -() character is removed

4. Read data
4.1 Test Data
subject_test <- test/subject_test.txt : 2947 rows, 1 column and (2   4   9  10  12  13  18  20  24) volunteers of data
x_test <- test/X_test.txt : 2947 rows, 561 columns and  contains recorded features test data
y_test <- test/y_test.txt : 2947 rows, 1 columns  and contains test data of activities’code labels

4.2 Train Data
subject_train <- test/subject_train.txt : 7352 rows, 1 column  and (1   3   5   6   7   8  11  14  15  16  17  19  21  22  23  25  26  27  28  29  30) volunteers data
x_train <- test/X_train.txt : 7352 rows, 561 columns, and contains recorded features train data
y_train <- test/y_train.txt : 7352 rows, 1 columns, and contains train data of activities’code labels

5. Merges the training and the test sets to create one data set
subject_test,x_test and y_test data merged by cbind funtion
also subject_train,x_train ad y_train data merged by cbind funtion
Then two results is mergeb by cbind function
result is saved "merged_data"

6. Create Tidy Data
from "merged_data" select coloums containing "mean" and "Std" and result saved as "tidy_data"

7. From the tidy_data set in step 6, creates a second, independent tidy data set with the average of each variable for each activity and each subject and then result is saved as "final_data" which 180 rows and 88 columns
8. Export final_data into tidy.txt file.