library(seqinr)
test<-read.fasta(file="test.fasta",set.attributes = F, as.string = F)
x<-test$'1'
y<-test$'2'

for (i in length(x))
{
x[x[1:i]== 'd']<-1
x[x[1:i]== 'e']<-2
x[x[1:i]== 'c']<-3
x[x[1:i]== 'n']<-4
x[x[1:i]== 'f']<-5
x[x[1:i]== 'q']<-6
x[x[1:i]== 'y']<-7
x[x[1:i]== 's']<-8
x[x[1:i]== 'm']<-9
x[x[1:i]== 't']<-10
x[x[1:i]== 'i']<-11
x[x[1:i]== 'g']<-12
x[x[1:i]== 'v']<-13
x[x[1:i]== 'w']<-14
x[x[1:i]== 'l']<-15
x[x[1:i]== 'a']<-16
x[x[1:i]== 'p']<-17
x[x[1:i]== 'h']<-18
x[x[1:i]== 'k']<-19
x[x[1:i]== 'r']<-20
}

for (j in length(y))
{
  y[y[1:j]== 'd']<-1
  y[y[1:j]== 'e']<-2
  y[y[1:j]== 'c']<-3
  y[y[1:j]== 'n']<-4
  y[y[1:j]== 'f']<-5
  y[y[1:j]== 'q']<-6
  y[y[1:j]== 'y']<-7
  y[y[1:j]== 's']<-8
  y[y[1:j]== 'm']<-9
  y[y[1:j]== 't']<-10
  y[y[1:j]== 'i']<-11
  y[y[1:j]== 'g']<-12
  y[y[1:j]== 'v']<-13
  y[y[1:j]== 'w']<-14
  y[y[1:j]== 'l']<-15
  y[y[1:j]== 'a']<-16
  y[y[1:j]== 'p']<-17
  y[y[1:j]== 'h']<-18
  y[y[1:j]== 'k']<-19
  y[y[1:j]== 'r']<-20
}
mat<-matrix(0, ncol= length(x), nrow= length(y))
rownames(mat)<-y[1:length(y)]
colnames(mat)<-x[1:length(x)]
mj<-as.matrix(read.csv(file="charge compatibility.csv", header = T, row.names = 1, check.names = F))
library(reshape2)
mj.m<-melt(mj)
for(z in 1:nrow(mj.m))
  mat[rownames(mat)==mj.m[z,"Var1"],colnames(mat)==mj.m[z,"Var2"]]<-mj.m[z,"value"]
library(scales)
mat<-rescale(mat, to= c(0,1))

write.csv(mat, file="test_cc.csv")
