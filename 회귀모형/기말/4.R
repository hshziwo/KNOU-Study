setwd("/home/hshziwo/공부/R/방송통신대/회귀모형/reg2020")
glider = read.csv("./sugar_glider_binomial.csv", header = TRUE, sep = ",")
logit_m1 = glm(occurr ~ p_size_km + con_metric, family = binomial(link = logit), data = glider)
summary(logit_m1)

logit_m2 = glm(occurr ~ p_size_km, family = binomial(link = logit), data = glider)
summary(logit_m2)

x = 120
predict(logit_m2, list(p_size_km = x), type = "response")

Pr = predict(logit_m2, list(p_size_km = x), type = "link")
Se = sqrt(vcov(logit_m2)[1,1] + x^2*vcov(logit_m2)[2,2] + 2*x*vcov(logit_m2)[2,1])
CL = Pr - 1.96 * Se
CU = Pr + 1.96 * Se
lower = exp(CL) / (1 + exp(CL))
upper = exp(CU) / (1 + exp(CU))
lower
upper
