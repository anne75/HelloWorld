########################
#Anne75
#April 25th 2014
#run_analysis.R
#Coursera Getting and Cleaning Data

#The purpose of this code is to download a raw data set from the coursera website, 
#and create a new tidy data set.
########################

#The raw data set was downlaoded this way on Sat Apr 12 17:18:47 2014
#It was the unzipped which created a UCI HAR Dataset folder in my working directory.
url<-"http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,destfile="doc.zip")
unzip("doc.zip")

#From that on 
#As I only want part of the features in my tidy data set, I read the features names and select the ones
#I am interested in (containing mean and std measures)
feat_names<-read.table("./UCI HAR Dataset/features.txt",colClasses=c("NULL","character"),stringsAsFactors=F)
mean_std<-grep("([Mm][Ee][Aa][Nn]\\()|([Ss][Tt][Dd]\\()",feat_names$V2)

feat_selec<-rep("NULL",561)
feat_selec[mean_std]=NA

#I read the columns I am interested in from X_train and X_test and I merge them
X_train<-read.table("./UCI HAR Dataset/train/X_train.txt",colClasses=feat_selec)
X_test<-read.table("./UCI HAR Dataset/test/X_test.txt",colClasses=feat_selec)
X=rbind(X_train,X_test)

#checklist
sum(is.na(X)) #should be 0
minX<-apply(X,2,FUN=min) 
maxX<-apply(X,2,FUN=max) 
sum(minX!=-1) #should be 0
sum(maxX!=1)  #should be 0

#I read the subject identifier from the train and test data and merge
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
subject<-rbind(subject_train,subject_test)

#I read the label (activity identifier) from the train and test data and merge
y_train<-read.table("./UCI HAR Dataset/train/y_train.txt")
y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")
y=rbind(y_train,y_test)

#I read the activity names, and in my label vector I replace the identifier by the name
#of the activity
#a bit of polishing on the activity name to make it camelBack and shorter if possible is performed
act_labels<-read.table("./UCI HAR Dataset/activity_labels.txt",colClasses=c("NULL","character"),stringsAsFactors=F)
act_labels<-act_labels$V2
act_labels<-tolower(act_labels)
act_labels<-gsub("_([a-z])","\\U\\1",act_labels,perl=T)
act_labels<-gsub("stairs","",act_labels)
y$V1<-factor(y$V1,labels=act_labels)

#From above I reformulate the feature names to make them camelBack, getting rid of -()
#I still respect the format given by the creators of this data set
my_features<-feat_names$V2[mean_std]
my_features<-gsub("-m","M",my_features)
my_features<-gsub("-s","S",my_features)
my_features<-gsub("\\(\\)","",my_features)
my_features<-gsub("-","",my_features)
# Some features doubled the name Body, no explanation about that was found in the readme file
my_features<-gsub("BodyBody","Body",my_features) 

#I prepare my new data set, I will merge y, subject and X
#I add new names to my features
my_features<-c("activity", "subject", my_features)
dataset<-cbind(y,subject,X)
names(dataset)<-my_features

#I make the new dataset with the average of each variable for each activity and each subject
tidyData<-aggregate(.~subject+activity,dataset,FUN=mean)

write.table(tidyData,"tidyData.csv",sep="\t",row.names=F)


