

setwd('//mfad/researchmn/ULTRASOUND/SONG/SHARED/ForUWai/Mayo Document/Journal_paper/Lok_IBD_pathology/R_test')

##dev.off()


library(ggplot2)

library(ROCR)

library(pROC)



### Read all the data for both VLR and Thickness ####
raw_data <- read.csv('Thickness_VLR_vs_Pathological_score_All_2023_1117.csv',header = T)

IBD_data <- raw_data



IBD_data[which(IBD_data[,6] == 0),1] <- 0
IBD_data[which(IBD_data[,6] == 1),1] <- 1

IBD_data$Project<-as.integer(IBD_data$Project)
IBD_data$VLR..Our.method.UMI.<-as.double(IBD_data$VLR..Our.method.UMI.) 



#X_ibd <- as.numeric(as.matrix(cbind(IBD_data[c(1:48),c(2)])))

glm.fit=glm(IBD_data$Project~IBD_data$VLR..Our.method.UMI.,data = IBD_data,
            family=binomial(link="logit"))


summary(glm.fit)

p=predict(glm.fit,type='response')

modelroc=roc(IBD_data$Project,p)

par(pty="s")
plot.roc(modelroc, print.auc=TRUE,legacy.axes=TRUE,col=c("red"),lwd=4,cex.axis = 1.5,cex.lab = 1.5,cex.main= 1.5,cex.sub=1.5)
##title(main="Mild vs. Non-Mild")
legend("bottomright", 
       legend = c("Vessel-length ratio"), 
       col=c("red"), lwd=4, inset=c(0,0),text.font= 2,cex=1.5, pch=1, pt.cex = 1)

ci.auc(modelroc)


## VLR-CFI #####

IBD_data$Project<-as.integer(IBD_data$Project)
IBD_data$VLR..LE10.CFI. <-as.double(IBD_data$VLR..LE10.CFI.  ) 



#X_ibd <- as.numeric(as.matrix(cbind(IBD_data[c(1:48),c(2)])))

glm.fit1=glm(IBD_data$Project~IBD_data$VLR..LE10.CFI.,data = IBD_data,
            family=binomial(link="logit"))


summary(glm.fit1)



p1=predict(glm.fit1,type='response')

modelroc1=roc(IBD_data$Project,p1)

par(pty="s")
plot.roc(modelroc1, print.auc=TRUE,legacy.axes=TRUE,col=c("purple"),lwd=4,cex.axis = 1.5,cex.lab = 1.5,cex.main= 1.5,cex.sub=1.5)
##title(main="Mild vs. Non-Mild")
legend("bottomright", 
       legend = c("Vessel-length ratio"), 
       col=c("purple"), lwd=4, inset=c(0,0),text.font= 2,cex=1.5, pch=1, pt.cex = 1)

ci.auc(modelroc1)


par(pty="s")
plot.roc(modelroc, print.auc=FALSE,legacy.axes=TRUE,col=c("red"),lwd=4,cex.axis = 1.5,cex.lab = 1.5,cex.main= 1.5,cex.sub=1.5)
par(pty="s")
plot.roc(modelroc1,  add=TRUE,print.auc=FALSE,legacy.axes=TRUE,col=c("blue"),lwd=4,cex.axis = 1.5,cex.lab = 1.5,cex.main= 1.5,cex.sub=1.5)

##title(main="Mild vs. Non-Mild")

legend("bottomright", legend = c("VLR-UMI","VLR-CFI"), 
       col=c("red","blue"), lwd=4, inset=c(0,0),text.font= 2,cex=1.5, pch=1, pt.cex = 1)



## Thickness only ####
IBD_data$Thickness..LE10.<-as.double(IBD_data$Thickness..LE10.)
IBD_data$Project<-as.integer(IBD_data$Project)


glm.fit2=glm(IBD_data$Project~Thickness..LE10.,data = IBD_data,
            family=binomial(link="logit"))


summary(glm.fit2)

p2=predict(glm.fit2,type='response')

modelroc2=roc(IBD_data$Project,p2)

par(pty="s")
plot.roc(modelroc2, print.auc=TRUE,legacy.axes=TRUE,col=c("blue"),lwd=,cex.axis = 1.5,cex.lab = 1.5,cex.main= 1.5,cex.sub=1.5)
##title(main="Mild vs. Non-Mild")
legend("bottomright", 
       legend = c("Thickness"), 
       col=c("blue"), lwd=4, inset=c(0,0),text.font= 2,cex=1.5, pch=1, pt.cex = 1)


ci.auc(modelroc2)
## VLR + thickness only ####


glm.fit3=glm(IBD_data$Project~IBD_data$VLR..Our.method.UMI. + Thickness..LE10.,data = IBD_data,
             family=binomial(link="logit"))


summary(glm.fit3)

p3=predict(glm.fit3,type='response')

modelroc3=roc(IBD_data$Project,p3)

par(pty="s")
plot.roc(modelroc3, print.auc=TRUE,legacy.axes=TRUE,col=c("black"),lwd=4,cex.axis = 1.5,cex.lab = 1.5,cex.main= 1.5,cex.sub=1.5)


ci.auc(modelroc3)

### Plot all image


par(pty="s")
plot.roc(modelroc3, print.auc=FALSE,legacy.axes=TRUE,col=c("black"),lwd=4,cex.axis = 1.5,cex.lab = 1.5,cex.main= 1.5,cex.sub=1.5)
par(pty="s")
plot.roc(modelroc,  add=TRUE,print.auc=FALSE,legacy.axes=TRUE,col=c("red"),lwd=4,cex.axis = 1.5,cex.lab = 1.5,cex.main= 1.5,cex.sub=1.5)
par(pty="s")
plot.roc(modelroc2, add=TRUE,print.auc=FALSE,legacy.axes=TRUE,col=c("blue"),lwd=4,cex.axis = 1.5,cex.lab = 1.5,cex.main= 1.5,cex.sub=1.5)

##title(main="Mild vs. Non-Mild")

legend("bottomright", legend = c("VLR + Thickness","VLR","Thickness"), 
       col=c("black","red","blue"), lwd=4, inset=c(0,0),text.font= 2,cex=1.5, pch=1, pt.cex = 1)


