library(seqinr)
test<-read.fasta(file="test.fasta", set.attributes = F, as.string = F)
x<-test$'1'
y<-test$'2'

for (i in length(x))
{
x[x[1:i]== 'r']<-1
x[x[1:i]== 'k']<-2
x[x[1:i]== 'd']<-3
x[x[1:i]== 'q']<-4
x[x[1:i]== 'n']<-5
x[x[1:i]== 'e']<-6
x[x[1:i]== 'h']<-7
x[x[1:i]== 's']<-8
x[x[1:i]== 't']<-9
x[x[1:i]== 'p']<-10
x[x[1:i]== 'y']<-11
x[x[1:i]== 'c']<-12
x[x[1:i]== 'g']<-13
x[x[1:i]== 'a']<-14
x[x[1:i]== 'm']<-15
x[x[1:i]== 'w']<-16
x[x[1:i]== 'l']<-17
x[x[1:i]== 'v']<-18
x[x[1:i]== 'f']<-19
x[x[1:i]== 'i']<-20
}

for (j in length(y))
{
  y[y[1:j]== 'r']<-1
  y[y[1:j]== 'k']<-2
  y[y[1:j]== 'd']<-3
  y[y[1:j]== 'q']<-4
  y[y[1:j]== 'n']<-5
  y[y[1:j]== 'e']<-6
  y[y[1:j]== 'h']<-7
  y[y[1:j]== 's']<-8
  y[y[1:j]== 't']<-9
  y[y[1:j]== 'p']<-10
  y[y[1:j]== 'y']<-11
  y[y[1:j]== 'c']<-12
  y[y[1:j]== 'g']<-13
  y[y[1:j]== 'a']<-14
  y[y[1:j]== 'm']<-15
  y[y[1:j]== 'w']<-16
  y[y[1:j]== 'l']<-17
  y[y[1:j]== 'v']<-18
  y[y[1:j]== 'f']<-19
  y[y[1:j]== 'i']<-20
}
mat<-matrix(0, ncol= length(x), nrow= length(y))
rownames(mat)<-y[1:length(y)]
colnames(mat)<-x[1:length(x)]
mj<-as.matrix(read.csv(file="hydropathy compatibility.csv", header = T, row.names = 1, check.names = F))
library(reshape2)
mj.m<-melt(mj)
for(z in 1:nrow(mj.m))
  mat[rownames(mat)==mj.m[z,"Var1"],colnames(mat)==mj.m[z,"Var2"]]<-mj.m[z,"value"]
library(scales)
mat<-rescale(mat, to=c(0,1))

write.csv(mat, file="test_hc.csv")
