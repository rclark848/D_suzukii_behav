############################################## Script for EL analyses  #######################################################

#Analyzes offspring production data for D. suzukii & D. biarmipes
#Runs ANOVA, Tukey post-hoc test

#################################################################################################################################################

######## Set-up ########

#set working directory
setwd("C:/Users/rclar/Dropbox/McRobert Lab/Suzukii Paper/D_suzukii_behav")
getwd()

remove(list = ls())

#load libraries
library(tidyverse) #v.2.0.0

#read in data
EL_data <- read_csv("EL_TidyData.csv", col_names = TRUE)

#################################################################################################################################################

######## Format data ########

#remove rows with NA
EL_data_clean <- EL_data[which(EL_data$Total_Offspring!='NA'),]

#subset data by weeks
EL_W1 <- EL_data_clean[which(EL_data_clean$Week==1),] #offspring count for week 1
EL_W2 <- EL_data_clean[which(EL_data_clean$Week==2),] #offspring count for week 2
EL_Total <- EL_data_clean[which(EL_data_clean$Week=='Total'),] #total offspring count (Week 1 + Week 2)

#################################################################################################################################################

######## T-test ########

#t-test to see if offspring count differs by species
W1_ttest <- t.test(Total_Offspring ~ Species, data = EL_W1, var.equal = FALSE)
W2_ttest <- t.test(Total_Offspring ~ Species, data = EL_W2, var.equal = FALSE)
Total_ttest <- t.test(Total_Offspring ~ Species, data = EL_Total, var.equal = FALSE)

#################################################################################################################################################

######## D suzukii analyses ########

#### means, SD & SE #####
#week 1 offspring count
DS_EL_W1 <- EL_W1[which(EL_W1$Species=='Drosophila_suzukii'),] #subset dataframe
DS_EL_W1_mean <- mean(DS_EL_W1$Total_Offspring) #calculate mean
DS_EL_W1_SD <- sd(DS_EL_W1$Total_Offspring) #calculate SD
DS_EL_W1_SE <- DS_EL_W1_SD/sqrt(22) #calculate SE

#week 2 offspring count
DS_EL_W2 <- EL_W2[which(EL_W2$Species=='Drosophila_suzukii'),]
DS_EL_W2_mean <- mean(DS_EL_W2$Total_Offspring)
DS_EL_W2_SD <- sd(DS_EL_W2$Total_Offspring)
DS_EL_W2_SE <- DS_EL_W2_SD/sqrt(16)

#total offspring count
DS_EL_Total <- EL_Total[which(EL_Total$Species=='Drosophila_suzukii'),]
DS_EL_Total_mean <- mean(DS_EL_Total$Total_Offspring)
DS_EL_Total_SD <- sd(DS_EL_Total$Total_Offspring)
DS_EL_Total_SE <- DS_EL_Total_SD/sqrt(16)

#### summarize results ####
#create vectors with means, SDs, etc.
DS_EL_mean <- c(DS_EL_W1_mean, DS_EL_W2_mean, DS_EL_Total_mean) #pull means into one vector
DS_EL_SD <- c(DS_EL_W1_SD, DS_EL_W2_SD, DS_EL_Total_SD) #pull SDs into one vector
DS_EL_SE <- c(DS_EL_W1_SE, DS_EL_W2_SE, DS_EL_Total_SE) #pull SEs into one vector

#cat vectors into one datafrmae
DS_EL_sum <- data.frame(DS_EL_mean, DS_EL_SD, DS_EL_SE)
  rownames(DS_EL_sum) <- c("DS_W1", "DS_W2", "DS_Total")

#################################################################################################################################################

######## D biarmipes analyses ########

#### means, SD & SE #####
#week 1 offspring count
DB_EL_W1 <- EL_W1[which(EL_W1$Species=='Drosophila_biarmipes'),] #subset dataframe
DB_EL_W1_mean <- mean(DB_EL_W1$Total_Offspring) #calculate mean
DB_EL_W1_SD <- sd(DB_EL_W1$Total_Offspring) #calculate SD
DB_EL_W1_SE <- DB_EL_W1_SD/sqrt(24) #calculate SE

#week 2 offspring count
DB_EL_W2 <- EL_W2[which(EL_W2$Species=='Drosophila_biarmipes'),]
DB_EL_W2_mean <- mean(DB_EL_W2$Total_Offspring)
DB_EL_W2_SD <- sd(DB_EL_W2$Total_Offspring)
DB_EL_W2_SE <- DB_EL_W2_SD/sqrt(21)

#total offspring count
DB_EL_Total <- EL_Total[which(EL_Total$Species=='Drosophila_biarmipes'),]
DB_EL_Total_mean <- mean(DB_EL_Total$Total_Offspring)
DB_EL_Total_SD <- sd(DB_EL_Total$Total_Offspring)
DB_EL_Total_SE <- DB_EL_Total_SD/sqrt(20)

#### summarize results ####
#create vectors with means, SDs, etc.
DB_EL_mean <- c(DB_EL_W1_mean, DB_EL_W2_mean, DB_EL_Total_mean) #pull means into one vector
DB_EL_SD <- c(DB_EL_W1_SD, DB_EL_W2_SD, DB_EL_Total_SD) #pull SDs into one vector
DB_EL_SE <- c(DB_EL_W1_SE, DB_EL_W2_SE, DB_EL_Total_SE) #pull SEs into one vector

#cat vectors into one datafrmae
DB_EL_sum <- data.frame(DB_EL_mean, DB_EL_SD, DB_EL_SE)
rownames(DB_EL_sum) <- c("DB_W1", "DB_W2", "DB_Total")
