# Creación de algún sitio donde se vuelquen los datos
setwd("C:/Users/gs0027/Documents/JCPJ/Formación/Coursera/DS03/project/")
if(!file.exists("files")) { dir.create("files") }



# data collected from the accelerometers from the Samsung Galaxy S smartphone
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Data
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# You should create one R script called run_analysis.R that does the following.

# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each 
#    measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.


dataurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(Sys.info()["sysname"] == "Windows") {
  download.file(url = dataurl, destfile = "files/dataset.zip", mode = "wb")
} else {
  download.file(url = dataurl, destfile = "files/dataset.zip", mode = "wb", method = "curl")
}



