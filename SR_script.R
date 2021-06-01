############################################## Script for SR analyses  #######################################################

#Analyzes sexual receptiveness data (% copulated, copulation latency, copulation duration) for D. suzukii & D. biarmipes
#Runs ANOVA, Tukey post-hoc test

#################################################################################################################################################

######## Set-up ########

#set working directory
setwd("C:/Users/rclar/Dropbox/McRobert Lab/Suzukii Paper/D_suzukii_behav")
getwd()

remove(list = ls())

#load libraries
library(tidyverse)
library(RColorBrewer)

#read in data
SR_data <- read_csv("SR_TidyData.csv", col_names = TRUE)

#################################################################################################################################################

######## Cop proportion analyses ########

#chi-square for 3-5 day virgins
#does the proportion 3-5 day virgins that cop v. don't cop differ across species
#set up chi-square table
cop_virgin <- c(10,20) #count of 3-5 virgins that cop (D suzukii, D biarmipies)
nocop_virgin <- c(10,0) #count of 3-5 virgins that didn't cop
cop_cont_virgin <- data.frame(cop_virgin, nocop_virgin) #cat together
  rownames(cop_cont_virgin) <- c("D_suzukii", "D_biarmipes") #row names
  colnames(cop_cont_virgin) <- c("Y", "N") #column names
cop_chi_virgin <- chisq.test(cop_cont_virgin) #chi-square test

#chi-square for 1-day post-mating
#does the proportion 1-day post-mating females that cop v. don't cop differ across species
#set up chi-square table
cop_1day <- c(3,1) #count of 1-day post-mating females that cop (D suzukii, D biarmipies)
nocop_1day <- c(17,19) #count of 1-day post-mating females that don't cop
cop_cont_1day <- data.frame(cop_1day, nocop_1day)
  rownames(cop_cont_1day) <- c("D_suzukii", "D_biarmipes")
  colnames(cop_cont_1day) <- c("Y", "N")
cop_chi_1day <- chisq.test(cop_cont_1day) #chi-square test

#chi-square for 7-day post-mating
#does the proportion 7-day post-mating females that cop v. don't cop differ across species
#set up chi-square table
cop_7day <- c(2,2) #count of 7-day post-mating females that cop (D suzukii, D biarmipies)
nocop_7day <- c(18,18) #count of 7-day post-mating females that don't cop
cop_cont_7day <- data.frame(cop_7day, nocop_7day)
  rownames(cop_cont_7day) <- c("D_suzukii", "D_biarmipes")
  colnames(cop_cont_7day) <- c("Y", "N")
cop_chi_7day <- chisq.test(cop_cont_7day) #chi-square test
cop_ft_7day <- fisher.test(cop_cont_7day) #fisher's exact test (bc table values so small)

#chi-square for 14-day post-mating
#does the proportion 14-day post-mating females that cop v. don't cop differ across species
#set up chi-square table
cop_14day <- c(3,2) #count of 14-day post-mating females that cop (D suzukii, D biarmipes)
nocop_14day <- c(17,10) #count of 14-day post-mating females that don't cop
cop_cont_14day <- data.frame(cop_14day, nocop_14day)
  rownames(cop_cont_14day) <- c("D_suzukii", "D_biarmipes")
  colnames(cop_cont_14day) <- c("Y", "N")
cop_chi_14day <- chisq.test(cop_cont_14day) #chi-square test
cop_ft_7day <- fisher.test(cop_cont_14day) #fisher's exact test 

#chi-square for all D suzukii
#does the proportion of D suzkii females that cop v. don't cop differ across treatments
#set up chi-square table
cop_ds <- c(10, 3, 2, 3) #count of females that cop (3-5 day virgins, 1-day PM, 7-day PM, 14-day PM)
nocop_ds <- c(10, 17, 18, 17) #count of females that don't cop
cop_cont_ds <- data.frame(cop_ds, nocop_ds)
  rownames(cop_cont_ds) <- c("Virgin", "PM1", "PM7", "PM14")
  colnames(cop_cont_ds) <- c("Y", "N")
cop_chi_ds <- chisq.test(cop_cont_ds) #chi-square test
cop_ft_ds <- fisher.test(cop_cont_ds) #fisher's exact test

#chi-square for all D biarmipes
#does the proportion of D biarmipes females that cop v. don't cop differ across treatments
#set up chi-square table
cop_db <- c(20, 1, 2, 2) #count of females that cop (3-5 day virgins, 1-day PM, 7-day PM, 14-day PM)
nocop_db <- c(0, 19, 18, 10) #count of females that don't cop
cop_cont_db <- data.frame(cop_db, nocop_db)
  rownames(cop_cont_db) <- c("Virgin", "PM1", "PM7", "PM14")
  colnames(cop_cont_db) <- c("Y", "N")
