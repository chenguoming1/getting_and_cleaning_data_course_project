get_feature_names<-function() {
  path=get_file_path('UCI HAR Dataset', 'features.txt')
  features<-read.table(path, header=F)
  features[2]
  meanCols<-as.character(features[(grep('mean[(][)]', ignore.case = F,features[,2])), c(2)])
  stdCols<-as.character(features[grep('std[(][)]', ignore.case = F,features[,2]), c(2)])
  meanColIndexes<-grep('mean[(][)]', ignore.case = F,features[,2])
  stdColIndexes<-grep('std[(][)]', ignore.case = F,features[,2])
  keepFeatures<-rbind(c(meanColIndexes, stdColIndexes), c(meanCols, stdCols))
}