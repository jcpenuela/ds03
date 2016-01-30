# Check if exists a directory where download and unzip data

if(!file.exists("UCI HAR Dataset")) { 
    # files are not in the same directory... we will get it
  print("Files not found. We will download it now")
    dataurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    # Determine what OS is running to select a method in download statement
    
    if(Sys.info()["sysname"] == "Windows") {
      download.file(url = dataurl, destfile = "dataset.zip", mode = "wb")
    } else {
      download.file(url = dataurl, destfile = "dataset.zip", mode = "wb", method = "curl")
    }
    print("Files downloaded")
    # unpack data files
    unzip("dataset.zip", list = FALSE, exdir = ".", unzip = "unzip")
    print("Files unzipped")
}
setwd("UCI HAR Dataset")








# ############################################################################
# 1. Merges the training and the test sets to create one data set.

# We are going to use dplyr library for several ops.
library(dplyr)
# Read files
X_train <- read.table(file = "train/X_train.txt", sep = "")
y_train <- read.table(file = "train/y_train.txt")
subject_train <- read.table(file = "train/subject_train.txt")

X_test <- read.table(file = "test/X_test.txt", sep = "")
y_test <- read.table(file = "test/y_test.txt")
subject_test <- read.table(file = "test/subject_test.txt")

# Make an union of datasets to obtain a simple dataset with test and train data
X <- bind_rows(X_test, X_train)
y <- bind_rows(y_test, y_train)
subject <- bind_rows(subject_test, subject_train)

print("Datasets merged")

# ############################################################################
# 2. Extracts only the measurements on the mean and standard deviation for each 
#    measurement.

# Load features to select all of them with words required "mean" and "std"
features <- read.table(file = "features.txt", sep =" ")
# get the numbers of the columns to extract
columns_to_extract <- features[grep("mean|std",features$V2),]
# subset X for get a new X with only needed columns
X <- select(X, columns_to_extract[[1]])


# check that names of columns extracted would be unique. There are columns with repeated names in
# the whole set of columns
# select(columns_to_extract, V2) %>% distinct() %>% summarise(n())
# select(columns_to_extract, V2) %>% summarise(n())
# there are uniques: 79 column names

# we rename the columns of the datasets X, y and subject
# names are in the same order, so we rename directly
names(X) <- columns_to_extract[[2]]
# rename columns of subject and y datasets
names(subject) <- "subject"
names(y) <- "y"

# put all them together in a new dataset named "W"
W <- bind_cols(subject, y, X)

print("Dataset with needed columns")

# ############################################################################
# 3. Uses descriptive activity names to name the activities in the data set

# load activity_labels.txt for change
activity_labels <- read.table(file = "activity_labels.txt", sep = " ")

# change the subject for its label in activity_
W <- select(merge(W, activity_labels, by.y = "V1", by.x = "y"), -y) %>% rename(y=V2)

print("Activity names inserted")




# ############################################################################
# 4. Appropriately labels the data set with descriptive variable names.

library(stringr)

# Using a function for adapt names
normalize_names <- function(x) {
  r <- str_replace_all(x, "\\(\\)","")
  r <- str_replace_all(r, "^t","time")
  r <- str_replace_all(r, "^f","freq")
  r <- str_replace_all(r, "-",".")
  r
}
colnames(W) <- sapply(as.list(colnames(W)),FUN = normalize_names)
W <- rename(W, activity = y)

print("Column names normalized")


# ############################################################################
# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.

W.mean <- group_by(W, subject, activity) %>% summarise_each(funs(mean))
setwd("..")
write.table(W.mean, file = "end_data.txt")

print("DONE")


