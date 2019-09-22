library(tm)
library(pdftools)
library(reshape2)
library(scales)
read<-readPDF(control = list(text = "-layout"))
doc_seq1<-Corpus(URISource("test1.pdf"), readerControl = list(reader= read))
doc_seq2<-Corpus(URISource("test2.pdf"), readerControl = list(reader= read))
doc1<-content(doc_seq1[[1]])
i<-length(doc1)
if(i>1)
{
  for(n in i){
    test1<-vector('list', length(i))
    test1<-as.list(doc1)
    rsa1<-paste(unlist(test1), collapse= '')
  }
}else {
rsa1<-doc1
}
rsa_1<-strsplit(rsa1, "")[[1]]
gsub('\n', '', rsa_1)->rsa1
rsa1<-rsa1[rsa1 != ""]
rsa1<-rsa1[rsa1 != "\r"]
doc2<-content(doc_seq2[[1]])
j<-length(doc2)
if(j>1)
{
  for(n in j){
    test2<-vector('list', length(j))
    test2<-as.list(doc2)
    rsa2<-paste(unlist(test2), collapse= '')
  } 
}else {
  rsa2<-doc2
}
rsa_2<-strsplit(rsa2, "")[[1]]
gsub('\n', '', rsa_2)->rsa2
rsa2<-rsa2[rsa2 != ""]
rsa2<-rsa2[rsa2 != "\r"]
rsa1<-as.numeric(rsa1)
rsa2<-as.numeric(rsa2)
r<-length(rsa1)+1
c<-length(rsa2)+1
rsa<-matrix(0, ncol =c, nrow= r)
rsa[1, 2:c]<-rsa2
rsa[2:r, 1]<-rsa1
r<-r-1
c<-c-1
for (i in 1:r)
{
    for(j in 1:c)
  {
    rsa[i+1, j+1]<-rsa[1, j+1]*rsa[i+1, 1];
    j<-j+1;
  }
  
  i<-i+1;
}
rsa<-rsa[-1,-1]
rsa.m<-rescale(rsa, to=c(0,1))
write.csv(rsa.m, file="test_rsa.csv")