# install.packages("TeachingDemos")
library(TeachingDemos)
#shape == r, r=1은 exp, rate == lambda
clt.examp(n = 2, gamma.param = list(shape=1, rate=1)) 
clt.examp(n = 5, gamma.param = list(shape=1, rate=1))
clt.examp(n = 10, gamma.param = list(shape=1, rate=1))
clt.examp(n = 30, gamma.param = list(shape=1, rate=1))
