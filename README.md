#Project Files and usage

##There are total 3 script files in this main directory.
get_feature_names.R
get_file_path.R
run_analysis.R


##Files' description

get_file_path.R is used to get full file path of a file.

get_feature_names.R is used to retrieve only meand and standard deviation variables from 561 variables of the original dataset.

run_analysis.R is the main script file which clean up data and output tidydata.csv file at the end of execution

before running the run_analysis.R UCI HAR Dataset folder should be inside this main folder together the scripts files.



##How to run 
put UCI HAR Dataset folder in this main directory.

set this main directory as your R working directory

eg. 
    setwd('C:\\getting_and_cleaning_data_course_project')

    source('run_analysis.R')

when the execution finished, there will be file named tidydata.csv with  180x68 dimensions
