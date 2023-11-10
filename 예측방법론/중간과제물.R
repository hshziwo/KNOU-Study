setwd("/home/hshziwo/공부/R/방송통신대/예측방법론")
#original = read.csv("전산업생산지수_원지수.csv",header=T, 
#                            fileEncoding = "euc-kr")
#head(original)

#season = read.csv("전산업생산지수_계절조정지수.csv",header=T, 
#                    fileEncoding = "euc-kr")
#head(season)

# 시계열 읽기
#install.packages('readxl')
library("readxl")
data = read_excel("전산업생산지수.xlsx")
head(data)
ts_data = ts(data, start=2000, frequency = 12) 
head(ts_data)

#2번 - 시계열 도표 작성
plot(ts_data[,2], ylab="전산업생산지수", xlab="연도", col="black") 
lines(ts_data[,3], col="blue")
legend("topleft", col=c("black","blue"), lty=1, c("원계열", "계절조정계열"))

#3번 - 시계열의 스펙트럼 
par(mfrow=c(2,1)) 
spectrum(ts_data[,2], spans=c(3,3), main="원계열", col="mediumpurple3") 
spectrum(ts_data[,3], spans=c(3,3), main="계절조정계열", col="mediumpurple3") 

#4번 - 계절조정계열의 로그변환계열 및 로그차분계열
plot(log(ts_data[,3]), ylab="로그변환계열", xlab="연도", col="black") 
plot(diff(log(ts_data[,3])), ylab="로그차분계열", xlab="연도", col="black") 

#4-1 - 계절조정계열의 로그변환계열 및 로그차분계열에 대해 ADF 검정 실시
library(tseries) 
adf.test(log(ts_data[,3])) 
adf.test(diff(log(ts_data[,3]))) 

#4-2 - 계절조정계열의 로그변환계열 및 로그차분계열에 대한 상관도표와 부분상관도표의 작성 
par(mfrow=c(2,2)) 
acf(log(ts_data[,3]),main="로그변환계열 상관도표 ") 
pacf(log(ts_data[,3]),main="로그변환계열 부분상관도표 ") 

acf(diff(log(ts_data[,3])),main="로그차분계열 상관도표") 
pacf(diff(log(ts_data[,3])),main="로그차분계열 부분상관도표 ") 

