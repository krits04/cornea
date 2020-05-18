library(OpenImageR)
library(reshpe2)
library(scales)
x<-as.matrix(read.csv(file="kernel_function_3.csv", header = T, row.names = 1)) ##use kernel_function_5.csv in case using 5*5 matrix##
image_matrix<-as.matrix(read.csv(file="test_cmi.csv", header = T))
image_matrix<-image_matrix[,-1]
res<-convolution(image_matrix, x, "same")
res.m<-rescale(res, to=c(0,1))
write.csv(res.m, file="test_ecmi.csv")
image_matrix<-as.matrix(read.csv(file="test_cc.csv", header = T))
image_matrix<-image_matrix[,-1]
res<-convolution(image_matrix, x, "same")
res.m<-rescale(res, to=c(0,1))
write.csv(res.m, file="test_ecc.csv")
image_matrix<-as.matrix(read.csv(file="test_cp.csv", header = T))
image_matrix<-image_matrix[,-1]
res<-convolution(image_matrix, x, "same")
res.m<-rescale(res, to=c(0,1))
write.csv(res.m, file="test_ecp.csv")
image_matrix<-as.matrix(read.csv(file="test_cp1.csv", header = T))
image_matrix<-image_matrix[,-1]
res<-convolution(image_matrix, x, "same")
res.m<-rescale(res, to=c(0,1))
write.csv(res.m, file="test_ecp1.csv")
image_matrix<-as.matrix(read.csv(file="test_cp2.csv", header = T))
image_matrix<-image_matrix[,-1]
res<-convolution(image_matrix, x, "same")
res.m<-rescale(res, to=c(0,1))
write.csv(res.m, file="test_ecp2.csv")
image_matrix<-as.matrix(read.csv(file="test_hc.csv", header = T))
image_matrix<-image_matrix[,-1]
res<-convolution(image_matrix, x, "same")
res.m<-rescale(res, to=c(0,1))
write.csv(res.m, file="test_ehc.csv")
image_matrix<-as.matrix(read.csv(file="test_rsa.csv", header = T))
image_matrix<-image_matrix[,-1]
res<-convolution(image_matrix, x, "same")
res.m<-rescale(res, to=c(0,1))
write.csv(res.m, file="test_ersa.csv")
image_matrix<-as.matrix(read.csv(file="test_scm.csv", header = T))
image_matrix<-image_matrix[,-1]
res<-convolution(image_matrix, x, "same")
res.m<-rescale(res, to=c(0,1))
write.csv(res.m, file="test_escm.csv")
image_matrix<-as.matrix(read.csv(file="test_sspred.csv", header = T))
image_matrix<-image_matrix[,-1]
res<-convolution(image_matrix, x, "same")
res.m<-rescale(res, to=c(0,1))
write.csv(res.m, file="test_essp.csv")
