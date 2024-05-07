# NFL Team Performance vs Weather Analysis Project

## Team Members
- Andy Roose
- Dave Marcheschi
- Jack Gray

## Introduction
Weather significantly affects NFL games and can influence the outcome. Our project investigates which weather conditions impact game performance the most, such as extreme temperatures, precipitation, and wind speeds. We hypothesize that these factors increase turnovers and decrease total points and yards. Additionally, we explore the performances of teams in domed stadiums and those located in colder climates to assess potential advantages in specific weather conditions.

## Project Overview
Data for this project was sourced from Kaggle and Pro-Football Reference, covering NFL seasons from 2000 to 2020. Our analysis focuses on understanding how different weather conditions affect game outcomes and team performances.

### Data Sources
- **Weather Data (Kaggle)**: Includes weather conditions during each NFL game from 2000-2020.
- **Pro-Football Reference**: Contains detailed game results, including turnovers, winning teams, yards, and points from the same period.

Data Scraping and Integration:
- Initially, NFL game stats were scraped from Pro-Football Reference, then integrated with weather data from Kaggle using horizontal integration in R Studio. 
- The final merged dataset contains 5,347 observations and 23 variables, adjusted for optimal analysis.

## Analysis
### Climate Impact Analysis
We analyzed how teams from colder climates perform in cold weather compared to teams from more moderate climates, considering metrics like average points, yards, turnovers, and win percentages.

#### Key Findings:
- **Points**: Teams from colder climates scored slightly higher on average in cold weather games.
- **Yards**: Yardage gains were nearly identical between teams from different climates.
- **Turnovers**: Similar performance in turnovers suggests minimal impact of cold weather on ball security.
- **Win Percentage**: A significant advantage in win rates was observed for teams from colder climates in cold weather games.

## Conclusion
Our analysis provides insights into how weather conditions affect NFL team performances, with significant implications for team strategies in adverse weather conditions. Teams from colder climates show considerable advantages in cold weather, which could be pivotal in game preparation and strategy.

