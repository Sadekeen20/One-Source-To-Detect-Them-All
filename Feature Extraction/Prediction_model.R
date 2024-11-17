installed.packages("randomForest")
install.packages("randomForest")
library(randomForest)

gender_data <- read.csv(file.choose(),header = T)
View(gender_data)
age_data <- read.csv(file.choose(),header = T)
View(age_data)
emotion_data <- read.csv(file.choose(),header = T)
View(emotion_data)


gender_data$label <- as.factor(gender_data$label)
age_data$label <- as.factor(age_data$label)
emotion_data$label <- as.factor(emotion_data$label)


set.seed(2)
id<-sample(2,nrow(gender_data),prob = c(0.8,0.2),replace = TRUE)
train_gender<-gender_data[id==1,]
test_gender<-gender_data[id==2,]

set.seed(2)
id<-sample(2,nrow(age_data),prob = c(0.8,0.2),replace = TRUE)
train_age<-age_data[id==1,]
test_age<-age_data[id==2,]

set.seed(2)
id<-sample(2,nrow(emotion_data),prob = c(0.8,0.2),replace = TRUE)
train_emotion<-emotion_data[id==1,]
test_emotion<-emotion_data[id==2,]


library(randomForest)
gender_forest <- randomForest(label~meanfreq+sd+median+Q25+Q75+IQR+skew+kurt+sp.ent+sfm+mode+centroid+meanfun+minfun+maxfun+meandom+mindom+maxdom+dfrange+modindx,data = train_gender)
gender_forest
age_forest <- randomForest(label~meanfreq+sd+median+Q25+Q75+IQR+skew+kurt+sp.ent+sfm+mode+centroid+meanfun+minfun+maxfun+meandom+mindom+maxdom+dfrange+modindx,data = train_age)
age_forest
emotion_forest <- randomForest(label~meanfreq+sd+median+Q25+Q75+IQR+skew+kurt+sp.ent+sfm+mode+centroid+meanfun+minfun+maxfun+meandom+mindom+maxdom+dfrange+modindx,data = train_emotion)
emotion_forest

importance(gender_forest)
varImpPlot(gender_forest)

test <- read.csv(file.choose(),header = T)
gender_predict <- predict(gender_forest, newdata = test, type = "class")
gender_predict
age_predict <- predict(age_forest, newdata = test, type = "class")
age_predict
emotion_predict <- predict(emotion_forest, newdata = test, type = "class")
emotion_predict
