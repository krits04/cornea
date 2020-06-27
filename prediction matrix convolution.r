library(OpenImageR)
library(reshape2)
cc<-as.matrix(read.csv(file="test_cc.csv", header = F))
cc<-cc[-1,-1]
r<-nrow(cc)
c<-ncol(cc)
inf<-matrix(0,r,c)
x<-as.matrix(read.csv(file="test_final_predcition_topl.csv", header = T))
x<-as.data.frame(x)
y<-as.data.frame(x$from_name)
y<-cbind(y, x$to_name)
y$`x$from_name`<-gsub('B','',y$`x$from_name`)
y$`x$to_name`<-gsub('A','',y$`x$to_name`)
y$`x$from_name`<-as.integer(y$`x$from_name`)
y$`x$to_name`<-as.integer(y$`x$to_name`)
x<-as.matrix(y)
m<-nrow(x)
for(i in 1:m)
{
  inf[x[i,1], x[i,2]]<-1
}
a<-matrix(1,3,3)  ##change to matrix(1,5,5) if using 5*5 convolution##
Z<-convolution(inf, a, mode= "same")
z.m<-melt(Z)
z.m.f<-z.m[(z.m$value>2),] ##change to z.m$value>6 if using 5*5 matrix##
write.csv(z.m.f, file="final_prediction_test_topl.csv")
