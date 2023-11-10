setwd("/home/hshziwo/공부/R/방송통신대/데이터시각화/data_viz-master/data/ch5")
#install.packages("sp")
library(sp)
library(readr)
library(dplyr)
gadm <- readRDS("./gadm36_KOR_1_sp.rds")

# 시도인구 데이터 불러옴, 코드별로 정렬
population      <- read.csv("./pop_S.csv",header=T, 
                            fileEncoding = guess_encoding("./pop_S.csv")[1, 1] %>% 
                              as.character())
population_sort <- population[order(population$Code),]

# 구간 데이터로 변환, 각 구간의 색을 할당하고 지도를 그림
interval = c(0,5, 10, 15, 20, 25, 30, 35, 40, 45)
col = hcl.colors(9, "Set 3")[1:9]
gadm$pop2020 <- as.factor(cut(population_sort$Y2020,breaks=interval))
spplot(gadm, "pop2020", col.regions=col, main="2020 지역별 65세이상 인구비율 분포")



# 1980년, 2040년 고령화 비율
# gadm$pop1980 <- as.factor(cut(population_sort$Y1980,breaks=interval))
# gadm$pop2040 <- as.factor(cut(population_sort$Y2040,breaks=interval))

# 각 구간의 색을 무지개 색으로 할당하고 지도를 그림
# spplot(gadm, "pop1980", col.regions=col, main="1980 Distribution of population")
# spplot(gadm, "pop2040", col.regions=col, main="2040 Distribution of population")