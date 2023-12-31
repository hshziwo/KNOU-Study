#library(sp)
#gadm <- readRDS("./data/gadm36_KOR_1_sp.rds")

#library(raster) 
#gadm<-getData('GADM', country='KOR', level=1)  
#plot(gadm)      

# 시도인구 데이터 불러옴, 코드별로 정렬
ur      <- read.csv("./data/ur.csv",header=T)
ur_sort <- ur[order(ur$code),]

# 구간 데이터로 변환
# 각 구간의 색을 할당하고 지도를 그림
# col = rainbow(length(levels(gadm$population)))
interval = c(0,1, 2, 3, 4, 5, 6)
col = hcl.colors(13, "Set 3")

gadm$ur2010 <- as.factor(cut(ur_sort$Y2010,breaks=interval))
gadm$ur2019 <- as.factor(cut(ur_sort$Y2019,breaks=interval))

# 각 구간의 색을 무지개 색으로 할당하고 지도를 그림
spplot(gadm, "ur2010", col.regions=col, main="2010 Distribution of Unemployment rate")
spplot(gadm, "ur2019", col.regions=col, main="2019 Distribution of Unemployment rate")