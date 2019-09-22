library(tm)
library(pdftools)
read<-readPDF(control = list(text = "-layout"))
doc_seq1<-Corpus(URISource("test1.pdf"), readerControl = list(reader= read))
doc_seq2<-Corpus(URISource("test2.pdf"), readerControl = list(reader= read))
doc1<-content(doc_seq1[[1]])
gsub('\n', '', doc1)->rsa1
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
write.csv(rsa1, file="test_a_rsa.csv")
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
write.csv(rsa1, file="test_b_rsa.csv")
