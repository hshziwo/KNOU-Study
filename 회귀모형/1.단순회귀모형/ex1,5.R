setwd("/home/hshziwo/공부/R/방송통신대/회귀모형/1.단순회귀모형")
machine = read.table("./ex1,5", header=T, sep="\t")
#head(machine)
machine.lm = lm(cost ~ age, data=machine)
summary(machine.lm)#1.(3),(4)
plot(machine$age, machine$cost, xlab="age of machines", ylab="cost", pch=19) #1.(1)
title("사용연도와 정비비용의 산점도")
abline(machine.lm)#1.(2)
cor(machine$age, machine$cost) #1.(4)
anova(machine.lm)#1.(5)
predict(machine.lm, newdata = data.frame(age = 4)) #1.(6)
sum(machine.lm$residuals)
sum(machine$age * machine.lm$residuals)
sum(machine.lm$fitted.values * machine.lm$residuals)

# install.packages("lm.beta")
library(lm.beta)
machine.beta = lm.beta(machine.lm)
print(machine.beta)#1.(7)
cor(machine$age, machine$cost)#1.(7)

confint(machine.lm, level = 0.9)
predict(machine.lm, newdata = data.frame(age = 8),interval = "confidence", level = 0.9) #5
t_val = (13.637 - 10) / 3.149
2*(1-pt(t_val,13)) #5
