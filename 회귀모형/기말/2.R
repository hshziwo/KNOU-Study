setwd("/home/hshziwo/공부/R/방송통신대/회귀모형/기말")
efficiency = read.csv("./autodata.csv", header = TRUE, sep = ",")
efficiency_start.lm = lm(Y ~ 1, data = efficiency)
efficiency_full.lm = lm(Y ~ ., data = efficiency)
step(efficiency_start.lm, scope = list(lower=efficiency_start.lm, upper=efficiency_full.lm), direction = "forward") #(1)

step(efficiency_full.lm, direction = "backward") #(2)

step(efficiency_start.lm, scope = list(upper = efficiency_full.lm), direction = "both") #(3)

#install.packages("leaps")
library(leaps)
efficiency_all.lm = regsubsets(Y ~ ., data = efficiency)
(efficiency_rs = summary(efficiency_all.lm))
efficiency_rs$rsq
efficiency_rs$adjr2
efficiency_rs$cp #(4)

#capture.output(step(efficiency_full.lm, direction = "backward"), file = "./asd.txt")
