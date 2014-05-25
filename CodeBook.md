

#Brief Steps to generate the tidydata
* step1. 
       - retrieve features only for mean and standard deviation by using grep function
       - grep('mean[(][)]', ignore.case = F,features) is used for retrieving mean variable indexes 
	   - grep('std[(][)]', ignore.case = F, features) is used for retrieving standard variable indexes
	   - after binding the the mean and standard deviation variable and appending Subject and Activity get the table 1
* step2. 
       - remove all the punctuation from keepFeatures
       - gsub("[[:punct:]]", "", keepFeatures)
	   - after removing the punctuation get table 2
* step3. 
       - find the average of each variable for each activity and each subject
       - sqldf library is used for calculating this, the following is the example query
       - select avg(\"tBodyAccmeanX\") as tBodyAccmeanX_mean, ..., Subject, Activity from data group by Subject,Activity" 
	   - after executing the query get the table 3


## Table 1. keepFeatures
|    | keepFeatures                |
|----|-----------------------------|
| 1  | tBodyAcc-mean()-X           |
| 2  | tBodyAcc-mean()-Y           |
| 3  | tBodyAcc-mean()-Z           |
| 4  | tGravityAcc-mean()-X        |
| 5  | tGravityAcc-mean()-Y        |
| 6  | tGravityAcc-mean()-Z        |
| 7  | tBodyAccJerk-mean()-X       |
| 8  | tBodyAccJerk-mean()-Y       |
| 9  | tBodyAccJerk-mean()-Z       |
| 10 | tBodyGyro-mean()-X          |
| 11 | tBodyGyro-mean()-Y          |
| 12 | tBodyGyro-mean()-Z          |
| 13 | tBodyGyroJerk-mean()-X      |
| 14 | tBodyGyroJerk-mean()-Y      |
| 15 | tBodyGyroJerk-mean()-Z      |
| 16 | tBodyAccMag-mean()          |
| 17 | tGravityAccMag-mean()       |
| 18 | tBodyAccJerkMag-mean()      |
| 19 | tBodyGyroMag-mean()         |
| 20 | tBodyGyroJerkMag-mean()     |
| 21 | fBodyAcc-mean()-X           |
| 22 | fBodyAcc-mean()-Y           |
| 23 | fBodyAcc-mean()-Z           |
| 24 | fBodyAccJerk-mean()-X       |
| 25 | fBodyAccJerk-mean()-Y       |
| 26 | fBodyAccJerk-mean()-Z       |
| 27 | fBodyGyro-mean()-X          |
| 28 | fBodyGyro-mean()-Y          |
| 29 | fBodyGyro-mean()-Z          |
| 30 | fBodyAccMag-mean()          |
| 31 | fBodyBodyAccJerkMag-mean()  |
| 32 | fBodyBodyGyroMag-mean()     |
| 33 | fBodyBodyGyroJerkMag-mean() |
| 34 | tBodyAcc-std()-X            |
| 35 | tBodyAcc-std()-Y            |
| 36 | tBodyAcc-std()-Z            |
| 37 | tGravityAcc-std()-X         |
| 38 | tGravityAcc-std()-Y         |
| 39 | tGravityAcc-std()-Z         |
| 40 | tBodyAccJerk-std()-X        |
| 41 | tBodyAccJerk-std()-Y        |
| 42 | tBodyAccJerk-std()-Z        |
| 43 | tBodyGyro-std()-X           |
| 44 | tBodyGyro-std()-Y           |
| 45 | tBodyGyro-std()-Z           |
| 46 | tBodyGyroJerk-std()-X       |
| 47 | tBodyGyroJerk-std()-Y       |
| 48 | tBodyGyroJerk-std()-Z       |
| 49 | tBodyAccMag-std()           |
| 50 | tGravityAccMag-std()        |
| 51 | tBodyAccJerkMag-std()       |
| 52 | tBodyGyroMag-std()          |
| 53 | tBodyGyroJerkMag-std()      |
| 54 | fBodyAcc-std()-X            |
| 55 | fBodyAcc-std()-Y            |
| 56 | fBodyAcc-std()-Z            |
| 57 | fBodyAccJerk-std()-X        |
| 58 | fBodyAccJerk-std()-Y        |
| 59 | fBodyAccJerk-std()-Z        |
| 60 | fBodyGyro-std()-X           |
| 61 | fBodyGyro-std()-Y           |
| 62 | fBodyGyro-std()-Z           |
| 63 | fBodyAccMag-std()           |
| 64 | fBodyBodyAccJerkMag-std()   |
| 65 | fBodyBodyGyroMag-std()      |
| 66 | fBodyBodyGyroJerkMag-std()  |
| 67 | Subject                     |
| 68 | Activity                    |

## Table 2. keepBeautifiedFeatures
|    | keepBeautifiedFeatures   |
|----|--------------------------|
| 1  | tBodyAccmeanX            |
| 2  | tBodyAccmeanY            |
| 3  | tBodyAccmeanZ            |
| 4  | tGravityAccmeanX         |
| 5  | tGravityAccmeanY         |
| 6  | tGravityAccmeanZ         |
| 7  | tBodyAccJerkmeanX        |
| 8  | tBodyAccJerkmeanY        |
| 9  | tBodyAccJerkmeanZ        |
| 10 | tBodyGyromeanX           |
| 11 | tBodyGyromeanY           |
| 12 | tBodyGyromeanZ           |
| 13 | tBodyGyroJerkmeanX       |
| 14 | tBodyGyroJerkmeanY       |
| 15 | tBodyGyroJerkmeanZ       |
| 16 | tBodyAccMagmean          |
| 17 | tGravityAccMagmean       |
| 18 | tBodyAccJerkMagmean      |
| 19 | tBodyGyroMagmean         |
| 20 | tBodyGyroJerkMagmean     |
| 21 | fBodyAccmeanX            |
| 22 | fBodyAccmeanY            |
| 23 | fBodyAccmeanZ            |
| 24 | fBodyAccJerkmeanX        |
| 25 | fBodyAccJerkmeanY        |
| 26 | fBodyAccJerkmeanZ        |
| 27 | fBodyGyromeanX           |
| 28 | fBodyGyromeanY           |
| 29 | fBodyGyromeanZ           |
| 30 | fBodyAccMagmean          |
| 31 | fBodyBodyAccJerkMagmean  |
| 32 | fBodyBodyGyroMagmean     |
| 33 | fBodyBodyGyroJerkMagmean |
| 34 | tBodyAccstdX             |
| 35 | tBodyAccstdY             |
| 36 | tBodyAccstdZ             |
| 37 | tGravityAccstdX          |
| 38 | tGravityAccstdY          |
| 39 | tGravityAccstdZ          |
| 40 | tBodyAccJerkstdX         |
| 41 | tBodyAccJerkstdY         |
| 42 | tBodyAccJerkstdZ         |
| 43 | tBodyGyrostdX            |
| 44 | tBodyGyrostdY            |
| 45 | tBodyGyrostdZ            |
| 46 | tBodyGyroJerkstdX        |
| 47 | tBodyGyroJerkstdY        |
| 48 | tBodyGyroJerkstdZ        |
| 49 | tBodyAccMagstd           |
| 50 | tGravityAccMagstd        |
| 51 | tBodyAccJerkMagstd       |
| 52 | tBodyGyroMagstd          |
| 53 | tBodyGyroJerkMagstd      |
| 54 | fBodyAccstdX             |
| 55 | fBodyAccstdY             |
| 56 | fBodyAccstdZ             |
| 57 | fBodyAccJerkstdX         |
| 58 | fBodyAccJerkstdY         |
| 59 | fBodyAccJerkstdZ         |
| 60 | fBodyGyrostdX            |
| 61 | fBodyGyrostdY            |
| 62 | fBodyGyrostdZ            |
| 63 | fBodyAccMagstd           |
| 64 | fBodyBodyAccJerkMagstd   |
| 65 | fBodyBodyGyroMagstd      |
| 66 | fBodyBodyGyroJerkMagstd  |
| 67 | Subject                  |
| 68 | Activity                 |

## Table 3. tidydataVariables
|    | tidydataVariables             |
|----|-------------------------------|
| 1  | tBodyAccmeanX_mean            |
| 2  | tBodyAccmeanY_mean            |
| 3  | tBodyAccmeanZ_mean            |
| 4  | tGravityAccmeanX_mean         |
| 5  | tGravityAccmeanY_mean         |
| 6  | tGravityAccmeanZ_mean         |
| 7  | tBodyAccJerkmeanX_mean        |
| 8  | tBodyAccJerkmeanY_mean        |
| 9  | tBodyAccJerkmeanZ_mean        |
| 10 | tBodyGyromeanX_mean           |
| 11 | tBodyGyromeanY_mean           |
| 12 | tBodyGyromeanZ_mean           |
| 13 | tBodyGyroJerkmeanX_mean       |
| 14 | tBodyGyroJerkmeanY_mean       |
| 15 | tBodyGyroJerkmeanZ_mean       |
| 16 | tBodyAccMagmean_mean          |
| 17 | tGravityAccMagmean_mean       |
| 18 | tBodyAccJerkMagmean_mean      |
| 19 | tBodyGyroMagmean_mean         |
| 20 | tBodyGyroJerkMagmean_mean     |
| 21 | fBodyAccmeanX_mean            |
| 22 | fBodyAccmeanY_mean            |
| 23 | fBodyAccmeanZ_mean            |
| 24 | fBodyAccJerkmeanX_mean        |
| 25 | fBodyAccJerkmeanY_mean        |
| 26 | fBodyAccJerkmeanZ_mean        |
| 27 | fBodyGyromeanX_mean           |
| 28 | fBodyGyromeanY_mean           |
| 29 | fBodyGyromeanZ_mean           |
| 30 | fBodyAccMagmean_mean          |
| 31 | fBodyBodyAccJerkMagmean_mean  |
| 32 | fBodyBodyGyroMagmean_mean     |
| 33 | fBodyBodyGyroJerkMagmean_mean |
| 34 | tBodyAccstdX_mean             |
| 35 | tBodyAccstdY_mean             |
| 36 | tBodyAccstdZ_mean             |
| 37 | tGravityAccstdX_mean          |
| 38 | tGravityAccstdY_mean          |
| 39 | tGravityAccstdZ_mean          |
| 40 | tBodyAccJerkstdX_mean         |
| 41 | tBodyAccJerkstdY_mean         |
| 42 | tBodyAccJerkstdZ_mean         |
| 43 | tBodyGyrostdX_mean            |
| 44 | tBodyGyrostdY_mean            |
| 45 | tBodyGyrostdZ_mean            |
| 46 | tBodyGyroJerkstdX_mean        |
| 47 | tBodyGyroJerkstdY_mean        |
| 48 | tBodyGyroJerkstdZ_mean        |
| 49 | tBodyAccMagstd_mean           |
| 50 | tGravityAccMagstd_mean        |
| 51 | tBodyAccJerkMagstd_mean       |
| 52 | tBodyGyroMagstd_mean          |
| 53 | tBodyGyroJerkMagstd_mean      |
| 54 | fBodyAccstdX_mean             |
| 55 | fBodyAccstdY_mean             |
| 56 | fBodyAccstdZ_mean             |
| 57 | fBodyAccJerkstdX_mean         |
| 58 | fBodyAccJerkstdY_mean         |
| 59 | fBodyAccJerkstdZ_mean         |
| 60 | fBodyGyrostdX_mean            |
| 61 | fBodyGyrostdY_mean            |
| 62 | fBodyGyrostdZ_mean            |
| 63 | fBodyAccMagstd_mean           |
| 64 | fBodyBodyAccJerkMagstd_mean   |
| 65 | fBodyBodyGyroMagstd_mean      |
| 66 | fBodyBodyGyroJerkMagstd_mean  |
| 67 | Subject                       |
| 68 | Activity                      |