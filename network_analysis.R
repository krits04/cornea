library(igraph)
library(reshape2)
x<-as.matrix(read.csv(file = "test_cmi.csv", header = T, row.names = 1))
x<-t(x)
x.m<-melt(x)
x.m$Var1<-gsub('V','', x.m$Var1 )
x.m$Var1<-as.integer(x.m$Var1)
ab<-read.csv(file="prediction_test.csv", header = TRUE)
ab<-cbind(x.m$Var1, x.m$Var2, ab$prediction)
ab<-as.data.frame(ab)
ab<-ab[which(ab$V3==1),]
ab$V1<-paste0(ab$V1, 'B')
ab$V2<-paste0(ab$V2, 'A')
aa<-read.csv(file="test_a_rsa.csv", header = T)
aa_1<-aa[aa$x==0,]
aa_1$X<-paste0(aa_1$X, 'A')
bb<-read.csv(file="test_b_rsa.csv", header = T)
bb_1<-bb[bb$x==0,]
bb_1$X<-paste0(bb_1$X, 'B')
ab_1<-ab[!ab$V2 %in% aa_1$X, ]
ab_1<-ab_1[!ab_1$V1 %in% bb_1$X, ]
ca<-read.csv(file="test_a_intra_top_l.csv", header = TRUE)
ca<-ca[,-1]
g1<-graph.data.frame(ca, directed = FALSE)
cb<-read.csv(file="test_b_intra_top_l.csv", header = TRUE)
cb<-cb[,-1]
g2<-graph.data.frame(cb, directed = FALSE)
ab_1<-ab_1[!ab_1$V2 %in% V(g1)$name, ]
ab_1<-ab_1[!ab_1$V1 %in% V(g2)$name, ]
g3<-graph.data.frame(ab_1, directed = FALSE)
bipartite.mapping(g3)
V(g3)$type <- bipartite_mapping(g3)$type
V(g3)$color <- ifelse(V(g3)$type, "lightgreen", "pink")
V(g3)$shape <- ifelse(V(g3)$type, "sphere", "sphere")
E(g3)$color <- "gray"
par(mar=c(0,0,0,0))
plot(g3, layout= layout_as_tree(g3, circular = T), vertex.size= 6, vertex.label.color= "black", vertex.label.cex= 0.25)
x<-as_long_data_frame(g3)
write.csv(x, file="test_final_predcition_topl.csv")
g4<-graph.data.frame(ab, directed = FALSE)
bipartite.mapping(g4)
V(g4)$type <- bipartite_mapping(g4)$type
V(g4)$color <- ifelse(V(g4)$type, "lightgreen", "pink")
V(g4)$shape <- ifelse(V(g4)$type, "sphere", "sphere")
E(g4)$color <- "gray"
par(mar=c(0,0,0,0))
plot(g4, layout= layout_as_tree(g4, circular = T), vertex.size= 4, vertex.label.color= "black", vertex.label.cex= 0.4)
V(g1)$shape<-"sphere"
V(g1)$color<-"pink"
plot(g1, layout=layout_as_tree(g1, circular = T, flip.y = T), vertex.size= 4, vertex.label.color= "black", vertex.label.cex= 0.25)
V(g2)$shape<-"sphere"
V(g2)$color<-"lightgreen"
plot(g2, layout=layout_as_tree(g2, circular = T, flip.y = T), vertex.size= 4, vertex.label.color= "black", vertex.label.cex= 0.25)
