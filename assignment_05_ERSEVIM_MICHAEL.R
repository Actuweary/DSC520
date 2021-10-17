# Assignment: ASSIGNMENT 5
# Name: ERSEVIM, MICHAEL
# Date: 2021-10-17

## Set the working directory to the root of your DSC 520 directory
setwd("/Users/mersevim/OneDrive - Waste Management/Documents/GitHub/dsc520")
dir()

## Load the `data/r4ds/heights.csv` to
heights_df <- read.csv("data/r4ds/heights.csv")
head(heights_df)

## Using `cor()` compute correlation coefficients for
## height vs. earn
cor(heights_df$height, heights_df$earn, use="complete.obs", method = "pearson")

### age vs. earn
cor(heights_df$age, heights_df$earn, use="complete.obs", method = "pearson")

### ed vs. earn
cor(heights_df$ed, heights_df$earn, use="complete.obs", method = "pearson")

## Spurious correlation
## The following is data on US spending on science, space, and technology in millions of today's dollars
## and Suicides by hanging strangulation and suffocation for the years 1999 to 2009
## Compute the correlation between these variables
tech_spending <- c(18079, 18594, 19753, 20734, 20831, 23029, 23597, 23584, 25525, 27731, 29449)
suicides <- c(5427, 5688, 6198, 6462, 6635, 7336, 7248, 7491, 8161, 8578, 9000)
cor(tech_spending, suicides, use="complete.obs", method = "pearson")
