############################################## Script for SA analyses  #######################################################

#Analyzes sexual attractiveness data for D. suzukii & D. biarmipes
#Runs ANOVA, Tukey post-hoc test

#################################################################################################################################################

######## Set-up ########

#set working directory
setwd("C:/Users/rclar/Dropbox/McRobert Lab/Suzukii Paper/D_suzukii_behav")
getwd()

remove(list = ls())

#load libraries
library(tidyverse) #v.2.0.0
library(RColorBrewer) #v.1.1.3

#read in data
SA_data <- read_csv("SA_TidyData.csv", col_names = TRUE)

#################################################################################################################################################

######## Format data ########

#remove NAs
SA_data_clean <- SA_data[which(SA_data$Courtship_Index_arcsine!='NA'),]

#subset to each species
DS <- SA_data_clean[which(SA_data_clean$Species=='Drosophila_suzukii'),]
DB <- SA_data_clean[which(SA_data_clean$Species=='Drosophila_biarmipes'),]

#################################################################################################################################################

######## D suzukii analyses ########

#### anova ####
DS_SA_anova <- aov(Courtship_Index_arcsine ~ Test, data = DS)
DS_SA_Tukey <- TukeyHSD(DS_SA_anova)

#### means, SD & SE #####
#virgins 3-5 days w/out blueberry
DS_V35_NBB <- DS[which(DS$Test=='DS_V3-5_NBB'),] #subset dataframe
DS_V35_NBB_mean <- mean(DS_V35_NBB$`Courtship_Index_%`) #calculate mean
DS_V35_NBB_SD <- sd(DS_V35_NBB$`Courtship_Index_%`) #calculate SD
DS_V35_NBB_SE <- DS_V35_NBB_SD/sqrt(20) #calculate SE

#virgins 10-12 days w/out blueberry
DS_V1012_NBB <- DS[which(DS$Test=='DS_V10-12_NBB'),]
DS_V1012_NBB_mean <- mean(DS_V1012_NBB$`Courtship_Index_%`)
DS_V1012_NBB_SD <- sd(DS_V1012_NBB$`Courtship_Index_%`)
DS_V1012_NBB_SE <- DS_V1012_NBB_SD/sqrt(20)

#virgins 3-5 days w/blueberry
DS_V35_BB <- DS[which(DS$Test=='DS_V3-5_BB'),]
DS_V35_BB_mean <- mean(DS_V35_BB$`Courtship_Index_%`)
DS_V35_BB_SD <- sd(DS_V35_BB$`Courtship_Index_%`)
DS_V35_BB_SE <- DS_V35_BB_SD/sqrt(20)

#virgins 10-12 days w/blueberry
DS_V1012_BB <- DS[which(DS$Test=='DS_V10-12_BB'),]
DS_V1012_BB_mean <- mean(DS_V1012_BB$`Courtship_Index_%`)
DS_V1012_BB_SD <- sd(DS_V1012_BB$`Courtship_Index_%`)
DS_V1012_BB_SE <- DS_V1012_BB_SD/sqrt(20)

#mated 1-hr post-mating w/blueberry (females 3-5 days old)
DS_PM1_BB <- DS[which(DS$Test=='DS_PM1_BB'),]
DS_PM1_BB_mean <- mean(DS_PM1_BB$`Courtship_Index_%`)
DS_PM1_BB_SD <- sd(DS_PM1_BB$`Courtship_Index_%`)
DS_PM1_BB_SE <- DS_PM1_BB_SD/sqrt(20)

#mated 1-day post-mating w/blueberry (females 4-6 days old)
DS_PM24_BB <- DS[which(DS$Test=='DS_PM24_BB'),]
DS_PM24_BB_mean <- mean(DS_PM24_BB$`Courtship_Index_%`)
DS_PM24_BB_SD <- sd(DS_PM24_BB$`Courtship_Index_%`)
DS_PM24_BB_SE <- DS_PM24_BB_SD/sqrt(20)

#mated 7 days post-mating w/blueberry (females 10-12 days old)
DS_PM168_BB <- DS[which(DS$Test=='DS_PM168_BB'),]
DS_PM168_BB_mean <- mean(DS_PM168_BB$`Courtship_Index_%`)
DS_PM168_BB_SD <- sd(DS_PM168_BB$`Courtship_Index_%`)
DS_PM168_BB_SE <- DS_PM168_BB_SD/sqrt(20)

