Code Book
=========

## File end_data.txt

Data are based on the database available in [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). More details about this dataset are given in the file README.md within this repository.

### Variable description

The variables are listed in the next table:

> Since it is not important describe the *exact* meaning of every variable, I show a excerpt as how should it be presented, but not the exact meaning of every variable.

| Variable               | Description    
| --------------         | -----------
|  subject               | num: Number which indicate the subject who makes the test. Range is in (1:30)
|  activity              | factor: Activity made. A factor w/ 6 levels<br> <ul><li>LAYING</li><li>SITTING</li><li>STANDING</li><li>WALKING</li><li>WALKING_DOWNSTAIRS</li><li>WALKING_UPSTAIRS</li></ul>
| timeBodyAcc.mean.X | num: ...........
| timeBodyAcc.mean.Y | num: ...........
| timeBodyAcc.mean.Z | num: ...........
| ... | ...
| ... | ...
| ... | ...
| freqBodyBodyGyroJerkMag.mean | num: ...........
| freqBodyBodyGyroJerkMag.std | num: ...........
| freqBodyBodyGyroJerkMag.meanFreq | num: ...........


### Process for getting the data

The code in the file `run_analysis.R` has comments to help its understanding.

The instructions for its use are in the file `README.md`. There are no neccesary any parameters to execute the scripts.

The data are processed following the next steps:

1. Read test data and train data (subject, y and X).
2. Bind the test and train data in one dataset.
3. Select the columns with "mean" in its column name. The dataset result reduce the number of the original datasets from 561 to 79, plus 2 dimensions, the subject and the activity (column y). 
4. Replace the data in column of activity using the activity_labels.txt contain.
5. For normalize the column names, I defined a user function named `normalize_names` which is inyected in a `sapply` applied to column names. The function delete `()` characters and replace `-` for dots.
6. Group the dataset by subject and activity using `dplyr::group_by` and then summarise the mean of every variable in the reduced dataset.
7. Write the new summarised dataset to a file called `end_data.txt`, which is the outcome of the script.



