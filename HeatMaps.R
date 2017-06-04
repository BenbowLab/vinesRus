library(RColorBrewer)
##Upload file
All_Insects<-read.csv("/Users/katiekierczynski/Desktop/URP_2016_EAB/SFS/InvertSamples_All_V2.csv")
Hess_Insects<-read.csv("/Users/katiekierczynski/Desktop/URP_2016_EAB/SFS/InvertSamples_Hess.csv")
LM_Insects<-read.csv("/Users/katiekierczynski/Desktop/URP_2016_EAB/SFS/InvertSamples_LM.csv")


## Remove everything except macros
All_Macros<-All_Insects[c(4:45),]
colnames(All_Macros)<-c("","HA1","LMA1","HA2","LMA2","HA3","LMA3","HA4","LMA4","HA5","LMA5","HB1",
                        "LMB1","HB2","LMB2","HB3","LMB3","HB4","LMB4","HB5","LMB5","HC1","LMC1",
                        "HC2","LMC2","HC3","LMC3","HC4","LMC4","HC5","LMC5","HD1","LMD1","HD2",
                        "LMD2","HD3","LMD3","HD4","LMD4","HD5","LMD5","HE1","LME1","HE2","LME2",
                        "HE3","LME3","HE4","LME4","HE5","LME5","HF1","LMF1","HF2","LMF2","HF3",
                        "LMF3","HF4","LMF4","HF5","LMF5")

Hess_Macros<-Hess_Insects[c(4:45),]
colnames(Hess_Macros)<-c("","A1","A2","A3","A4","A5","B1","B2","B3","B4","B5","C1",
                         "C2","C3","C4","C5","D1","D2","D3","D4","D5","E1","E2",
                         "E3","E4","E5","F1","F2","F3","F4","F5")

LM_Macros<-LM_Insects[c(4:45),]
colnames(LM_Macros)<-c("","A1","A2","A3","A4","A5","B1","B2","B3","B4","B5","C1",
                       "C2","C3","C4","C5","D1","D2","D3","D4","D5","E1","E2",
                       "E3","E4","E5","F1","F2","F3","F4","F5")
  

## Separate Pre-trial data
All_Data_Pre<-All_Insects[,c(1:5,12:15,22:25,32:35,42:45,52:55)]
All_Macros_Pre<-All_Data_Pre[c(4:45),]
colnames(All_Macros_Pre)<-c("","HA1","LMA1","HA2","LMA2","HB1","LMB1","HB2","LMB2","HC1","LMC1",
                            "HC2","LMC2","HD1","LMD1","HD2","LMD2","HE1","LME1","HE2","LME2",
                            "HF1","LMF1","HF2","LMF2")
row.names(All_Macros_Pre)<-All_Macros_Pre$""
All_Macros_Pre<-All_Macros_Pre[,2:25]

Hess_Macros_Pre<-Hess_Macros[,c(1:3,7:8,12:13,17:18,22:23,27:28)]
colnames(Hess_Macros_Pre)<-c("","A1","A2","B1","B2","C1","C2","D1","D2","E1","E2","F1","F2")
row.names(Hess_Macros_Pre)<-Hess_Macros_Pre$""
Hess_Macros_Pre<-Hess_Macros_Pre[,2:13]

LM_Macros_Pre<-LM_Macros[,c(1:3,7:8,12:13,17:18,22:23,27:28)]
colnames(LM_Macros_Pre)<-c("","A1","A2","B1","B2","C1","C2","D1","D2","E1","E2","F1","F2")
row.names(LM_Macros_Pre)<-LM_Macros_Pre$""
LM_Macros_Pre<-LM_Macros_Pre[,2:13]

## Separate control sites
LM_Control_Pre<-LM_Macros_Pre[,c(1:2,5:8)]
##Separate Treated Sites
LM_Treat_Pre<-LM_Macros_Pre[,c(3:4,9:12)]


## Separate Post-trial data
All_Data_Post<-All_Insects[,c(1,6:11,16:21,26:31,36:41,46:51,56:61)]
All_Macros_Post<-All_Data_Post[c(4:45),]
colnames(All_Macros_Post)<-c("","HA3","LMA3","HA4","LMA4","HA5","LMA5","HB3","LMB3","HB4","LMB4",
                             "HB5","LMB5","HC3","LMC3","HC4","LMC4","HC5","LMC5","HD3","LMD3","HD4",
                             "LMD4","HD5","LMD5","HE3","LME3","HE4","LME4","HE5","LME5","HF3",
                             "LMF3","HF4","LMF4","HF5","LMF5")
