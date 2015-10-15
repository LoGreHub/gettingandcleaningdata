# train data reading and column binding
subject = read.table("./UCI HAR Dataset/train/subject_train.txt")
X = read.table("./UCI HAR Dataset/train/X_train.txt")
Y = read.table("./UCI HAR Dataset/train/y_train.txt")
train = cbind(subject,Y,X)

# test data reading and column binding
subject = read.table("./UCI HAR Dataset/test/subject_test.txt")
X = read.table("./UCI HAR Dataset/test/X_test.txt")
Y = read.table("./UCI HAR Dataset/test/y_test.txt")
test = cbind(subject,Y,X)

# train and test data merging
merged = rbind(train,test)

# labels variables
features = read.table("./UCI HAR Dataset/features.txt",stringsAsFactors = F)[,2]
names(merged) = c("subject","activity",features)

# pick relevant features
relevant_features = grep("mean[^A-Z]|std",features)

# subset based on relevant features, offset taking into account subject and activity columns 
merged = merged[,c(1,2,relevant_features+2)]

# substitute activity Ids with activity names
activity_names = read.table("./UCI HAR Dataset/activity_labels.txt",stringsAsFactors = F)[,2]
merged$activity = activity_names[merged$activity]

# create other tidy dataset from merged, dplyr method

if (!require("dplyr")) {
    install.packages("dplyr")
    require("dplyr")
}

merged_df = tbl_df(merged)
tidy_data = merged_df%>%
    group_by(activity,subject)%>%
    summarise_each(funs(mean))%>%
    arrange(activity,subject)

write.table(tidy_data,file="tidy_dataset.txt",row.name = F)


# # create other tidy dataset from merged, base method
# 
# subselection = merged[3:dim(merged)[2]]
# criteria = list(activity = merged$activity, subject = merged$subject)
# tidy_data = aggregate(subselection,criteria,mean)
# tidy_data = tidy_data[order(tidy_data$activity,tidy_data$subject),]
# write.table(tidy_data,file="tidy_dataset.txt",row.name = F)



# # create other tidy dataset from merged, reshape2 method

# if (!require("reshape2")) {
#     install.packages("reshape2")
#     require("reshape2")
# }
# 
# merged_melt = melt(merged,
#                    id=c(2,1),
#                    measure.vars=features[relevant_features])
# tidy_data = dcast(merged_melt,
#                   activity+subject~variable,
#                   mean)
# tidy_data = tidy_data[order(tidy_data$activity,tidy_data$subject),]
# write.table(tidy_data,file="tidy_dataset.txt",row.name = F)