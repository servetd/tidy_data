# first download data "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" and uzzip tidy_data directory
# Set working directory tidy_data

# Read related file 
features <- read.table("features.txt", col.names = c("order","functions"))
features <- features[,2]
activities <- read.table("activity_labels.txt", col.names = c("code", "activity"))

#Tidy names of data
features<-gsub("Acc", "Accelerometer", features)
features<-gsub("Gyro", "Gyroscope", features)
features<-gsub("BodyBody", "Body", features)
features<-gsub("Mag", "Magnitude", features)
features<-gsub("^t", "Time", features)
features<-gsub("^f", "Frequency", features)
features<-gsub("tBody", "TimeBody", features)
features<-gsub("-mean()", "Mean", features, ignore.case = TRUE)
features<-gsub("-std()", "Std", features, ignore.case = TRUE)
features<-gsub("-freq()", "Frequency", features, ignore.case = TRUE)
features<-gsub("angle", "Angle", features)
features<-gsub("gravity", "Gravity", features)
features<-gsub("[-()]", "", features)



# read data for each file
subject_test <- read.table("./test/subject_test.txt", col.names = "subject")
x_test <- read.table("./test/X_test.txt", col.names = features)
y_test <- read.table("./test/y_test.txt", col.names = "code")
subject_train <- read.table("./train/subject_train.txt", col.names = "subject")
x_train <- read.table("./train/X_train.txt", col.names = features)
y_train <- read.table("./train/y_train.txt", col.names = "code")


# Merge data
merged_data <- rbind ( cbind(subject_test,x_test,y_test ), cbind(subject_train,x_train,y_train))

tidy_data <- merged_data %>% select(subject, code, contains("mean"), contains("Std"))

#Calculate average
final_data <- tidy_data %>% group_by(subject, code) %>% summarise_all(mean)
# write tidy.txt
write.table(final_data, "tidy.txt", row.name=FALSE)

