library(OpenImageR)
library(reshape2)
cc<-as.matrix(read.csv(file="test_cc.csv", header = F))
cc<-cc[-1,-1]
r<-nrow(cmi)
c<-ncol(cmi)
inf<-matrix(0,r,c)
x<-as.matrix(read.csv(file="prediction_test.csv", header = F))
m<-nrow(x)
for(i in 1:m)
{
  inf[x[i,1], x[i,2]]<-1
}
y<-matrix(1,3,3)  ##change to matrix(1,5,5) if using 5*5 convolution##
Z<-convolution(inf, y, mode= "same")
z.m<-melt(z)
z.m.f<-z.m[(z.m$value>2),] ##change to z.m$value>6 if using 5*5 matrix##
write.csv(z.m.f, file="test_final_prediction.csv")
