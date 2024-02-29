

setwd('H:/Mayo_documents/Journal_paper/Lok_IBD_pathology/R_test')



library(ggplot2)

dev.off()



## VD_UMI vs pathology only ####
raw_data <- read.csv('Thickness_VLR_vs_Pathological_score_UMI_CFI_v1.csv',header = T)
IBD_data <- raw_data[,c(1:8)]
IBD_data[which(IBD_data[,6] == 0),1] <- 0
IBD_data[which(IBD_data[,6] == 1),1] <- 1

IBD_data$Project <-as.integer(IBD_data$Project)
IBD_data$VD_UMI <- as.double(IBD_data$VD_UMI)


glm.fit6=glm(IBD_data$Project~IBD_data$VD_UMI,
             family=binomial(link="logit"))


summary(glm.fit6)

p6=predict(glm.fit6,type='response')

modelroc6=roc(IBD_data$Project,p6)

par(pty="s")
plot.roc(modelroc6, print.auc=TRUE,legacy.axes=TRUE,col=c("purple"),lwd=4,cex.axis = 1.5,cex.lab = 1.5,cex.main= 1.5,cex.sub=1.5)
##title(main="Mild vs. Non-Mild")
legend("bottomright", 
       legend = c("Vessel density - UMI"), 
       col=c("purple"), lwd=4, inset=c(0,0),text.font= 2,cex=1.5, pch=1, pt.cex = 1)


## VD_CFI vs pathology only ####
raw_data <- read.csv('Thickness_VLR_vs_Pathological_score_UMI_CFI_v1.csv',header = T)
IBD_data <- raw_data[,c(1:9)]
IBD_data[which(IBD_data[,6] == 0),1] <- 0
IBD_data[which(IBD_data[,6] == 1),1] <- 1

IBD_data$Project <-as.integer(IBD_data$Project)
IBD_data$VD_CFI <- as.double(IBD_data$VD_CFI)


glm.fit7=glm(IBD_data$Project~IBD_data$VD_CFI,
             family=binomial(link="logit"))


summary(glm.fit7)

p7=predict(glm.fit7,type='response')

modelroc7=roc(IBD_data$Project,p7)

par(pty="s")
plot.roc(modelroc7, print.auc=TRUE,legacy.axes=TRUE,col=c("purple"),lwd=4,cex.axis = 1.5,cex.lab = 1.5,cex.main= 1.5,cex.sub=1.5)
##title(main="Mild vs. Non-Mild")
legend("bottomright", 
       legend = c("Vessel density - CFI"), 
       col=c("purple"), lwd=4, inset=c(0,0),text.font= 2,cex=1.5, pch=1, pt.cex = 1)





### Plot all image


par(pty="s")
plot.roc(modelroc6, print.auc=FALSE,legacy.axes=TRUE,col=c("purple"),lwd=4,cex.axis = 1.5,cex.lab = 1.5,cex.main= 1.5,cex.sub=1.5)
par(pty="s")
plot.roc(modelroc7,  add=TRUE,print.auc=FALSE,legacy.axes=TRUE,col=c("red"),lwd=4,cex.axis = 1.5,cex.lab = 1.5,cex.main= 1.5,cex.sub=1.5)

##title(main="Mild vs. Non-Mild")

legend("bottomright", legend = c("VD-UMI","VD-CFI"), 
       col=c("purple","red"), lwd=4, inset=c(0,0),text.font= 2,cex=1.5, pch=1, pt.cex = 1)
