# Predicting NFL Second Contract Value

## Using various machine learning techniques to predict the guaranteed value of NFL player second contracts

<img width="712" height="423" alt="image" src="https://github.com/user-attachments/assets/a07ae98c-efca-4c39-acec-4acbbc353ca0" />
<img width="722" height="434" alt="image" src="https://github.com/user-attachments/assets/88070ba4-6fd8-495d-af55-608f9a636a02" />

## Overview

NFL teams invest millions of dollars when negotiating second contracts with players, making accurate valuation an important aspect of roster construction and salary cap management. This project integrates historical player performance, draft, and contract data to evaluate how effectively a player's early career can predict the guaranteed value of their second contract.

This project focused specifically on the positions of quarterbacks, fullback, running back, wide receiver, and tight end.

Multiple predictive models were developed and compared using common regression performance metrics to identify the most effective modeling approach.

## Business Problem

Can a player's draft position and early career performance be used to accurately predict the guaranteed value of their second NFL contract, and which machine learning model provides the best predictive performance?

## Tools Used

- R
- dplyr
- caret
- ggplot2

## Analytical Methods

- Data cleaning
- Data integration
- Exploratory data analysis
- Linear regression
- Random forest
- Support vector machine
- Gradient boosting
- Generalized boosted regression
- Prediction
- Feature importance
- Model comparison

## Key Findings

- Of the five models used, the random forest model performed the best in terms of root mean squared error (RMSE) and mean average error (MAE)
- Expected points added (EPA) statistics were valuable in predicting a player's guaranteed second contract value
- A player's performance during the season immediately prior to signing their second contract held more weight than earlier seasons

## My Contributions

This project was completed as part of a team in Georgia Tech's M.S. in Analytics program.

My primary contributions included:

- Data integration
- Data cleaning
- Developing the linear regression model
- Data visualization
- Assisting with the interpretation of results and final report writing

## Repository Contents

- salary_prediction_report.pdf: Detailed project report
- data_preparation.R: Data cleaning and preprocessing script
- data folder: Combined data file used in the data preparation script

## Dataset

This project used publicly available data from the NFLverse package for R, namely the datasets below:

- Contracts
- Draft Picks
- Player Stats

More information about the NFLverse package and how to use it can be found here: https://nflverse.nflverse.com/index.html

The data folder within this repository includes a file that combines the three NFLverse datasets and was used in the data preparation R script.
