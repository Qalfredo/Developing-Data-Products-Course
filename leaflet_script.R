library(dplyr)
library(leaflet)

NY_subway <- read.csv("NYC_Transit_Subway_Entrance_And_Exit_Data.csv", header = T, sep = ",")

fourth_line <- NY_subway[NY_subway$Line=="4 Avenue", ]

fourth_line <- select(fourth_line, Station.Name, Entrance.Type, Vending, Entrance.Latitude, Entrance.Longitude)

my_map <- leaflet(fourth_line)
my_map %>% addTiles() %>% addMarkers(~Entrance.Longitude, ~Entrance.Latitude, popup = ~Station.Name)
