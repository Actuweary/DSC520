# Assignment: ASSIGNMENT Week 5, Question #1
# Name: Ersevim, Michael
# Date: 2021-09-29


library(readr)
library(pastecs)
library(plyr)
library(dplyr) # load this after plyr
library(hrbrthemes)
library(readxl)
library(magrittr)

theme_set(theme_minimal())

## Set the working directory to the root of your DSC 520 directory
setwd("/Users/mersevim/OneDrive - Waste Management/Documents/GitHub/dsc520/data")
dir() # check - it works

house_df <- read_excel("week-7-housing.xlsx", col_names = TRUE) #Data Used for answering part d, otherwise, used 'Diamonds' dataset
library(data.table)
house_dt <- data.table(house_df)

head(house_df) # check - it works
tail(house_dt) # check - it works

# Assignment:

# a) Using the dplyr package, use the 6 different operations to analyze/transform the data - GroupBy, Summarize, Mutate, Filter, Select, and Arrange - Remember 
#     this isn't just modifying data, you are learning about your data also - so play around and start to understand your dataset in more detail

# library(dplyr)
# aggregate(bedrooms ~ sitetype, house_dt, mean, na.rm=TRUE)
# house_dt %>% ungroup()
# house_dt %>% group_by(house_dt$sitetype) %>% summarize(AvgBdrms = mean(bedrooms))
# by_cyl <- house_dt %>% group_by(sitetype) %>% summarise(avbdm = mean(bedrooms))
# by_cyl %>% summarise(
#   avbdm = mean(bedrooms),
#   avsqft = mean(square_feet_total_living))


library(ggplot2)
data(diamonds)
head(diamonds)
class(diamonds)

diamonds %>%
  group_by(cut) %>%
  summarize(AvgPrice=mean(price))

diamonds %>%
  summarize(mean(price))

diamonds %>%
  mutate(price/carat)

diamonds %>%
  filter(carat > 2)

diamonds %>%
  select(c(cut, color))

diamonds %>%
  group_by(cut) %>%
  summarize(AvgPrice=mean(price), sumofcarats=sum(carat))
  arrange(desc(AvgPrice)

# b) Using the purrr package - perform 2 functions on your dataset.  You could use zip_n, keep, discard, compact, etc.

library(purrr)

only_rocks <- diamonds %>% 
  discard(is.factor) %>% str()

diamonds$price %>% 
  map_dbl(mean, na.rm=TRUE)
# c) Use the cbind and rbind function on your dataset

family <- c("Woodwinds", "Brass", "Strings")
instrument <- c("Oboe", "Trumpet", "Viola")
tone <- c("Nasal", "Brassy", "Mellow")
orch1 <- cbind(family,instrument,tone)

orch2 <- data.frame(family=c("Percussion","Electronic"),
                    instrument=c("Timpani", "Synth"),
                    tone=c("Plump","Fake"),
                    stringsAsFactors = FALSE)

orch <- rbind(orch1, orch2)

orch

# d) Split a string, then concatenate the results back together

locs <- house_dt$addr_full #create string to be split

loc_words <- locs %>% 
  strsplit(" ") #splits on space delim

loc_words

library("stringr") # combine strings together again

onestring_locs <- paste(loc_words)
onestring_locs
