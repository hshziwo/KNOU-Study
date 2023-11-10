setwd("/home/hshziwo/공부/R/방송통신대/회귀모형/기말")
pfsalary = read.csv("./pfsalary.csv", header = TRUE, sep = ",")

pfsalary$SEX = factor(pfsalary$SEX, level=c(0,1), label=c("남자", "여자"))
plot(pfsalary$YR, pfsalary$SL, type="n")
points(pfsalary$YR[pfsalary$SEX=="여자"], pfsalary$SL[pfsalary$SEX=="여자"], pch=17, col="BLUE")
points(pfsalary$YR[pfsalary$SEX=="남자"], pfsalary$SL[pfsalary$SEX=="남자"], pch=19, col="RED")
legend("bottomright", legend=levels(pfsalary$SEX), pch=c(19,17), col=c("RED","BLUE"))

pfsalary.lm = lm(SL ~ YR + SEX + YR:SEX, data=pfsalary)
summary(pfsalary.lm)
pfsalary.lm = lm(SL ~ YR + SEX, data=pfsalary)
summary(pfsalary.lm)

pfsalary$RK = factor(pfsalary$RK, level = c(1:3), label=c("조교수", "부교수", "정교수"))
pfsalary$DG = factor(pfsalary$DG, level = c(0,1), label=c("석사","박사"))
p1.lm = lm(SL ~ YR, data = pfsalary)
p2.lm = lm(SL ~ YR + SEX + RK + DG, data = pfsalary)
anova(p1.lm, p2.lm)

pfsalary.lm = lm(SL ~ YR + SEX + RK + DG, data=pfsalary)
summary(pfsalary.lm)
