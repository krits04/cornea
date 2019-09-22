cmi<-function(p,p1,p2){
  if (is.matrix(aln.mat)) 
    alignment = aln.mat
  aa <- c("v", "i", "l", "m", "f", "w", "y", "s", "t", "n", 
          "q", "h", "k", "r", "d", "e", "a", "g", "p", "c", "-", 
          "x")
  composition <- table(alignment)
  unk <- composition[!names(composition) %in% aa]
  if (length(unk) > 0) {
    warning(paste("non standard residue code:", names(unk), 
                  "mapped to X\n  "))
    for (i in 1:length(unk)) alignment[alignment == names(unk[i])] = "X"
  }
  barplot(composition, xlab= "Amino Acids in Alphabetical Order", ylab= "Percentage", main= "Composition of alignment " )
  aln.mat[aln.mat[,1:ncol(aln.mat)]== "v"]<-1
  aln.mat[aln.mat[,1:ncol(aln.mat)]== "i"]<-2
  aln.mat[aln.mat[,1:ncol(aln.mat)]== "l"]<-3
  aln.mat[aln.mat[,1:ncol(aln.mat)]== "m"]<-4
  aln.mat[aln.mat[,1:ncol(aln.mat)]== "f"]<-5
  aln.mat[aln.mat[,1:ncol(aln.mat)]== "w"]<-6
  aln.mat[aln.mat[,1:ncol(aln.mat)]== "y"]<-7
  aln.mat[aln.mat[,1:ncol(aln.mat)]== "s"]<-8
  aln.mat[aln.mat[,1:ncol(aln.mat)]== "t"]<-9
  aln.mat[aln.mat[,1:ncol(aln.mat)]== "n"]<-10
  aln.mat[aln.mat[,1:ncol(aln.mat)]== "q"]<-11
  aln.mat[aln.mat[,1:ncol(aln.mat)]== "h"]<-12
  aln.mat[aln.mat[,1:ncol(aln.mat)]== "k"]<-13
  aln.mat[aln.mat[,1:ncol(aln.mat)]== "r"]<-14
  aln.mat[aln.mat[,1:ncol(aln.mat)]== "d"]<-15
  aln.mat[aln.mat[,1:ncol(aln.mat)]== "e"]<-16
  aln.mat[aln.mat[,1:ncol(aln.mat)]== "a"]<-17
  aln.mat[aln.mat[,1:ncol(aln.mat)]== "g"]<-18
  aln.mat[aln.mat[,1:ncol(aln.mat)]== "p"]<-19
  aln.mat[aln.mat[,1:ncol(aln.mat)]== "c"]<-20
  aln.mat[aln.mat[,1:ncol(aln.mat)]== "-"]<-21
  aln.mat[aln.mat[,1:ncol(aln.mat)]== "x"]<-22
  len <- ncol(aln.mat)
  freq.10.original <- matrix(, nrow = 22, ncol = ncol(aln.mat), dimnames = list(c(1:22), c(1:len)))
  for(i in 1:len)
  {
    for(j in 1:22)
    {
      freq.10.original[j,i] <- (sum(aln.mat[,i] == j, na.rm=T)/nrow(aln.mat))
    } 
  }
  library(gplots)
  library(RColorBrewer)
  mypallete<-brewer.pal(9,"YlOrRd")
  row.index<-matrix(, nrow=22, ncol=1)
  row.index[1,1]<-c("V")
  row.index[2,1]<-c("I")
  row.index[3,1]<-c("L")
  row.index[4,1]<-c("M")
  row.index[5,1]<-c("F")
  row.index[6,1]<-c("W")
  row.index[7,1]<-c("Y")
  row.index[8,1]<-c("S")
  row.index[9,1]<-c("T")
  row.index[10,1]<-c("N")
  row.index[11,1]<-c("Q")
  row.index[12,1]<-c("H")
  row.index[13,1]<-c("R")
  row.index[14,1]<-c("K")
  row.index[15,1]<-c("D")
  row.index[16,1]<-c("E")
  row.index[17,1]<-c("A")
  row.index[18,1]<-c("G")
  row.index[19,1]<-c("P")
  row.index[20,1]<-c("C")
  row.index[21,1]<-c("-")
  row.index[22,1]<-c("X")
  row.names(freq.10.original)<-row.index[1:22,1]
  heatmap.2(freq.10.original, Rowv=F, Colv=F, na.rm=T, dendogram="none", symm=T, density.info="none", col= mypallete, trace="none", labRow= row.names(freq.10.original))
ad<-matrix(,nrow=p1, ncol=p2) #p1: length of protein 1, p2: length of protein 2
for(a in 1:p1){
  k<-matrix(, nrow = 22, ncol= p2)
  for(cat in 1:22)
  {
    
    s<-data.frame()
    s<-subset(aln.mat, aln.mat[,a]== cat)
      freq.10.test1<-matrix(, nrow =22, ncol = p) #p: length of total no of positions in MSA
for (i in (p1+1):p){
  for(j in 1:22){
    
    freq.10.test1[j,i] <- (sum(s[,i] == j, na.rm=T)/nrow(s))
  }
}
    freq.10.1.1<-freq.10.test1[,(p1+1):p]
    
    x<-melt(freq.10.1.1)
    y<-melt(freq.10.original[,(p1+1):p])
    I.test<- x$value*log10(x$value/y$value)
    I.test1<-matrix(I.test, nrow=22, ncol=p2)
    MI<-freq.10.original[cat,a]*I.test1
  colsum<-colSums(MI,na.rm = T)
    k[cat,]<-colsum
  }
  catsum<-colSums(k, na.rm=T)
    ad[a,]<-catsum
}
ad
}