#### summarize results ####
#create vectors with means, SDs, etc.
DS_mean <- c(DS_V35_NBB_mean, DS_V35_BB_mean, DS_PM1_BB_mean, DS_PM24_BB_mean, 
             DS_V1012_NBB_mean, DS_V1012_BB_mean, DS_PM168_BB_mean) #pull means into one vector
DS_SD <- c(DS_V35_NBB_SD, DS_V35_BB_SD, DS_PM1_BB_SD, DS_PM24_BB_SD, DS_V1012_NBB_SD, 
           DS_V1012_BB_SD, DS_PM168_BB_SD) #pull SDs into one vector
DS_SE <- c(DS_V35_NBB_SE, DS_V35_BB_SE, DS_PM1_BB_SE, DS_PM24_BB_SE, DS_V1012_NBB_SE, 
           DS_V1012_BB_SE, DS_PM168_BB_SE) #pull SEs into one vector
Time_Point <- c("HR 0", "HR 0", "HR 1", "Day 1", "Day 7", "Day 7", "Day 7")
Status <- c("Virgin", "Virgin w/BB", "Mated", "Mated", "Virgin", "Virgin w/BB", "Mated") #order should match those of mean, SD & SE vectors

#cat vectors into one dataframe
DS_sum <- data.frame(Time_Point, Status, DS_mean, DS_SD, DS_SE)

#################################################################################################################################################

######## D biarmipes analyses ########

#### anova ####
DB_SA_anova <- aov(Courtship_Index_arcsine ~ Test, data = DB)
DB_SA_Tukey <- TukeyHSD(DB_SA_anova)

#### means, SD & SE #####
#virgins 3-5 days w/out blueberry
DB_V35_NBB <- DB[which(DB$Test=='DB_V3-5_NBB'),] #subset dataframe
DB_V35_NBB_mean <- mean(DB_V35_NBB$`Courtship_Index_%`) #calculate mean
DB_V35_NBB_SD <- sd(DB_V35_NBB$`Courtship_Index_%`) #calculate SD
DB_V35_NBB_SE <- DB_V35_NBB_SD/sqrt(20) #calculate SE

#virgins 10-12 days/wout blueberry
DB_V1012_NBB <- DB[which(DB$Test=='DB_V10-12_NBB'),]
DB_V1012_NBB_mean <- mean(DB_V1012_NBB$`Courtship_Index_%`)
DB_V1012_NBB_SD <- sd(DB_V1012_NBB$`Courtship_Index_%`)
DB_V1012_NBB_SE <- DB_V1012_NBB_SD/sqrt(20)

#mated 1-hr post-mating w/out blueberry (females 3-5 days old)
DB_PM1_NBB <- DB[which(DB$Test=='DB_PM1_NBB'),]
DB_PM1_NBB_mean <- mean(DB_PM1_NBB$`Courtship_Index_%`)
DB_PM1_NBB_SD <- sd(DB_PM1_NBB$`Courtship_Index_%`)
DB_PM1_NBB_SE <- DB_PM1_NBB_SD/sqrt(20)

#mated 24-hrs post-mating w/out blueberry (females 4-6 days old)
DB_PM24_NBB <- DB[which(DB$Test=='DB_PM24_NBB'),]
DB_PM24_NBB_mean <- mean(DB_PM24_NBB$`Courtship_Index_%`)
DB_PM24_NBB_SD <- sd(DB_PM24_NBB$`Courtship_Index_%`)
DB_PM24_NBB_SE <- DB_PM24_NBB_SD/sqrt(20)

#mated 168-hrs post-mating w/out blueberry (females 10-12 days old)
DB_PM168_NBB <- DB[which(DB$Test=='DB_PM168_NBB'),]
DB_PM168_NBB_mean <- mean(DB_PM168_NBB$`Courtship_Index_%`)
DB_PM168_NBB_SD <- sd(DB_PM168_NBB$`Courtship_Index_%`)
DB_PM168_NBB_SE <- DB_PM168_NBB_SD/sqrt(20)

