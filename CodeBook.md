# CleanDataWeek4
Week4 Project

Run_Analysis.R takes a series of inputs which were split it test and training sets and cleans the format to produce a tidy output.

The following steps were taken inside the function:
  * Read in the files and combine into 2 sets, Train and Test
  * Bind the two sets into one, called MyData
  * Rename the columns of MyData according the the features.txt file provided.
  * The variables that are not specifically related to mean or std are then removed from the dataset.
  * The Activity Variable is translated from a number based value to a more descriptive term.
  * Group and create mean summary of the dataset by Participant/Activity grouping.
  
Variables Used:
  * subject_test, subject_train -> input subject files
  * X_test, X_train -> input data files
  * Y_test, Y_train -> input activity files
  * My_train, My_test -> combined subject, X and Y varibables.
  * MyData -> Aggregate data set of all test and train data.
  * features -> input features file
  * colList -> vector of columns that include the mean or std of variables.
  * activity -> input activity file
  * MyData2 -> 2nd Set of tidied data.
  
  