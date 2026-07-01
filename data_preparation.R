library(dplyr)

# read in data
nfl <- read.table("Combined DF.csv", sep = ",", header = TRUE)

# filter to year drafted greater than or equal to 2011 (due to CBA change) and less than or equal to 2020 (so that they've signed their second contract already)
nfl_filtered <- nfl %>% filter(season.y >= 2011 & season.y <= 2020)

# filter to only QB, FB, RB, WR, TE
nfl_filtered <- nfl_filtered %>% filter(position %in% c("QB", "FB", "RB", "WR", "TE"))

# filter to only include rows that have second contract details
nfl_filtered <- nfl_filtered %>% arrange(player_id, year_signed)
second_contract <- nfl_filtered %>% group_by(player_id) %>% summarize(second_oldest_year = sort(unique(year_signed))[2], .groups = 'drop')
nfl_filtered <- nfl_filtered %>% inner_join(second_contract, by = c("player_id" = "player_id", "year_signed" = "second_oldest_year"))

# filter to only include seasons played before second contract was signed
nfl_filtered <- nfl_filtered %>% filter(season.x < year_signed) %>% distinct(player_id, season.x, .keep_all = TRUE)

# remove unnecessary columns
nfl_final <- nfl_filtered %>% select(player_id, player_display_name, position.y, recent_team, season.x, total_completions, total_attempts, total_passing_yards, total_passing_tds, total_interceptions, total_sacks, total_sack_yards, total_sack_fumbles, total_sack_fumbles_lost, total_passing_air_yards, total_passing_yards_after_catch, total_passing_first_downs, total_passing_epa, total_passing_2pt_conversions, total_pacr, total_dakota, total_carries, total_rushing_yards, total_rushing_tds, total_rushing_fumbles, total_rushing_fumbles_lost, total_rushing_first_downs, total_rushing_epa, total_rushing_2pt_conversions, total_receptions, total_targets, total_receiving_yards, total_receiving_tds, total_receiving_fumbles, total_receiving_fumbles_lost, total_receiving_air_yards, total_receiving_yards_after_catch, total_receiving_first_downs, total_receiving_epa, total_receiving_2pt_conversions, total_racr, total_target_share, total_air_yards_share, total_wopr, total_special_teams_tds, total_fantasy_points, total_fantasy_points_ppr, year_signed, years, value, apy, guaranteed)

# rename position and season columns (get rid of '.y' and '.x')
nfl_final <- nfl_final %>% rename(position = position.y, season = season.x)

# see which columns have missing values
missing_vals <- colSums(is.na(nfl_final))
missing_cols <- names(missing_vals[missing_vals > 0])
missing_cols

# export file
install.packages("writexl")
library(writexl)
write_xlsx(nfl_final, "Data Preparation.xlsx")