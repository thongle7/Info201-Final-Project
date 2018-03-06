library(ggplot2)
library(ggmap)
library(jsonlite)
library(dplyr)

setwd("~/desktop")
data <- read.csv(file = "export-3833f94f-d265-44ac-816a-bff6ebe50e2b.csv", stringsAsFactors = FALSE)

is.data.frame(data)

View(data)

colnames(data)

map <- get_map(location = 'USA', zoom = 4)
ggmap(map) +
  geom_point(size = 0.3, aes(x = Address, y = State), data = data, color = 'blue') +
  labs(title = "UFO Sightings in Washington")

library(ggmap)
locs <- c('Seattle WA')
geocode(locs)


a <- lapply(data$Address, geocode)

a <- as.data.frame(a)

a <- flatten(a) 

newdata <- filter(data, State == "Alabama")
newdata$fullad <- paste(newdata$Address, ", ", newdata$City.Or.County, ", ", newdata$State)
temp <- lapply(newdata$fullad, geocode)
#temp2 <- data.frame(long = sapply(temp, "[", 1), lat = sapply(temp, "[", 2) )
newdata <- mutate(newdata, long = paste(sapply(temp, "[", 1)), lat = paste(sapply(temp, "[", 2))  )
#newdata$long <- as.data.frame(sapply(temp, "[", 1))
#newdata$lat <- as.data.frame(sapply(temp, "[", 2))
View(newdata)


map <- get_map(location = 'Alabama', zoom = 7)
ggmap(map) +
  geom_point(size = 0.3, aes(x =as.numeric(long), y = as.numeric(lat)), data = newdata, color = 'blue') +
  labs(title = "UFO Sightings in Washington")