row.names(All_Macros_Post)<-All_Macros_Post$""
All_Macros_Post<-All_Macros_Post[,2:37]

Hess_Macros_Post<-Hess_Macros[,c(1,4:6,9:11,14:16,19:21,24:26,29:31)]
colnames(Hess_Macros_Post)<-c("","A3","A4","A5","B3","B4","B5","C3","C4","C5","D3","D4","D5","E3",
                              "E4","E5","F3","F4","F5")
row.names(Hess_Macros_Post)<-Hess_Macros_Post$""
Hess_Macros_Post<-Hess_Macros_Post[,2:19]

LM_Macros_Post<-LM_Macros[,c(1,4:6,9:11,14:16,19:21,24:26,29:31)]
colnames(LM_Macros_Post)<-c("","A3","A4","A5","B3","B4","B5","C3","C4","C5","D3","D4","D5","E3",
                              "E4","E5","F3","F4","F5")
row.names(LM_Macros_Post)<-LM_Macros_Post$""
LM_Macros_Post<-LM_Macros_Post[,2:19]

## Separate control sites
LM_Control_Post<-LM_Macros_Post[,c(1:3,7:12)]
## Separate treated sites
LM_Treat_Post<-LM_Macros_Post[,c(4:6,13:18)]


## Create matrices
All_Macros_Pre_Matrix<-data.matrix(All_Macros_Pre)
All_Macros_Post_Matrix<-data.matrix(All_Macros_Post)
Hess_Macros_Pre_Matrix<-data.matrix(Hess_Macros_Pre)
Hess_Macros_Post_Matrix<-data.matrix(Hess_Macros_Post)
LM_Macros_Pre_Matrix<-data.matrix(LM_Macros_Pre)
LM_Macros_Post_Matrix<-data.matrix(LM_Macros_Post)
LM_Control_Pre_Matrix<-data.matrix(LM_Control_Pre)
LM_Control_Post_Matrix<-data.matrix(LM_Control_Post)
LM_Treat_Pre_Matrix<-data.matrix(LM_Treat_Pre)
LM_Treat_Post_Matrix<-data.matrix(LM_Treat_Post)

## create heatmaps
Pre_community_heatmap<-heatmap(All_Macros_Pre_Matrix,Rowv = NA,Colv = NA,col=cm.colors(256),
                               scale = "column",main = "Pre-Treatment Heatmap")
Post_community_heatmap<-heatmap(All_Macros_Post_Matrix,Rowv = NA,Colv = NA,col=cm.colors(256),
                               scale = "column",main = "Post-Treatment Heatmap")

Pre_Hess_Heatmap<-heatmap(Hess_Macros_Pre_Matrix,Rowv = NA,Colv = NA,col=cm.colors(256),
                          scale="column",main = "Pre-Treatment Benthos Community Heatmap")
Post_Hess_Heatmap<-heatmap(Hess_Macros_Post_Matrix,Rowv = NA,Colv = NA,col=cm.colors(256),
                           scale="column",main="Post-Treatment Benthos Community Heatmap")

Pre_LM_Heatmap<-heatmap(LM_Macros_Pre_Matrix,Rowv = NA,Colv = NA,col=cm.colors(256),
                        scale="column",main = "Pre-Treatment Log Community Heatmap")
Post_LM_Heatmap<-heatmap(LM_Macros_Post_Matrix,Rowv = NA,Colv = NA,col=cm.colors(256),
                         scale="column",main="Post-Treatment Log Community Heatmap")

Control_Pre_LM_Heatmap<-heatmap(LM_Control_Pre_Matrix,Rowv = NA,Colv = NA,col=cm.colors(256),
                                scale="column",main = "Pre-Treatment Control Log Community Heatmap")
Treat_Pre_LM_Heatmap<-heatmap(LM_Treat_Pre_Matrix,Rowv = NA, Colv = NA, col=cm.colors(256),
                              scale="column",main="Pre-Treatment Treated Log Community Heatmap")
Control_Post_LM_Heatmap<-heatmap(LM_Control_Post_Matrix,Rowv = NA,Colv = NA,col=cm.colors(256),
                                 scale="column",main="Post-Treatment Control Log Community Heatmap")
Treat_Post_LM_Heatmpa<-heatmap(LM_Treat_Post_Matrix,Rowv = NA,Colv = NA,col=cm.colors(256),
                               scale="column", main="Post-Treatment Treated Log Community Heatmap")
