Run_Analysis <- function(){
  library(dplyr)
  #set wd
  setwd("E:/datasciencecoursera/CleanDataWeek4/")
  
  
  
  #open test data files
  subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
  X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
  Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
  
  #combine test files into single test data frame
  MyTest <- cbind(subject_test, X_test, Y_test)
  
  #open train data files
  subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
  X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
  Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
  
  #combine train files into single train data frame
  MyTrain <- cbind(subject_train, X_train, Y_train)
  
  #combine train and test into one single data frame
  MyData <- rbind(MyTest, MyTrain)
  
  # Loads Features list 
  features <- read.table("./UCI HAR Dataset/features.txt")
  
  #add descriptive column names 
  colnames(MyData) <- c("Participant", as.character(features$V2), "Activity")
  
  #limit features to only those with mean and std
  ColList <- grep("mean()|std()", features$V2, invert = TRUE)+1
  MyData <- MyData[,-ColList]
  
  #Load Activity Description
  activity <- read.table("./UCI HAR Dataset/activity_labels.txt")
  MyData$Activity <- lapply(MyData$Activity, function(x) activity$V2[match(x,activity$V1)])
  MyData$Activity <- unlist(MyData$Activity)
  
  #Create 2nd tidy data set to summarize all Variables by Particpant/Activity Combination
  MyData2 <- MyData %>% group_by(Participant, Activity) %>% summarize_all(funs(mean))

  write.table(MyData2, "NewTidyOutput.txt", row.names = FALSE)  
    
}