##Upload file
All_Insects<-read.csv("/Users/katiekierczynski/Desktop/URP_2016_EAB/SFS/InvertSamples_All.csv")

## Remove everything except macros
All_Macros<-All_Insects[,c(5:67)]
row.names(All_Macros)<-c("HA1","HA2","HA3","HA4","HA5","HB1","HB2","HB3","HB4","HB5","HC1",
                         "HC2","HC3","HC4","HC5","HD1","HD2","HD3","HD4","HD5","HE1","HE2",
                         "HE3","HE4","HE5","HF1","HF2","HF3","HF4","HF5","LMA1","LMA2","LMA3",
                         "LMA4","LMA5","LMB1","LMB2","LMB3","LMB4","LMB5","LMC1","LMC2","LMC3",
                         "LMC4","LMC5","LMD1","LMD2","LMD3","LMD4","LMD5","LME1","LME2","LME3",
                         "LME4","LME5","LMF1","LMF2","LMF3","LMF4","LMF5")
#colnames(Hess_Macros)<-c(1:35)


## Separate Pre-trial data
All_Data_Pre<-All_Insects[c(1,2,6,7,11,12,16,17,21,22,26,27,31,32,36,37,41,42,46,47,51,52,56,57),]
All_Macros_Pre<-All_Data_Pre[,c(5:67)]
row.names(All_Macros_Pre)<-c("HA1","HA2","HB1","HB2","HC1","HC2","HD1","HD2","HE1","HE2","HF1",
                             "HF2","LMA1","LMA2","LMB1","LMB2","LMC1","LMC2","LMD1","LMD2","LME1",
                             "LME2","LMF1","LMF2")
#colnames(Hess_Macros_Pre)<-c(1:35)

## Separate Post-trial data
All_Data_Post<-All_Insects[c(3:5,8:10,13:15,18:20,23:25,28:30,33:35,38:40,43:45,48:50,53:55,58:60),]
All_Macros_Post<-All_Data_Post[,c(5:67)]
row.names(All_Macros_Post)<-c("HA3","HA4","HA5","HB3","HB4","HB5","HC3","HC4","HC5","HD3","HD4",
                               "HD5","HE3","HE4","HE5","HF3","HF4","HF5","LMA3","LMA4","LMA5","LMB3",
                               "LMB4","LMB5","LMC3","LMC4","LMC5","LMD3","LMD4","LMD5","LME3","LME4",
                               "LME5","LMF3","LMF4","LMF5")
#colnames(Hess_Macros_Post)<-c(1:35)

## Matrix combining colnames with taxa
#taxa<-colnames(Hess_Data[6:40])
#taxa
#colheader<-c(1:35)
#colheader
#taxanames<-paste(taxa,colheader)
#taxanames

All_Macros_Pre_Matrix<-data.matrix(All_Macros_Pre)
All_Macros_Post_Matrix<-data.matrix(All_Macros_Post)

Pre_community_heatmap<-heatmap(All_Macros_Pre_Matrix,Rowv = NA,Colv = NA,col=cm.colors(256),
                               scale = "column")
Post_community_heatmap<-heatmap(All_Macros_Post_Matrix,Rowv = NA,Colv = NA,col=cm.colors(256),
                               scale = "column")
