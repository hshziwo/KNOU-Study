setwd("/home/hshziwo/공부/R/방송통신대/데이터시각화/기말")
#3번
#install.packages("sp")
library(sp)
library(readr)
library(dplyr)
gadm <- readRDS("../data_viz-master/data/ch5/gadm36_KOR_1_sp.rds")

# 시도인구 데이터 불러옴, 코드별로 정렬
ur      <- read.csv("./ur.csv",header=T, 
                    fileEncoding = guess_encoding("./ur.csv")[1, 1] %>% 
                      as.character())
ur_sort <- ur[order(ur$code),]

# 구간 데이터로 변환, 각 구간의 색을 할당하고 지도를 그림
interval = c(0, 1, 2, 3, 4, 5, 6)
col = hcl.colors(7, "Set 3")[1:7]

# 2010년, 2019년 실업률
gadm$ur2010 <- as.factor(cut(ur_sort$Y2010,breaks=interval))
gadm$ur2019 <- as.factor(cut(ur_sort$Y2019,breaks=interval))

# 각 구간의 색을 무지개 색으로 할당하고 지도를 그림
spplot(gadm, "ur2010", col.regions=col, main="2010 Distribution of Unemployment rate")
spplot(gadm, "ur2019", col.regions=col, main="2019 Distribution of Unemployment rate")


#2번
data(Titanic)
str(Titanic)
addmargins(apply(Titanic, c(1,4), sum))

#Class별 생존율
mosaicplot(~ Class+Survived, data=Titanic, color=c("grey", "red"))

#성별과 나이대별 생존율 비교
mosaicplot(~ Sex+Survived, data=Titanic, color=c("grey", "red"))
mosaicplot(~ Age+Survived, data=Titanic, color=c("grey", "red"))

#남녀의 Class별 생존율 비교
mosaicplot(~ Class+Survived, data=as.table(Titanic[, "Male", "Adult",]),
           color=c("grey", "red"), main="Male+Adult")
mosaicplot(~ Class+Survived, data=as.table(Titanic[, "Female", "Adult",]),
           color=c("grey", "red"), main="Female+Adult")

#Class별 성인 남녀의 생존율 비교
mosaicplot(~ Class+Sex+Survived, dir=c("v", "v", "h"),
           data=Titanic[,, "Adult",], off=c(1,2), color=c("grey", "red"),
           main="Adult")
