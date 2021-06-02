This repository provides the data and scripts for the analyses in "An analysis of female postcopulatory behavior in *Drosophila suzukii* and *Drosophila biarmipes*," which examines a series of basic reproductive behaviors in both species.

**Citation:** Clark RD, Dipiero M, Fingerut JT, McRobert SP. (2020) An analysis of female postcopulatory behavior in *Drosophila suzukii* and *Drosophila biarmipes*. *Journal of Insect Behavior*, **33**:193-200. [(doi:10.1007/s10905-020-09761-x)](https://link.springer.com/article/10.1007%2Fs10905-020-09761-x)

Please contact René at rene.clark[at]rutgers.edu with any questions.

## **DATA**

A list of the files either read into R scripts for analyses or the raw data files where data was originally recorded.

## **SA_TidyData.csv**  
This file contains the data from the sexual attractiveness trials, for both *D. suzukii* and *D. biarmipes*. The first column contains the trial ID in SPECIES_TESTTYPE_BLUEBERRYSTATUS_TRIALNUMBER format. The second column indicates the species, the third column indicates the age (in days) of the female used in the trial, and the fourth column indicates if the female used was a virgin or not at the time of the trial. The fifth column records the time (in hours) since the female first mated. The sixth column indicates whether or not the female was given a blueberry. The seventh column contains the test ID in SPECIES_TESTTYPE_BLUEBERRYSTATUS format. Columns 8-10 contain the date of the trial, time of the trial (24-hr clock), and temperature (in celsius) during the trial, respectively. Column 11 contains the courtship index (%) and column 12 contains the courtship index (arcsine-transformed). Column 13 indicates whether the pair copulated. Column 14 contains the copulation latency and column 15 contains the copulation duration, if available. Column 16 indicates which researcher (or pair of researchers) was responsible for the trial. Column 17 contains any notes recorded during the trial.  
*SA_RawData.csv (the data file that was used to record the trial results) contains the same data, just in a slightly different format. In SA_RawData.csv, each test is recorded on a separate excel spreadsheet. Metadata on the experimental design is included in the first few rows of the SA_RawData.csv file as well.*

Scripts



