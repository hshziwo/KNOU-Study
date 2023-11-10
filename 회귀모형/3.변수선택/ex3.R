setwd("/home/hshziwo/공부/R/방송통신대/회귀모형/3.변수선택")
accident = read.csv("./p116.csv", header = TRUE, sep = ",")
accident_start.lm = lm(Y ~ 1, data = accident)
accident_full.lm = lm(Y ~ ., data = accident)
step(accident_start.lm, scope = list(lower=accident_start.lm, upper=accident_full.lm), direction = "forward") #(1)

step(accident_full.lm, direction = "backward") #(2)

step(accident_start.lm, scope = list(upper = accident_full.lm), direction = "both") #(3)

#install.packages("leaps")
library(leaps)
accident_all.lm = regsubsets(Y ~ ., data = accident)
(accident_rs = summary(accident_all.lm))
accident_rs$rsq
accident_rs$adjr2
accident_rs$cp #(4)
