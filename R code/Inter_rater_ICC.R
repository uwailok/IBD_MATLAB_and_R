

setwd('H:/Mayo_documents/Journal_paper/Lok_IBD_pathology/R_test')



library(ggplot2)

dev.off()


##install.packages("ICC")

install.packages("readxl")  ### reads excel
install.packages("psych")  ### does a lot of psychometrics 
install.packages("BlandAltmanLeh")### does a bland altman plot

###############pull packages out of the library


library(readxl)
library(psych)
library(BlandAltmanLeh)


## Montreal classification ###

raw_data <- read.csv('Two_sonographer_results.csv',header = T)

cor.test(raw_data$Sonographer1 ,raw_data$Sonoagrapher2  )


ICC(raw_data,missing=TRUE,alpha=.01,lmer=TRUE,check.keys=FALSE)

bland.altman.plot(raw_data$Sonographer1, raw_data$Sonoagrapher2, main="Test", xlab="Means", ylab="Differences")


HF_plot1 <- bland.altman.plot(raw_data$Sonographer1, raw_data$Sonoagrapher2, graph.sys="ggplot2", mode=1)
HF_plot1$layers[[2]]$aes_params$colour <- c('red', 'blue', 'red')

print(HF_plot1 + ggtitle("Bland-Altman-Plot for VLR between two sonographers")+
        theme(plot.title = element_text(size=15, face= "bold", 
                                        hjust = 0.5))+
        labs(x="Means of VLR between two sonographers",
             y ="Differences of VLR between two sonographers")+
        theme(axis.title.x = element_text(size= 12, face= "bold", ,hjust = 0.5))+
        theme(axis.title.y = element_text(size= 12, face= "bold", hjust = 0.5, 
                                          lineheight= 1)))

