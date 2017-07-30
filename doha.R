setwd("Documents/pj/doha/")
library(ggplot2)
df <- data.frame(a = rnorm(300), b = rnorm(300))
s <- sample(colors(1),200,replace=TRUE)
h <- sample(1:360, 200)

df <- data.frame(a = rnorm(200), b = rnorm(200),s,h)
p<-c(paste("a",letters,".png",sep=""),paste("b",letters,".png",sep=""))
x<-0

for (i in seq(100,1400,length.out = 52)){
  x<-x+1
  png(p[x])
  g<-ggplot(df, aes(a * i/900, b * i/900)) +xlim(-2, 2) + ylim(-2, 2)+
    geom_text(aes(a * i/900, b * i/900),label="Randa",col=s,angle= h+i)+
    geom_point(aes(a * i/500, b * i/500),col="red",size = 1, alpha = .7)+
    theme(axis.line=element_blank(),axis.text.x=element_blank(),
          axis.text.y=element_blank(),axis.ticks=element_blank(),
          axis.title.x=element_blank(),
          axis.title.y=element_blank(),legend.position="none",
          panel.background=element_blank(),panel.border=element_blank(),panel.grid.major=element_blank(),
          panel.grid.minor=element_blank(),plot.background=element_rect(fill="black"))
  print(g)

  dev.off()
}
