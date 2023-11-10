setwd("/home/hshziwo/공부/R/방송통신대/데이터시각화")
library(readr)
library(dplyr)
king = read.table("chosun kings.txt", header=T, fileEncoding = guess_encoding("chosun kings.txt")[1, 1] %>% as.character())
str(king)
attach(king)
X11(width = 5.5, height = 4.5)
# hist(period)
# hist(period, xlim = c(0,70), ylim = c(0,10), nclass = 14,
#      right = F, main = "조선왕조", xlab = "재위기간(년)", ylab = "빈도")
hist(period, xlim = c(0,70), ylim = c(0,10), nclass = 14,
     right = F, main = "조선왕조", xlab = "재위기간(년)", ylab = "빈도",
     col= c( rep("lightblue",2), rep("royalblue", 6), rep("navyblue", 6)))