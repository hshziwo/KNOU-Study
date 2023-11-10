# X11()
# color = c("#FF0000","#FFFF00","#00FF00","#00FFFF","#0000FF","#FF00FF")
# pie(rep(1,5), col = color, labels = color)
# par(new=T)
# pie( rep(1,1), col="white", radius = 0.5, labels = "")

# n = 10
# X11(height = 2.5, width = 8)
# barplot(rep(1,n), col = rainbow(n,alpha = 0.5), axes = F, main = "rainbow colors")
# barplot(rep(1,n), col = heat.colors(n,alpha = 0.5), axes = F, main = "heat colors")

library(RColorBrewer)
# X11(height = 2.5, width = 8)
# barplot(rep(1,9), col = brewer.pal(9,"Reds"), axes = F, main = "Brewer Reds")

display.brewer.all(type = "div")
X11()
display.brewer.all(type = "qual")

