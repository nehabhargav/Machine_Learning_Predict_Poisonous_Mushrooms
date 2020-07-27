install.packages("FFTrees")
install.packages("randomForest")
install.packages("ggplot2")
install.packages("dplyr")
library(datasets)
library(FFTrees)
library(randomForest)
library(ggplot2)
library(dplyr)
mushrooms
#How many are  poisonous 
ggplot(mushrooms, aes(poisonous, fill = poisonous)) +
 geom_bar() 

# Tranning and Test Split
nrow(mushrooms)
rows <- sample(nrow(mushrooms),nrow(mushrooms) * .7,
               replace = FALSE )
# train gets 70 percentage of the data 
train <- mushrooms[rows,]
# while  30 percentage gets to test
test <- mushrooms[-rows,]

# Tranning the model

model <- FFTrees(poisonous ~ . , train)
model
#confusion Matrix
plot(model, what= "cues")


#predict
pred <- predict(model,test)
table(pred,test$poisonous)



