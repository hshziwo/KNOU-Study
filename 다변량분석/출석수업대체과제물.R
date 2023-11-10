setwd("/home/hshziwo/공부/R/방송통신대/다변량분석")

# 1번
data("longley")
head(longley)
pairs(longley)
a = round(cor(longley, use = "complete.obs"), 3)
ifelse(a > 0.7, a, "")

stars(longley)

library("aplpack")
faces(longley, face.type = 0)

write.csv(longley, file = "/home/hshziwo/공부/R/방송통신대/다변량분석/longley.csv")


# 2번
# 데이터 읽기
us_crime=read.csv("ex2-4.csv", head=TRUE) 
head(us_crime) 
#도시명은 자료에서 제외함. 
us_crime = us_crime[,-1] 
head(us_crime) 
summary(us_crime) 

#2. 상관계수 행렬 및 산점도 행렬보기 
round(cor(us_crime),2) 
plot(us_crime, pch=19) 

#3. 주성분분석 실행하기 
library(stats) 
us_crime.pca = princomp(us_crime, cor=F, scores=T) 
us_crime.pca 

#4. 주성분분석 결과 
#1) 결과요약(summary) 
summary(us_crime.pca) 

#2) 스크리 그림 및 주성분계수 
screeplot(us_crime.pca, type="lines", pch=19, main="Scree Plot") 
abline(1000, 0, col="red") 

us_crime.pca$loadings[,1:2] 

#5. biplot을 이용한 행렬도 
biplot(us_crime.pca, cex=0.7, col=c("red", "blue"), main="Biplot") 



#3번
mall_customer=read.csv("mall_customer.csv", head=TRUE)
male_mall_customer = subset(mall_customer, Gender == 'Male')
female_mall_customer = subset(mall_customer, Gender == 'Female')
#id, 성별은 자료에서 제외함. 
male_mall_customer = male_mall_customer[,-1:-2]
female_mall_customer = female_mall_customer[,-1:-2]

#자료 표준화
zmale_mall_customer = scale(male_mall_customer)
round(apply(zmale_mall_customer, 2, mean), 3)
round(apply(zmale_mall_customer, 2, sd), 3)

zfemale_mall_customer = scale(female_mall_customer)
round(apply(zfemale_mall_customer, 2, mean), 3)
round(apply(zfemale_mall_customer, 2, sd), 3)

#거리행렬 계산
zmale_euc = dist(zmale_mall_customer)
zfemale_euc = dist(zfemale_mall_customer)

#와드의 방법
male_w = hclust(zmale_euc,method = "ward.D")
male_w
plot(male_w, hang = -1)
male_w24 = cutree(male_w, 2:4)
male_w24

female_w = hclust(zfemale_euc,method = "ward.D")
female_w
plot(female_w, hang = -1)
female_w24 = cutree(female_w, 2:4)
female_w24

#최장연결법
male_c = hclust(zmale_euc,method = "complete")
male_c
plot(male_c, hang = -1)
male_c24 = cutree(male_c, 2:4)
male_c24

female_c = hclust(zfemale_euc,method = "complete")
female_c
plot(female_c, hang = -1)
female_c24 = cutree(female_c, 2:4)
female_c24

#K-Means k=6
zmale_kmc = kmeans(zmale_mall_customer, centers = 6)
zmale_kmc

zfemale_kmc = kmeans(zfemale_mall_customer, centers = 6)
zfemale_kmc