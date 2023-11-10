setwd("/home/hshziwo/공부/R/방송통신대/비정형데이터분석")

#install.packages("rvest")
#install.packages("dplyr")
library(rvest)
library(dplyr)
exurl = "https://ko.wikipedia.org/wiki/%EB%8D%B0%EC%9D%B4%ED%84%B0_%EC%8B%9C%EA%B0%81%ED%99%94"
html_ex = read_html(exurl, encoding = "UTF-8")

Sys.time()

html_ex %>% html_nodes(".mw-parser-output p") %>% html_text()