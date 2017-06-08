## Anazlyze Macroinvertebrate Community Data for Hess Samples in Augusta Creek

##Load Packages
library(vegan)
library(ggplot2)

##Upload file
Hess_Data<-read.csv("/Users/katiekierczynski/Desktop/URP_2016_EAB/SFS/AugustaCkHessMacros.csv")
LM_Data<-read.csv("/Users/katiekierczynski/Desktop/URP_2016_EAB/SFS/AugustaCkLMMacros.csv")
#LM_Data<-LM_Data[c(1:11,13:26,28:29),]
LM_Data<-subset(LM_Data, Total>0)
## Remove everything except macros
Hess_Macros<-Hess_Data[,c(6:40)]
row.names(Hess_Macros)<-c("A1","A2","A3","A4","A5","B1","B2","B3","B4","B5","C1","C2","C3","C4","C5","D1","D2","D3","D4","D5","E1","E2","E3","E4","E5","F1","F2","F3","F4","F5")
#colnames(Hess_Macros)<-c(1:35)

LM_Macros<-LM_Data[,c(6:30)]
#LM_Macros<-LM_Data[c(1:11,13:26,28:29),c(6:30)]
#row.names(LM_Macros)<-c("A1","A2","A3","A4","A5","B1","B2","B3","B4","B5","C1","C2","C3","C4","C5","D1","D2","D3","D4","D5","E1","E2","E3","E4","E5","F1","F2","F3","F4","F5")
row.names(LM_Macros)<-c("A1","A2","A3","A4","A5","B1","B2","B3","B4","B5","C1","C3","C4","C5","D1","D2","D3","D4","D5","E1","E2","E3","E4","E5","F1","F3","F4")
#colnames(LM_Macros)<-c(1:35)

## Separate Site Data
Hess_Site<-Hess_Data[,c(1:4)]
LM_Site<-LM_Data[,c(1:4)]
#LM_Site<-LM_Data[c(1:11,13:26,28:29),c(1:4)]

## Separate Pre-trial data
Hess_Data_Pre<-Hess_Data[c(1,2,6,7,11,12,16,17,21,22,26,27),]
Hess_Macros_Pre<-Hess_Data_Pre[,c(6:40)]
row.names(Hess_Macros_Pre)<-c("A1","A2","B1","B2","C1","C2","D1","D2","E1","E2","F1","F2")
##colnames(Hess_Macros_Pre)<-c(1:35)

#LM_Data_Pre<-LM_Data[c(1,2,6,7,11,12,16,17,21,22,26,27),]
LM_Data_Pre<-LM_Data[c(1,2,6,7,11,16,17,21,22,26),]
LM_Macros_Pre<-LM_Data_Pre[,c(6:30)]
#ow.names(LM_Macros_Pre)<-c("A1","A2","B1","B2","C1","C2","D1","D2","E1","E2","F1","F2")
row.names(LM_Macros_Pre)<-c("A1","A2","B1","B2","C1","D1","D2","E1","E2","F1")
##colnames(LM_Macros_Pre)<_c(1:29)

## Separate Post-trial data
Hess_Data_Post<-Hess_Data[c(3:5,8:10,13:15,18:20,23:25,28:30),]
Hess_Macros_Post<-Hess_Data_Post[,c(6:40)]
row.names(Hess_Macros_Post)<-c("A3","A4","A5","B3","B4","B5","C3","C4","C5","D3","D4","D5","E3","E4","E5","F3","F4","F5")
##colnames(Hess_Macros_Post)<-c(1:35)

#LM_Data_Post<-LM_Data[c(3:5,8:10,13:15,18:20,23:25,28:30),]
LM_Data_Post<-subset(LM_Data, Date=="30"|Date=="13"|Date=="4")
LM_Macros_Post<-LM_Data_Post[,c(6:30)]
row.names(LM_Macros_Post)<-c("A3","A4","A5","B3","B4","B5","C3","C4","C5","D3","D4","D5","E3","E4","E5","F3","F4")
#row.names(LM_Macros_Post)<-c("A3","A4","A5","B3","B4","B5","C3","C4","C5","D3","D4","D5","E3","E4","E5","F3","F4","F5")
##colnames(LM_Macros_Post)<-c(1:29)

## Matrix combining colnames with taxa
#taxa<-colnames(Hess_Data[6:40])
#taxa
#colheader<-c(1:35)
#colheader
#taxanames<-paste(taxa,colheader)
#taxanames

## Set up factor for for Control vs Treatment (Vine vs VineRemoved) for all samples
levels(Hess_Data$Treatment)
stream_site=factor(Hess_Data$Treatment)
stream_site

levels(LM_Data$Treatment)
stream_site_LM=factor(LM_Data$Treatment)
stream_site_LM

## Set up factor for for Control vs Treatment (Vine vs VineRemoved) for Pre-treatment data
levels(Hess_Data_Pre$Treatment)
stream_site_Pre=factor(Hess_Data_Pre$Treatment)
stream_site_Pre

levels(LM_Data_Pre$Treatment)
stream_site_LM_Pre=factor(LM_Data_Pre$Treatment)
stream_site_LM_Pre

## Set up factor for for Control vs Treatment (Vine vs VineRemoved) for Post-treatment data
levels(Hess_Data_Post$Treatment)
stream_site_Post=factor(Hess_Data_Post$Treatment)
stream_site_Post

levels(LM_Data_Post$Treatment)
stream_site_LM_Post=factor(LM_Data_Post$Treatment)
stream_site_LM_Post

#Permanova for stream_site Treatment vs. Control
#adonis(Hess_Macros ~ stream_site, data=Hess_Site, permutations=999)

adonis(LM_Macros ~ stream_site_LM, data= LM_Site, permutations = 999)


## Check for interaction with Date
#adonis(Hess_Macros~stream_site*Hess_Site$Date,data=Hess_Site,permutations = 999)

adonis(LM_Macros~stream_site_LM*LM_Site$Date,data=LM_Site,permutations = 999)
##Permanova with Date as covariate
#adonis(Hess_Macros~Hess_Site$Date,data=Hess_Site,permutations = 999)

adonis(LM_Macros~LM_Site$Date,data=LM_Site,permutations = 999)
## Check for interaction with Date
#adonis(Hess_Macros~Hess_Site$Date*stream_site,data=Hess_Site,permutations = 999)

adonis(LM_Macros~LM_Site$Date*stream_site_LM,data=LM_Site,permutations = 999)

##
LM_Site$Date<-as.factor(LM_Site$Date)
LM_Macros<-as.matrix(LM_Macros)
adonis(LM_Macros~Date*Treatment*Site,data = LM_Site,permutations=999)
str(LM_Site)

#### Courtney's Help
#upload table
LM_Data<-read.csv("/Users/katiekierczynski/Desktop/URP_2016_EAB/SFS/AugustaCkLMMacros.csv")
LM_Data_sub<-subset(LM_Data, Total>0 & Date==30 | Total>0 & Date==13 | Total>0 & Date==4)
#Split into environmental variables and community data
LM_Com_sub<-LM_Data_sub[,6:ncol(LM_Data_sub)]
str(LM_Com_sub)
LM_Env_sub<-LM_Data_sub[,1:5]
LM_Env_sub$Date<-as.factor(LM_Env_sub$Date)
str(LM_Env)

#permanova
adonis(LM_Com_sub~Date*Treatment, data=LM_Env_sub, permutations=999, method="bray")

