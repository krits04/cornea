library(igraph)
ab<-read.csv(file="prediciton_test.csv", header = TRUE)
ab$ProteinB<-paste0(ab$ProteinB, 'B')
ab$ProteinA<-paste0(ab$ProteinA, 'A')
aa<-read.csv(file="test_a_rsa.csv", header = T)
aa_1<-aa[aa$RSA==0,]
aa_1$ProteinA<-paste0(aa_1$ProteinA, 'A')
bb<-read.csv(file="test_b_rsa.csv", header = T)
bb_1<-bb[bb$RSA==0,]
bb_1$ProteinB<-paste0(bb_1$ProteinB, 'B')
ab_1<-ab[!ab$ProteinA %in% aa_1$ProteinA, ]
ab_1<-ab_1[!ab_1$ProteinB %in% bb_1$ProteinB, ]
ca<-read.csv(file="test_a_intra_top_5.csv", header = TRUE)
g1<-graph.data.frame(ca, directed = FALSE)
cb<-read.csv(file="test_b_intra_top_5.csv", header = TRUE)
g2<-graph.data.frame(cb, directed = FALSE)
ab_1<-ab_1[!ab_1$ProteinA %in% V(g1)$name, ]
ab_1<-ab_1[!ab_1$ProteinB %in% V(g2)$name, ]
g3<-graph.data.frame(ab_1, directed = FALSE)
bipartite.mapping(g3)
V(g3)$type <- bipartite_mapping(g3)$type
V(g3)$color <- ifelse(V(g3)$type, "lightgreen", "pink")
V(g3)$shape <- ifelse(V(g3)$type, "sphere", "sphere")
E(g3)$color <- "gray"
par(mar=c(0,0,0,0))
plot(g3, layout= layout_as_tree(g3, circular = T), vertex.size= 6, vertex.label.color= "black", vertex.label.cex= 0.25)
x<-as_long_data_frame(g3)
write.csv(x, file="test_final_predcition.csv")
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
