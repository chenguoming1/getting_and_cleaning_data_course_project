setwd('D:\\Projects\\Coursera\\Getting and Cleaning Data\\CourseProject')
source('get_file_path.R')
dirsep<-.Platform$file.sep
main_dir<-'UCI HAR Dataset'
dir<-c(main_dir, dirsep, 'train')

path<-get_file_path(paste(dir, collapse=""), 'X_train.txt')
X_train<-read.table(path, header=F)


path<-get_file_path(paste(dir, collapse=""), 'subject_train.txt')
Subject_train<-read.table(path, header=F)

path<-get_file_path(paste(dir, collapse=""), 'Y_train.txt')
Y_train<-read.table(path, header=F)

dir<-c(main_dir, dirsep, 'test')
path<-get_file_path(paste(dir, collapse=""), 'X_test.txt')
X_test<-read.table(path, header=F)

path<-get_file_path(paste(dir, collapse=""), 'subject_test.txt')
Subject_test<-read.table(path, header=F)

path<-get_file_path(paste(dir, collapse=""), 'Y_test.txt')
Y_test<-read.table(path, header=F)

path<-get_file_path(main_dir, 'activity_labels.txt')
Activity<-read.table(path, header=F)
Activity[,2]<-as.character(Activity[,2])

       
X<-rbind(X_train, X_test)
Subject<-rbind(Subject_train, Subject_test)
Y<-rbind(Y_train, Y_test)


source('get_feature_names.R')
keepFeatures<-get_feature_names()

X<-X[,as.numeric(keepFeatures[1,])]
names(X)<-keepFeatures[2,]
names(X)
data<-cbind(X, Subject, Y)


feature_length<-length(keepFeatures[1,])
sql_friendly_names<-gsub("[[:punct:]]", "", keepFeatures[2,])
names(data)[1:feature_length]<-sql_friendly_names

names(data)[feature_length+1]<-'Subject'
names(data)[feature_length+2]<-'Activity'

data_activities<-character(length(data$Activity))
nactivity<-nrow(Activity)
for (i in 1:nactivity) {
  cat(i)
  #data[data$Activity==Activity[i, 1],c('Activity')]<-Activity[i, 2]
  data_activities[data$Activity==Activity[i, c(1)]]<-Activity[i, c(2)]
}
data$Activity<-data_activities
#unique(data$Activity)


#sql_friendly_names<-gsub("-", "_", names(data)[1:feature_length])
#sql_friendly_names<-gsub("[[:punct:]]", "", keepFeatures[2,])
#sql_friendly_names


#install.packages('sqldf')
library('sqldf')

#str<-paste("sum(\"",sql_friendly_names,"\")/count(*)",sep="", collapse=",")
str<-paste("avg(\"",sql_friendly_names,"\") as ", sql_friendly_names, "_mean", sep="", collapse=",")
tidydata<-sqldf(paste('select ', str, ',Subject,Activity from data group by Subject,Activity'))
write.table(tidydata, 'tidydata.csv')
edit(tidydata)
#tidydata[tidydata$Subject==1 & tidydata$Activity==1,c("avg(\"fBodyBodyGyroJerkMag_std__\")")]
#names(tidydata2)
