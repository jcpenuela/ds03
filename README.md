Course "Getting and Cleaning Data"
==================================

Repository with the code, data and documentation for the course [Getting and Cleaning Data](http://) in [Coursera](http://coursera.og).

The dataset used are available in [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), by:

- Jorge L. Reyes-Ortiz (1,2) 
- Davide Anguita (1)
- Alessandro Ghio (1) 
- Luca Oneto (1)
- Xavier Parra (2)

<small> 1 - Smartlab - Non-Linear Complex Systems Laboratory DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy. </small><br>
<small> 2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain</small><br>
<small>activityrecognition '@' smartlab.ws</small>


## Files in repository

The files contained in this repository are:


| File           | Description    
| -------------- | -----------
| README.md      | This file, which explain this repository content. 
| CodeBook.md    | Describe the variables of `end_data.txt` and transformations made from original data to obtain it.
| run_analysis.R | Code in `R` which take original data from the internet (download it) and give as outcome the `end_data.txt` file. You can run it in [RStudio](https://www.rstudio.com).
| end_data.txt   | Tidy data with means as result of the process. Its structure is described in `CodeBook.md`. This is the outcome of the script `run_analysis.R`.


> #### Rememeber: 
> the script `run_analysis.R` has the file `end_data.txt` as outcome, so, if you want test the outcome of the script and hold the original of this repo, you might rename it before execute the script.

## Running script

You can run the code in `run_analysis.R` within RStudio or from a R console. There are no neccesary any parameters to execute the script.

### Running within RStudio

1. Open RStudio.
2. Open the file `run_analysis.R` using <kbd>cmd</kbd>+<kbd>O</kbd>. 
3. Select all the code in the file using <kbd>cmd</kbd>+<kbd>A</kbd>.
4. Run it with <kbd>cmd</kbd>+<kbd>intro</kbd>.

You get a variable named `W.mean` with the final dataset and a file `end_data.txt`.

### Running from R console in batch mode

1. Open a terminal console.
2. Go to the directory where you download the code file `run_analysis.R`.
3. Type `R CMD BATCH run_analysis.R`.
4. You can watch the execution using in another terminal a `cat run_analysis.Rout`.

Once the script has finished, you will get a new file called `end_data.txt` in the same directory where you ran the script. Now you can open R and load the new dataset created `end_data.txt` using  

> data <- read.table("end_data.txt")

and see the results in `data`.

### Running from R console in script mode

1. Open a terminal console.
2. Go to the directory where you download the code file `run_analysis.R`.
3. Type `Rscript run_analysis.R`.
4. You can watch the execution in the screen.

Once the script has finished, you will get a new file called `end_data.txt` in the same directory where you ran the script. Now you can open R and load the new dataset created `end_data.txt` using  

> data <- read.table("end_data.txt")

and see the results in `data`.


### Dependencies

The script make use of some packages that must be present in your R environment, so, if you don't have those installed, you must install them before. This packages are:

- dplyr
- stringr

