setwd("/home/hshziwo/공부/KNOU-Study/베이즈데이터분석")

#2.(b) theta의 95% 신용구간
alpha = 27/2
beta = 19/2
post.quantile = numeric(2)
names(post.quantile) = c("2.5%", "97.5%")
post.quantile["2.5%"] = qbeta(0.025, alpha, beta) 
post.quantile["97.5%"] = qbeta(0.975, alpha, beta)
post.quantile

#3.(b) xi의 표본추출
n = 1000
alpha = 11/2
beta = 25/2
xi = rbeta(n, alpha, beta)
head(xi)

#3.(c)
n = 1000
alpha = 27/2
beta = 19/2
theta = rbeta(n, alpha, beta)
head(theta)

post = theta - xi
mean(post)
sd(post)
quantile(post, c(0.025, 0.975))