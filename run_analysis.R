---
title: "CodeBook"
author: "jakella"
date: "Saturday, April 25, 2015"
output: html_document
---
These are the commands I used to created the tidy data. 

```{r}
features = read.table("X_test.txt", header = FALSE, sep="")
features_names = read.table("features.txt", header = FALSE, sep="")
colnames(features) = features_names$V2
subjects = read.table("subject_test.txt", header = FALSE)
colnames(subjects) = c("subject")
test_data = data.frame(subjects, features)
label_data = read.table("y_test.txt", header= FALSE)
colnames(label_data) = c("Activity")
labels = factor(label_data$Activity)
label_descr = revalue(labels, c("1" = "WALKING",
                  "2" =  "WALKING_UPSTAIRS",
                  "3" =  "WALKING_DOWNSTAIRS",
                  "4" =  "SITTING",
                  "5" =  "STANDING",
                  "6" =   "LAYING"))
label_data = data_frame(label_descr)
colnames(label_data) = c("Activity")
test_data_all = data.frame(subjects, label_data, features)
features_subset_mean  = features[, grep("mean", colnames(features))]
features_subset_Mean  = features[, grep("Mean", colnames(features))]
features_subset_std  = features[, grep("std", colnames(features))]
feature_subset_test = data.frame(features_subset_mean, features_subset_Mean, features_subset_std) 
test_data_subset = data.frame(subjects, label_data, feature_subset_test)
test_data_final = test_data_subset[, -grep("meanFreq", colnames(test_data_subset))]
test_data_latest =  test_data_final[, -grep("angle.", colnames(test_data_final))]
new_names =  c("Subject", "Activity", "X_MeanBodyAcceleration_time", "Y_MeanBodyAcceleration_time", "Z_MeanBodyAcceleration_time","X_MeanGravityAcceleration_time", "Y_MeanGravityAcceleration_time", "Z_MeanGravityAcceleration_time", "X_MeanBodyAcceleration-Jerk_time", "Y_MeanBodyAcceleration-Jerk_time", "Z_MeanBodyAcceleration-Jerk_time", "X_MeanBodyGyro_time", "Y_MeanBodyGyro_time", "Z_MeanBodyGyro_time", "X_MeanBodyGyro-Jerk_time", "Y_MeanBodyGyro-Jerk_time", "Z_MeanBodyGyro-Jerk_time", "MeanBodyAccel-Magnitude_time", "MeanGravityAccel-Magnitude_time", "MeanBodyAccel-JerkMagnitude_time", "MeanBodyGyro-Magnitude_time", "MeanBodyGyro-JerkMagnitude_time", "X_MeanBodyAcceleration_Freq", "Y_MeanBodyAcceleration_Freq", "Z_MeanBodyAcceleration_Freq", "X_MeanBodyAccel-Jerk_Freq", "Y_MeanBodyAccel-Jerk_Freq", "Z_MeanBodyAccel-Jerk_Freq",  "X_MeanBodyGyro_Freq",  "Y_MeanBodyGyro_Freq", "Z_MeanBodyGyro_Freq",  "MeanBodyAccel-Magnitude_Freq", "MeanBodyAccel-JerkMagnitude_Freq", "MeanBodyGyro-Magnitude_Freq", "MeanBodyGyroJerkMagnitude_Freq", "X_STDBodyAceleration_time", "Y_STDBodyAceleration_time", "Z_STDBodyAceleration_time", "X_STDGravityAceleration _time", "Y_STDGravityAceleration_time", "Z_STDGravityAceleration_time", "X_STDBodyAccel-Jerk_time", "Y_STDBodyAccel-Jerk_time", "Z_STDBodyAccel-Jerk_time", "X_STDBodyGyro_time", "Y_STDBodyGyro_time", "Z_STDBodyGyro_time", "X_STDBodyGyro-Jerk_time", "Y_STDBodyGyro-Jerk_time", "Z_STDBodyGyro-Jerk_time", "STDBodyAccel-Magnitude_time", "STDGravityAccel-Magnitude_time", "STDBodyAccel-JerK-Magnitude_time", "STDBodyGyro-Magnitude_time", "STDBodyGyro-Jerk-Magnitude_time", "X_STDBodyAcceleration_Freq", "Y_STDBodyAcceleration_Freq", "Z_STDBodyAcceleration_Freq", "X_STDBodyAccel-Jerk_Freq", "Y_STDBodyAccel-Jerk_Freq", "Z_STDBodyAccel-Jerk_Freq", "X_STDBodyGyro_Freq", "Y_STDBodyGyro_Freq", "Z_STDBodyGyro_Freq", "STDBodyAccel-Magnitude_Freq", "STDBodyAccel-Jerk-Magnitude_Freq", "STDBodyGyro-Magnitude_Freq", "STDBodyGyro-Jerk-Magnitude_time" )
old_names = names(test_data_latest)
setnames(test_data_latest, old = old_names, new = new_names)



setwd("../train/")
features_train = read.table("X_train.txt", header = FALSE, sep="")
colnames(features_train) = features_names$V2
subjects_train = read.table("subject_train.txt", header = FALSE)
colnames(subjects_train) = c("subject")
label_data_train = read.table("y_train.txt", header= FALSE)
colnames(label_data_train) = c("Activity")
labels_train = factor(label_data_train$Activity)
label_train_descr = revalue(labels_train, c("1" = "WALKING",
+                                 "2" =  "WALKING_UPSTAIRS",
+                                 "3" =  "WALKING_DOWNSTAIRS",
+                                 "4" =  "SITTING",
+                                 "5" =  "STANDING",
+                                 "6" =   "LAYING"))
label_data_train = data_frame(label_train_descr)
colnames(label_data_train) = c("Activity")
features_train_subset_mean  = features_train[, grep("mean", colnames(features_train))]
features_train_subset_Mean  = features_train[, grep("Mean", colnames(features_train))]
features_train_subset_std  = features_train[, grep("std", colnames(features_train))]
feature_subset_train = data.frame(features_train_subset_mean, features_train_subset_Mean, features_train_subset_std)
train_data_subset = data.frame(subjects_train, label_data_train, feature_subset_train)
train_data_final =  train_data_subset[, -grep("meanFreq", colnames(train_data_subset))]
train_data_latest =  train_data_final[, -grep("angle.", colnames(train_data_final))]
setnames(train_data_latest, old = old_names, new = new_names)
```
