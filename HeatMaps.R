library(RColorBrewer)
##Upload file
All_Insects<-read.csv("/Users/katiekierczynski/Desktop/URP_2016_EAB/SFS/InvertSamples_All_V2.csv")

## Remove everything except macros
All_Macros<-All_Insects[c(4:45),]
colnames(All_Macros)<-c("","HA1","LMA1","HA2","LMA2","HA3","LMA3","HA4","LMA4","HA5","LMA5","HB1",
                        "LMB1","HB2","LMB2","HB3","LMB3","HB4","LMB4","HB5","LMB5","HC1","LMC1",
                        "HC2","LMC2","HC3","LMC3","HC4","LMC4","HC5","LMC5","HD1","LMD1","HD2",
                        "LMD2","HD3","LMD3","HD4","LMD4","HD5","LMD5","HE1","LME1","HE2","LME2",
                        "HE3","LME3","HE4","LME4","HE5","LME5","HF1","LMF1","HF2","LMF2","HF3",
                        "LMF3","HF4","LMF4","HF5","LMF5")



## Separate Pre-trial data
All_Data_Pre<-All_Insects[,c(1:5,12:15,22:25,32:35,42:45,52:55)]
All_Macros_Pre<-All_Data_Pre[c(4:45),]
colnames(All_Macros_Pre)<-c("","HA1","LMA1","HA2","LMA2","HB1","LMB1","HB2","LMB2","HC1","LMC1",
                            "HC2","LMC2","HD1","LMD1","HD2","LMD2","HE1","LME1","HE2","LME2",
                            "HF1","LMF1","HF2","LMF2")
row.names(All_Macros_Pre)<-All_Macros_Pre$""
All_Macros_Pre<-All_Macros_Pre[,2:25]


## Separate Post-trial data
All_Data_Post<-All_Insects[,c(1,6:11,16:21,26:31,36:41,46:51,56:61)]
All_Macros_Post<-All_Data_Post[c(4:45),]
colnames(All_Macros_Post)<-c("","HA3","LMA3","HA4","LMA4","HA5","LMA5","HB3","LMB3","HB4","LMB4",
                             "HB5","LMB5","HC3","LMC3","HC4","LMC4","HC5","LMC5","HD3","LMD3","HD4",
                             "LMD4","HD5","LMD5","HE3","LME3","HE4","LME4","HE5","LME5","HF3",
                             "LMF3","HF4","LMF4","HF5","LMF5")
row.names(All_Macros_Post)<-All_Macros_Post$""
All_Macros_Post<-All_Macros_Post[,2:37]


All_Macros_Pre_Matrix<-data.matrix(All_Macros_Pre)
All_Macros_Post_Matrix<-data.matrix(All_Macros_Post)

Pre_community_heatmap<-heatmap(All_Macros_Pre_Matrix,Rowv = NA,Colv = NA,col=cm.colors(256),
                               scale = "column",main = "Pre-Treatment Heatmap")
Post_community_heatmap<-heatmap(All_Macros_Post_Matrix,Rowv = NA,Colv = NA,col=cm.colors(256),
                               scale = "column",main = "Post-Treatment Heatmap")





