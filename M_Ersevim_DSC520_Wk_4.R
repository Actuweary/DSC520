# Assignment: ASSIGNMENT Week 4
# Name: Ersevim, Michael
# Date: 2021-09-24

library(ggplot2)
library(readr)
library(pastecs)
library(dplyr)
library(hrbrthemes)
theme_set(theme_minimal())

## Set the working directory to the root of your DSC 520 directory
setwd("/Users/mersevim/OneDrive - Waste Management/Documents/GitHub/dsc520/data")
dir() # check - it works

score_df <- read.csv("scores.csv", header=TRUE)

head(score_df)

str(score_df)
nrow(score_df)
ncol(score_df)

sports_df <- score_df[score_df$Section == "Sports",]
regular_df <- score_df[score_df$Section == "Regular",]

head(regular_df)
head(sports_df)

tail(regular_df)
tail(sports_df)


ggplot(sports_df, aes(Score)) + geom_histogram(bins=30) + ggtitle("Count of score") + xlab("Sports scores") + ylab("Counts by Tens")

ggplot(regular_df, aes(Score)) + geom_histogram(bins=30) + ggtitle("Count of score") + xlab("Regular scores") + ylab("Counts by Tens")

mean(sports_df$Score)
mean(regular_df$Score)