#### summarize results ####
#create vectors with means, SDs, etc.
DB_mean <- c(DB_V35_NBB_mean, DB_PM1_NBB_mean, DB_PM24_NBB_mean, 
             DB_V1012_NBB_mean, DB_PM168_NBB_mean) #pull means into one vector
DB_SD <- c(DB_V35_NBB_SD, DB_PM1_NBB_SD, DB_PM24_NBB_SD, DB_V1012_NBB_SD, 
           DB_PM168_NBB_SD) #pull SDs into one vector
DB_SE <- c(DB_V35_NBB_SE, DB_PM1_NBB_SE, DB_PM24_NBB_SE, DB_V1012_NBB_SE, 
           DB_PM168_NBB_SE) #pull SEs into one vector
Time_Point <- c("HR 0", "HR 1", "Day 1", "Day 7", "Day 7")
Status <- c("Virgin", "Mated", "Mated", "Virgin", "Mated") #order should match those of mean, SD & SE vectors

#cat vectors into one dataframe
DB_sum <- data.frame(Time_Point, Status, DB_mean, DB_SD, DB_SE)

#################################################################################################################################################

######## Visualize data ########

#assign bar width
bar_width <- 0.7

#### D suzukii plot ####
#assign bar positions
DS_sum$center <- c(1.65, 1.65, 3, 4, 5.7, 5.7, 5.7) #set breaks on x-axis (set so that consistent break between each "group" of bars)
DS_sum$pos <- c(1.3, 2, 3, 4, 5, 5.7, 6.4) #set position of each bar

#D suzukii bar plot
DSplot <- ggplot(data = DS_sum, aes(x= pos, y = DS_mean, fill = Status)) + 
  geom_col(position = "identity", size = 0.3, width = bar_width) + 
  geom_errorbar(aes(ymin = DS_mean - DS_SE, ymax = DS_mean + DS_SE), width = 0.3)
DSplot_annotated <- DSplot + labs(x = "Time since initial copulation", y = "Mean CI (%)") + 
  theme_bw() + scale_x_continuous(breaks = DS_sum$center, labels = DS_sum$Time_Point) + 
  scale_y_continuous(expand = c(0,0)) + scale_fill_manual(values = c("gray80", "gray30", "gray50")) + labs(tag = "2") + 
  theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        axis.line = element_line(size = 1), axis.ticks = element_line(color = "black", size = 1),
        axis.text = element_text(size = 14, color = "black"), axis.title = element_text(size = 14, face = "bold"), 
        legend.position = "top", legend.text = element_text(size = 14), 
        legend.title = element_blank(), plot.tag = element_text(size = 24, color = "black", face = "bold"))
DSplot_annotated

#### D biarmipes plot ####
#assign bar positions
DB_sum$center <- c(1, 2, 3, 4.35, 4.35) #set breaks on x-axis (set so that consistent break between each "group" of bars)
DB_sum$pos <- c(1, 2, 3, 4, 4.7) #set position of each bar

#D biarmipies bar plot
DBplot <- ggplot(data = DB_sum, aes(x = pos, y = DB_mean, fill = Status)) + 
  geom_col(position = "identity", size = 0.3, width = bar_width) + 
  geom_errorbar(aes(ymin = DB_mean - DB_SE, ymax = DB_mean + DB_SE), width = 0.3)
DBplot_annotated <- DBplot + labs(x = "Time since initial copulation", y = "Mean CI (%)") + 
  theme_bw() + scale_x_continuous(breaks = DB_sum$center, labels = DB_sum$Time_Point) + 
  scale_y_continuous(expand = c(0,0)) + scale_fill_manual(values = c("gray80", "gray30")) + labs(tag = "1") + 
  theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        axis.line = element_line(size = 1), axis.ticks = element_line(color = "black", size = 1),
        axis.text = element_text(size = 14, color = "black"), axis.title = element_text(size = 14, face = "bold"), 
        legend.position = "top", legend.text = element_text(size = 14), 
        legend.title = element_blank(), plot.tag = element_text(size = 24, color = "black", face = "bold"))
DBplot_annotated

#save as eps files for publication
ggsave("DS_SA.eps", plot = DSplot_annotated, width = 110, height = 120, units = "mm")
ggsave("DB_SA.eps", plot = DBplot_annotated, width = 100, height = 120, units = "mm")
