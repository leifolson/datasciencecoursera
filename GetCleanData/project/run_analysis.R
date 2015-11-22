# set the working directory
setwd("~/repos/datasciencecoursera/GetCleanData/project/")

# load data file if it does not exist
print("Looking for data files...")
if(!file.exists("UCI HAR Dataset"))
{
    print("data files not found, downloading data files...")
    url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(url, destfile = "smartphone_data.zip", method = "curl")
    print("extracting files...")
    unzip("smartphone_data.zip")
   
} else
{
    print("data files located.")
}

trainDir = "UCI HAR Dataset/train/"
testDir = "UCI HAR Dataset/test/"

# read in and combine train data
print("loading and combining data..")

# load and combine training data files
train.subjects = read.table(paste(trainDir,"subject_train.txt",sep = ""), header = FALSE)
train.data = read.table(paste(trainDir,"X_train.txt",sep = ""), header = FALSE)
train.targets = read.table(paste(trainDir,"y_train.txt",sep = ""), header = FALSE)
train.combined = cbind(train.subjects, train.data, train.targets)

# load and combine test data files
test.subjects = read.table(paste(testDir,"subject_test.txt",sep = ""), header = FALSE)
test.data = read.table(paste(testDir,"X_test.txt",sep = ""), header = FALSE)
test.targets = read.table(paste(testDir,"y_test.txt",sep = ""), header = FALSE)
test.combined = cbind(test.subjects, test.data, test.targets)

# combine train and test data
dataset = rbind(train.combined, test.combined)

# rename columns to specified variable names
varnames = read.table("UCI HAR Dataset/features.txt", header = FALSE, stringsAsFactors = FALSE)$V2
colnames(dataset) = c("subject", varnames, "activity")

# rename activities to a english description
activity.labels = read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)
colnames(activity.labels) = c("id", "label")
dataset$activity = activity.labels[dataset$activity, "label"]


print("cleaning up files...")
rm(train.subjects, train.data, train.targets, test.subjects, test.data, test.targets)
rm(train.combined, test.combined)
rm(varnames, activity.labels)

print("data combination complete.")

# extract columns of interest
print("extracting mean and std variables...")

# get only those columns corresponding to the mean or standard deviation
dataset = dataset[, c(1,grep("std\\(\\)|mean\\(\\)", colnames(dataset)),563)]

# give more intuitive names to variables...not very efficient...
colnames(dataset) = sub("BodyAcc", "Body Acceleration ", colnames(dataset))
colnames(dataset) = sub("BodyGyro", "Body Gyro ", colnames(dataset))
colnames(dataset) = sub("GravityAcc", "Gravity Acceleration ", colnames(dataset))
colnames(dataset) = sub("Mag", "Mag ", colnames(dataset))
colnames(dataset) = sub("Jerk", "Jerk ", colnames(dataset))
colnames(dataset) = sub("^t", "", colnames(dataset))
colnames(dataset) = sub("^f", "FFT ", colnames(dataset))
colnames(dataset) = sub("-mean\\(\\)", "Mean", colnames(dataset))
colnames(dataset) = sub("-std\\(\\)", "Std", colnames(dataset))

cat("tidy dataset complete, see \"dataset\" dataframe\n")
        
print("computing mean for each variable by subject and activity...")
dataset.means = aggregate(.~ subject + activity, data = dataset, mean)

# order by subject
dataset.means = dataset.means[order(dataset.means$subject),]
colnames(dataset.means)[3:ncol(dataset.means)] = paste("Mean:", colnames(dataset.means)[3:ncol(dataset.means)], sep = " ")

cat("new tidy dataset complete, see \"dataset.means\" data frame\n")







