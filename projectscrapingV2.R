rm(list=ls())
library(xml2)
library(dplyr)
userAgent <- "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36" 

allWeeks <- 0 
allDays <- 0 
allDates <- 0 
allTimes <- 0 
allWinners <- 0 
allLocations <- 0 
allLosers <- 0 
allptsWin <- 0 
allptsLose <- 0 
allyardsWin <- 0 
alltoWin <- 0 
allyardsLose <- 0 
alltoLose <- 0 


#Scraping______________________________________________________________________________________________________________________

for (i in 0:20) { 
  print(i) 
  
  if (i < 10) {
    url <- paste("https://www.pro-football-reference.com/years/200", i, '/games.htm', sep = '') 
  } 
  else {
    url <- paste("https://www.pro-football-reference.com/years/20", i, '/games.htm', sep = '') 
    
  }
  page <- read_html(url, userAgent) 
  Sys.sleep(1) 
  
  week <- xml_text(xml_find_all(page, "//td[@data-stat='week_num']")) 
  allWeeks <- c(allWeeks, week) 
  
  day <- xml_text(xml_find_all(page, "//td[@data-stat='game_day_of_week']")) 
  allDays <- c(allDays, day)
  
  date <- xml_text(xml_find_all(page, "//td[@data-stat='game_date']")) 
  allDates <- c(allDates, date)
  
  time <- xml_text(xml_find_all(page, "//td[@data-stat='gametime']")) 
  allTimes <- c(allTimes, time)
  
  winner <- xml_text(xml_find_all(page, "//td[@data-stat='winner']")) 
  allWinners <- c(allWinners, winner)
  
  location <- xml_text(xml_find_all(page, "//td[@data-stat='game_location']")) 
  allLocations <- c(allLocations, location)
  
  loser <- xml_text(xml_find_all(page, "//td[@data-stat='loser']")) 
  allLosers <- c(allLosers, loser)
  
  
  ptswin <- xml_text(xml_find_all(page, "//td[@data-stat='pts_win']")) 
  allptsWin <- c(allptsWin, ptswin)
  
  ptslose <- xml_text(xml_find_all(page, "//td[@data-stat='pts_lose']")) 
  allptsLose <- c(allptsLose, ptslose)
  
  yardsWin <- xml_text(xml_find_all(page, "//td[@data-stat='yards_win']")) 
  allyardsWin <- c(allyardsWin, yardsWin)
  
  toWin <- xml_text(xml_find_all(page, "//td[@data-stat='to_win']")) 
  alltoWin <- c(alltoWin, toWin)
  
  yardsLose <- xml_text(xml_find_all(page, "//td[@data-stat='yards_lose']")) 
  allyardsLose <- c(allyardsLose, yardsLose)
  
  toLose <- xml_text(xml_find_all(page, "//td[@data-stat='to_lose']")) 
  alltoLose <- c(alltoLose, toLose)
  
  
  random_value <- sample(2:7, 1) 
  Sys.sleep(random_value) 
  
} 

nfl <- data.frame(allWeeks, 
                  allDays, 
                  allDates, 
                  allTimes, 
                  allWinners, 
                  allLocations, 
                  allLosers, 
                  allptsWin, 
                  allptsLose, 
                  allyardsWin, 
                  alltoWin, 
                  allyardsLose, 
                  alltoLose)


#Cleaning____________________________________________________________________________________________________________________

nfl <- nfl[-1, -1]
colnames(nfl)[colnames(nfl) == "allDays"] <- "Day of Week"
colnames(nfl)[colnames(nfl) == "allDates"] <- "Date"
colnames(nfl)[colnames(nfl) == "allTimes"] <- "Time"
colnames(nfl)[colnames(nfl) == "allWinners"] <- "Winner"
colnames(nfl)[colnames(nfl) == "allLocations"] <- "Location"
colnames(nfl)[colnames(nfl) == "allLosers"] <- "Loser"
colnames(nfl)[colnames(nfl) == "allptsWin"] <- "PTS Win"
colnames(nfl)[colnames(nfl) == "allptsLose"] <- "PTS Lose"
colnames(nfl)[colnames(nfl) == "allyardsWin"] <- "Yards Win"
colnames(nfl)[colnames(nfl) == "alltoWin"] <- "To Win"
colnames(nfl)[colnames(nfl) == "allyardsLose"] <- "Yards Lose"
colnames(nfl)[colnames(nfl) == "alltoLose"] <- "To Lose"
nfl <- nfl[nfl$Date != "Playoffs", ]
nfl$Home_Team <- ifelse(nfl$Location == '@', nfl$Loser, nfl$Winner)
colnames(nfl)[colnames(nfl) == "Home_Team"] <- "Home Team"

#Stadiums_____________________________________________________________________________________________________________________

stadiums <- read.csv("nfl_stadiums.csv")

stadiums <- stadiums %>% select(-'Capacity', -'Surface', -'Opened')

colnames(stadiums)[colnames(stadiums) == "Team.s."] <- "Home Team"
colnames(stadiums)[colnames(stadiums) == "Roof.type"] <- "Roof Type"
colnames(stadiums)[colnames(stadiums) == "Location"] <- "City"
colnames(stadiums)[colnames(stadiums) == "Name"] <- "Stadium Name"


#Merge NFL with Stadiums______________________________________________________________________________________________________

nfl2 <- merge(nfl, stadiums, by = 'Home Team', all = TRUE)


nfl3 <- nfl2[nfl2$`Roof Type` != "Fixed", ]

nfl3 <- nfl3[nfl3$`Roof Type` != "Retractable", ]