cop_chi_db <- chisq.test(cop_cont_db) #chi-square test
cop_ft_db <- fisher.test(cop_cont_db) #fisher's exact test

#################################################################################################################################################

######## CL & CD analyses ########

#remove rows with no copulation event
SR_data_clean <- SR_data[which(SR_data$Cop=='Y'),]

#subset to each copulation status (virgin, 1-day PM, etc.)
SR_virgins <- SR_data_clean[which(SR_data_clean$Virgin=='Y'),]

#t-tests
CL_ttest <- t.test(Cop_Latency ~ Species, data = SR_virgins, var.equal = FALSE) #cop latency t-test
CD_ttest <- t.test(Cop_Duration ~ Species, data = SR_virgins, var.equal = FALSE) #cop duration t-test

######## mean, SDs & SEs ########

##### D suzukii virgins 3-5 days ####
DS <- SR_virgins[which(SR_virgins$Test=='DS_V3-5'),] #subset dataframe

#DS 3-5 days CL data
DS_CL_mean <- mean(DS$Cop_Latency) #calculate mean
DS_CL_SD <- sd(DS$Cop_Latency) #calculate SD
DS_CL_SE <- DS_CL_SD/sqrt(10) #calculate SE

#DS 3-5 days CD data
DS_CD_mean <- mean(DS$Cop_Duration)
DS_CD_SD <- sd(DS$Cop_Duration)
DS_CD_SE <- DS_CD_SD/sqrt(10)

#### D biarmipes virgins 3-5 days ####
DB <- SR_virgins[which(SR_virgins$Test=='DB_V3-5'),] #subset dataframe

#DB 3-5 days CL data
DB_CL_mean <- mean(DB$Cop_Latency)
DB_CL_SD <- sd(DB$Cop_Latency)
DB_CL_SE <- DB_CL_SD/sqrt(20)

#DB 3-5 days CD data
DB_CD_mean <- mean(DB$Cop_Duration)
DB_CD_SD <- sd(DB$Cop_Duration)
DB_CD_SE <- DB_CD_SD/sqrt(20)

#### summarize results ####
#create vectors with means, SDs, etc.
Mean <- c(DS_CL_mean, DB_CL_mean, DS_CD_mean, DB_CD_mean) #pull means into one vector
SD <- c(DS_CL_SD, DB_CL_SD, DS_CD_SD, DB_CD_SD) #pulls SDs into one vector
SE <- c(DS_CL_SE, DB_CL_SE, DS_CD_SE, DB_CD_SE) #pulls SEs into one vector
Species <- c("D. suzukii", "D. biarmipes", "D. suzukii", "D. biarmipes")
Stat <- c("Cop. Latency", "Cop. Latency", "Cop. Duration", "Cop. Duration")

#cat vectors into one dataframe
SR_sum <- data.frame(Species, Stat, Mean, SD, SE)

#################################################################################################################################################

######## Visualize data ########

#assign bar width
bar_width <- 0.7

#### SR plot ####
#assign bar positions
SR_sum$center <- c(1.65, 1.65, 4.35, 4.35) #set breaks on x-axis (set so that consistent break between each "group" of bars)
SR_sum$pos <- c(1.3, 2, 4, 4.7) #set position of each bar

#SR bar plot
SRplot <- ggplot(data = SR_sum, aes(x= pos, y = Mean, fill = Species)) + 
  geom_col(position = "dodge", size = 0.3, width = bar_width) + 
  geom_errorbar(aes(ymin = Mean - SE, ymax = Mean + SE), width = 0.3)
SRplot_annotated <- SRplot + labs(y = "Mean (seconds)") + theme_bw() + 
  scale_x_continuous(breaks = SR_sum$center, labels = SR_sum$Stat) + 
  scale_y_continuous(expand = c(0,0)) + scale_fill_manual(values = c("gray30", "gray80")) + labs(tag = "3") + 
  theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        axis.line = element_line(size = 1), axis.ticks = element_line(color = "black", size = 1),
        axis.text = element_text(size = 14, color = "black"), axis.text.x = element_text(size = 14, face = "bold"), 
        axis.title = element_text(size = 14, face = "bold"), axis.title.x = element_blank(), 
        legend.position = "top", legend.text = element_text(size = 14, face = "italic"), 
        legend.title = element_blank(), plot.tag = element_text(size = 24, color = "black", face = "bold"))
SRplot_annotated

#save as eps file for publication
ggsave("SR.eps", plot = SRplot_annotated, width = 110, height = 120, units = "mm")
