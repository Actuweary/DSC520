# Assignment: ASSIGNMENT 3 - Part 2
# Name: Ersevim, Michael
# Date: 2021-09-17

## Load the ggplot2 package
library(ggplot2)
library(readr)
library(pastecs)
theme_set(theme_minimal())

## Set the working directory to the root of your DSC 520 directory
setwd("/Users/mersevim/OneDrive - Waste Management/Documents/GitHub/dsc520")
dir()

## Load the `data/r4ds/heights.csv` to
acs_df <- read_delim("data/acs-14-1yr-s0201.csv", delim=",")

##What are the elements in your data (including the categories and data types)?
head(acs_df)

##Please provide the output from the following functions: str(); nrow(); ncol()
str(acs_df)
nrow(acs_df)
ncol(acs_df)

##Create a Histogram of the HSDegree variable using the ggplot2 package.
##Set a bin size for the Histogram.
##Include a Title and appropriate X/Y axis labels on your Histogram Plot.

ggplot(acs_df, aes(HSDegree)) + geom_histogram(bins=20) + ggtitle("Count of % of HS Degrees") + xlab("Pct of HS Degrees in County") + ylab("Counts")

#Answer the following questions based on the Histogram produced:
#  Based on what you see in this histogram, is the data distribution unimodal?
# -------- Yes, at about 90%
#  Is it approximately symmetrical?
#---------- No, it is skewed to the left
#  Is it approximately bell-shaped?
# --------- Not really - it is skewed
#  Is it approximately normal?
# --------- Same answer: Not really
#  If not normal, is the distribution skewed? If so, in which direction?
#----------- It is skewed to the left
#  Include a normal curve to the Histogram that you plotted.

ggplot(acs_df, aes(HSDegree)) + geom_histogram(bins=20) + ggtitle("Count of % of HS Degrees") + xlab("Pct of HS Degrees in County") + ylab("Counts") +
  geom_density(kernel = "gaussian") +
  stat_function(fun = function(x) 
     dnorm(x, mean = mean(acs_df$HSDegree), sd = sd(acs_df$HSDegree)) * 1.8 * 136, colour = 'blue') # scaled Norm dist to num of obs (136) and approx bin width (2)

#  Explain whether a normal distribution can accurately be used as a model for this data.
#----- No. As mention before, the distribution is too kurtotic and skewed to the left. Also, some of a fitted normal
#----- distribution would fall above the 100% upper limit of the measured statistic.

# Create a Probability Plot of the HSDegree variable.
ggplot(acs_df, aes(HSDegree)) +  geom_density()

# Answer the following questions based on the Probability Plot:
#  Based on what you see in this probability plot, is the distribution approximately normal? Explain how you know.
#---------- Not at all: it is too peaked, too skewed to left
# If not normal, is the distribution skewed? If so, in which direction? Explain how you know.
#---------- skewed to left
# Now that you have looked at this data visually for normality, you will now quantify 
# normality with numbers using the stat.desc() function. Include a screen capture of 
# the results produced.
stat.desc(acs_df$HSDegree)

# In several sentences provide an explanation of the result produced for skew, 
# kurtosis, and z-scores. In addition, explain how a change in the sample size may 
# change your explanation?
#----- Since the histogram and density graphs are very skewed to the left, the data are NOT normally distributed.
#----- The Kurtosis or peakedness is quite high as well, likely much higher than the 3 that a Gaussian has
#----- Also, give that the upper bound of the graph is 100%, a Z score has a positive limit of perhaps 2.5, whereas in
#----- a true Bell curve, the Z-score can be much higher (although rarer)
#----- I wouldn't expect the shape/type of distribution to change much with a larger sample size. THere would certainly
#----- be differences across counties in the USA, but in aggregate, I would expect the histogram and pdf to be smoother and
#----- more finely dividable