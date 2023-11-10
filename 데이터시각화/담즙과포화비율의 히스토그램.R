setwd("/home/hshziwo/공부/R/방송통신대/데이터시각화")
library(readr)
library(dplyr)
담즙과포화비율 = read.table("담즙과포화비율.txt", header=T, fileEncoding = guess_encoding("담즙과포화비율.txt")[1, 1] %>% as.character())
담즙과포화비율
attach(담즙과포화비율)
str(담즙과포화비율)

n = length(담즙의과포화비율)
n

sort(담즙의과포화비율)
sort(담즙의과포화비율, decreasing = T)
par(mfrow=c(2,1))
hist(담즙의과포화비율, breaks = 성별, main = NULL)