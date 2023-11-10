setwd("/home/hshziwo/공부/R/방송통신대/데이터마이닝")

wine = read.csv("winequalityCLASS.csv",header=T, 
                            fileEncoding = "euc-kr")

#단순회귀 alcohol
fit.alcohol = glm(quality ~ alcohol, family = binomial, data=wine)
summary(fit.alcohol)

p = predict(fit.alcohol, newdata = wine, type = "response")
cutoff = 0.5
yhat = ifelse(p > cutoff, 1, 0)

tab = table(wine$quality, yhat, dnn = c("Observed", "Predicted"))
print(tab)
sum(diag(tab))/sum(tab) #accuracy
tab[2,2]/sum(tab[2,]) #sensitivity
tab[1,1]/sum(tab[1,]) #specificity


#단순회귀 sulphates
fit.sulphates = glm(quality ~ sulphates, family = binomial, data=wine)
summary(fit.sulphates)

p = predict(fit.sulphates, newdata = wine, type = "response")
cutoff = 0.5
yhat = ifelse(p > cutoff, 1, 0)

tab = table(wine$quality, yhat, dnn = c("Observed", "Predicted"))
print(tab)
sum(diag(tab))/sum(tab) #accuracy
tab[2,2]/sum(tab[2,]) #sensitivity
tab[1,1]/sum(tab[1,]) #specificity


# 단계적 선택법
fit.all = glm(quality ~ ., family = binomial, data=wine)
fit.step = step(fit.all, direction = "both")
fit.step$anova

summary(fit.step)

p = predict(fit.step, newdata = wine, type = "response")
cutoff = 0.5
yhat = ifelse(p > cutoff, 1, 0)

tab = table(wine$quality, yhat, dnn = c("Observed", "Predicted"))
print(tab)
sum(diag(tab))/sum(tab) #accuracy
tab[2,2]/sum(tab[2,]) #sensitivity
tab[1,1]/sum(tab[1,]) #specificity
