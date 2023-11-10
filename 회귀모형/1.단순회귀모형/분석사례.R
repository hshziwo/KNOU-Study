setwd("/home/hshziwo/공부/R/방송통신대/회귀모형/1.단순회귀모형")
super = read.table("supermarket.txt", header = T)
head(super, 3)

attach(super)
plot(price, time, pch= 19)

super.lm = lm(time ~ price, data = super)
summary(super.lm)

anova(super.lm)

names(super.lm)

cbind(super, super.lm$residuals, super.lm$fitted.values)

plot( price, super.lm$residuals, pch= 19)
abline(h=0, lty=2)

p.x = data.frame(price = c(1,45))
pc = predict( super.lm, int="c", newdata = p.x)
pred.x = p.x$price
# plot(super$price, super$time)
plot(super$price, super$time, ylim = range(super$time, pc))
matlines(pred.x, pc, lty = c(1,2,2), col = "RED")