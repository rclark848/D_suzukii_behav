This repository provides the data and scripts for the analyses in "An analysis of female postcopulatory behavior in *Drosophila suzukii* and *Drosophila biarmipes*," which examines a series of basic reproductive behaviors in both species.

**Citation:** Clark RD, Dipiero M, Fingerut JT, McRobert SP. (2020) An analysis of female postcopulatory behavior in *Drosophila suzukii* and *Drosophila biarmipes*. *Journal of Insect Behavior*, **33**:193-200. [(doi:10.1007/s10905-020-09761-x)](https://link.springer.com/article/10.1007%2Fs10905-020-09761-x)

Please contact René at rclark848[at]gmail.com with any questions.

*Also available to download as a zip archive from Zenodo.*  
[![DOI](https://zenodo.org/badge/372948175.svg)](https://zenodo.org/badge/latestdoi/372948175)

## **DATA**

A list of the files either read into R scripts for analyses or the raw data files where data was originally recorded. All dates are in MONTH.DAY.YEAR format.

### **SA_TidyData.csv**  
This file contains the data from the sexual attractiveness trials, for both *D. suzukii* and *D. biarmipes*. The first column contains the trial ID in SPECIES_TESTTYPE_BLUEBERRYSTATUS_TRIALNUMBER format. The second column indicates the species, the third column indicates the age (in days) of the female used in the trial, and the fourth column indicates if the female used was a virgin or not at the time of the trial. The fifth column records the time (in hours) since the female first mated. The sixth column indicates whether or not the female was given a blueberry. The seventh column contains the test ID in SPECIES_TESTTYPE_BLUEBERRYSTATUS format. Columns 8-10 contain the date of the trial, time of the trial (24-hr clock), and temperature (in celsius) during the trial, respectively. Column 11 contains the courtship index (%) and column 12 contains the courtship index (arcsine-transformed). Column 13 indicates whether the pair copulated. Column 14 contains the copulation latency and column 15 contains the copulation duration, if available. Column 16 indicates which researcher (or pair of researchers) was responsible for the trial. Column 17 contains any notes recorded during the trial. Read into `SA_script.R`.  

*SA_RawData.csv (the data file that was used to record the trial results) contains the same data, just in a slightly different format. In SA_RawData.csv, each test is recorded on a separate excel spreadsheet. Metadata on the experimental design is included in the first few rows of the SA_RawData.csv file as well.*

### **SR_TidyData.csv**
This file contains the data from the sexual receptiveness trials, for both *D. suzukii* and *D. biarmipes*. The first column contains the trial ID in SPECIES_TESTTYPE_TRIALNUMBER format. The second column indicates the species, the third column indicates the age (in days) of the female used in the trial, and the fourth column indicates if the female used was a virgin or not at the time of the trial. The fifth column records the time (in hours) since the female first mated. The sixth column contains the test ID in SPECIES_TESTTYPE format. Columns 7-9 contain the date of the trial, time of the trial (24-hr clock), and temperature (in celsius) during the trial, respectively. Column 10 indicates whether the pair courted and column 11 indicates whether the pair copulated. Column 12 contains the copulation latency and column 13 contains the copulation duration, if available. Column 14 indicates which researcher (or pair of researchers) was responsible for the trial. Column 15 contains any notes recorded during the trial. Read into `SR_script.R`.  

*SR_RawData.csv (the data file that was used to record the trial results) contains the same data, just in a slightly different format. In SR_RawData.csv, each test is recorded on a separate excel spreadsheet. Metadata on the experimental design is included in the first few rows of the SR_RawData.csv file as well.*

### **EL_TidyData.csv**
This file contains the data from the offspring production trials, for both *D. suzukii* and *D. biarmipes*. The first column contains the trial ID in SPECIES_TESTTYPE_TRIALNUMBER format. The second column indicates the species and the third column indicates the week the offspring count was conducted. The fourth column contains the test ID in SPECIES_TESTTYPE format. The fifth column contains the date the female was first mated, the sixth column contains the date the female was first placed in the vial, the seventh column contains the date the female was removed from the vial, and the eigth column contains the date the vial was checked for larvae/offspring. Columns 9-11 contain the number of live (juvenile) offspring found in the vial, the number of pupae/larvae found in the vial, and the total number of offspring found in the vial, respectively. Column 12 indicates which researcher (or pair of researchers) was responsible for the trial. Column 13 contains any notes recorded during the trial. Read into `EL_script.R`.  

*EL_RawData.csv (the data file that was used to record the trial results) contains the same data, just in a slightly different format. In EL_RawData.csv, each test is recorded on a separate excel spreadsheet. Metadata on the experimental design is included in the first few rows of the EL_RawData.csv file as well.*

## **SCRIPTS**

A list of the R scripts.

### **SA_script.R**
This script conducts the sexual attractiveness analyses (ANOVA and Tukey post-hoc tests) and creates bar plots of mean sexual attractiveness (% of time male spent courting) for both *D. suzukii* & *D. biarmipes*. Reads in `SA_TidyData.csv`.

### **SR_script.R**
This script conducts the sexual receptiveness analyses (t-tests and Chi-squared tests) and creates bar plots of mean copulation latency & copulation duration for both *D. suzukii* & *D. biarmipes*. Reads in `SR_TidyData.csv`.

### **EL_script.R**
This script conducts the offspring production analyses (t-tests) for both *D. suzukii* & *D. biarmipes*. Reads in `EL_TidyData.csv`.
_______________________________________________________

**Necessary Software**
1. R (v.4.2.2 or above)
2. RStudio (v.2022.12.0 or above)

**Necessary R Packages**
1. RColorBrewer (v.1.1.3)
2. tidyverse (v.2.0.0)
3. 
