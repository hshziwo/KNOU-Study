setwd("/home/hshziwo/공부/KNOU-Study/데이터정보처리입문")

score = scan("score.txt")
mean(score)
median(score)
var(score)
sd(score)
cv = sd(score) / mean(score)
cv

stem(score)
hist(score)
boxplot(score)
