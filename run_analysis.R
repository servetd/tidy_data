
#Read realted files
activity_labels <- read.table("activity_labels.txt")
features <- read.table("features.txt")
features_infor <- read.table ("features_info.txt")
## remove unrelated col.
activity_labels <- activity_labels[,2]
features<- features[,2]
# Convert class of features to charecter
features <- as.character(features)
# rearranges names of collums 
data_wanted <- grep(".*mean.*|.*std.*", features)
featuresNewname <- features[grep(".*mean.*|.*std.*", features)]
featuresNewname <- gsub('-mean', 'Mean', featuresNewname)
featuresNewname <- gsub('-std', 'Std', featuresNewname)
featuresNewname <- gsub('[-()]', '', featuresNewname)


#load datas
## test data
data_test <- read.table("./test/X_test.txt")
testActivities <- read.table("./test/Y_test.txt") 
testSubjects <- read.table("./test/subject_test.txt")
test_final <- cbind(testSubjects, testActivities, data_test)

# train data

data_train <- read.table("./train/X_train.txt")
trainActivities <- read.table("./train/Y_train.txt") 
trainSubjects <- read.table("./train/subject_train.txt")
train_final <- cbind(trainSubjects, trainActivities, data_train)

#Merge data
final_data <- rbind(train_final, test_final)
colnames(final_data) <- c("subject", "activity", featuresNewname)
# Calculate mean and sd for each measurements
final_data_melted <- melt(final_data, id = c("subject", "activity"))
final_data_mean <- dcast(final_data_melted, subject + activity ~ variable, mean)
final_data_sd <- dcast(final_data_melted, subject + activity ~ variable, sd)
final_data_mean_sd <- cbind(final_data_mean, final_data_sd)

# write tidy.txt
write.table(final_data_mean, "tidy.txt", row.names = FALSE)
