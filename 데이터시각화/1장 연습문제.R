# pie(rep(1,12), col=rainbow(12), clockwise = TRUE, labels = "")
# par(new=T)
# pie( rep(1,1), col="white", radius = 0.5, labels = "", border = "white")

color = 0
plot(0:5,0:5,type = "n",xlab = "",ylab = "")
for (i in 0:4) {
  for (j in 0:4) {
    color = color + 1
    rect(j,i,j+1,i+1, col = rainbow(25)[color]) 
  }
}

