library(tm)
library(pdftools)
read<-readPDF(control = list(text = "-layout"))
doc_seq1<-Corpus(URISource("seq1.pdf"), readerControl = list(reader= read))
doc_seq2<-Corpus(URISource("seq2.pdf"), readerControl = list(reader= read))
doc1<-content(doc_seq1[[1]])
i<-length(doc1)
gsub('[0-9]+', '', doc1)->sspred1
gsub('Pred:', '', sspred1)->sspred1
gsub('Conf:', '', sspred1)->sspred1
gsub('AA: [A-Z]+', '', sspred1)->sspred1
gsub('= helix', '', sspred1)->sspred1
gsub('= confidence of prediction', '', sspred1)->sspred1
gsub('= coil', '', sspred1)->sspred1
gsub('= strand', '', sspred1)->sspred1
gsub('AA: target sequence', '', sspred1)->sspred1
gsub('predicted secondary structure', '', sspred1)->sspred1
gsub('Legend:', '', sspred1)->sspred1
gsub ('-', '', sspred1)->sspred1
gsub ('\\+', '', sspred1)->sspred1
gsub('\n', '', sspred1)->sspred1
gsub(' ', '', sspred1)->sspred1
if(i>1)
{
  for(n in i){
test1<-vector('list', length(i))
        test1<-as.list(sspred1)
ssp1<-paste(unlist(test1), collapse= '')
  }
}else {
  ssp1<-sspred1
}
gsub('C', '3', ssp1)->ssp1
gsub('H', '1', ssp1)->ssp1
gsub('E', '2', ssp1)->ssp1
ssp_1<-strsplit(ssp1, "")[[1]]
doc2<-content(doc_seq2[[1]])
j<-length(doc2)
gsub('[0-9]+', '', doc2)->sspred2
gsub('Pred:', '', sspred2)->sspred2
gsub('Conf:', '', sspred2)->sspred2
gsub('AA: [A-Z]+', '', sspred2)->sspred2
gsub('= helix', '', sspred2)->sspred2
gsub('= confidence of prediction', '', sspred2)->sspred2
gsub('= coil', '', sspred2)->sspred2
gsub('= strand', '', sspred2)->sspred2
gsub('AA: target sequence', '', sspred2)->sspred2
gsub('predicted secondary structure', '', sspred2)->sspred2
gsub('Legend:', '', sspred2)->sspred2
gsub ('-', '', sspred2)->sspred2
gsub ('\\+', '', sspred2)->sspred2
gsub('\n', '', sspred2)->sspred2
gsub(' ', '', sspred2)->sspred2
if(j>1)
{
  for(n in j){
    test2<-vector('list', length(j))
    test2<-as.list(sspred2)
    ssp2<-paste(unlist(test2), collapse= '')
  } 
}else {
    ssp2<-sspred2
  }
gsub('C', '3', ssp2)->ssp2
gsub('H', '1', ssp2)->ssp2
gsub('E', '2', ssp2)->ssp2
ssp_2<-strsplit(ssp2, "")[[1]]
ssp_1<-as.numeric(ssp_1)
ssp_2<-as.numeric(ssp_2)
r<-length(ssp_1)+1
c<-length(ssp_2)+1
ssp<-matrix(0, ncol =c, nrow= r)
ssp[1, 2:c]<-ssp_2
ssp[2:r, 1]<-ssp_1
r<-r-1
c<-c-1
for (i in 1:r)
{
  ssp[i+1, 1]->m;
  
  for(j in 1:c)
  {
    ssp[i+1, j+1]<-ssp[1, j+1]*m;
    j<-j+1;
  }
  
  i<-i+1;
}
ssp<-ssp[-1,-1]
ssp.m<-ssp
ssp.m[ssp.m==9]<-0.6
ssp.m[ssp.m==3]<-0.5
ssp.m[ssp.m==6]<-0.4
ssp.m[ssp.m==1]<-0.3
ssp.m[ssp.m==4]<-0.2
ssp.m[ssp.m==2]<-0.1
ssp.m<-t(ssp.m)
write.csv(ssp.m, file="test_sspred.csv")
