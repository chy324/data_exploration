# data_exploration
COVID-19 Data Exploration in the USA

/*
COVID-19 Data Exploration in the USA
*/

--View the data

SELECT *
FROM `bigquery-public-data.covid19_usafacts.summary` 

--Select data that we are going to be starting with

SELECT state, date, confirmed_cases, deaths
FROM `bigquery-public-data.covid19_usafacts.summary` 
WHERE date > "2020-03-31"

--Select state, date, confirmed cases, and total deaths from April 2020 through June 2020

SELECT state, date, confirmed_cases, deaths
FROM `bigquery-public-data.covid19_usafacts.summary` 
WHERE date > "2020-03-31" AND date <= "2020-06-30"

--Determine which state had the highest total amount of confirmed cases between April 2020 and June 2020

SELECT state, confirmed_cases
FROM `bigquery-public-data.covid19_usafacts.summary` 
WHERE confirmed_cases >= 1 AND date > "2020-03-31" AND date <= "2020-06-30" 
ORDER BY confirmed_cases DESC

--Determine which state had the highest total death rate between April 2020 and June 2020

SELECT state, deaths
FROM `bigquery-public-data.covid19_usafacts.summary` 
WHERE deaths >= 1 AND date > "2020-03-31" AND date <= "2020-06-30" 
ORDER BY deaths DESC

-- Total Cases vs Total Deaths
-- Shows likelihood of dying if you contract covid in a particular state

SELECT state, confirmed_cases, deaths, (deaths/confirmed_cases)*100 as DeathPercentage
FROM `bigquery-public-data.covid19_usafacts.summary` 

--Now let's view the COVID-19 data related to race between April 2020 and June 2020

SELECT *
FROM `bigquery-public-data.covid19_tracking.covid_racial_data_tracker`
WHERE date > "2020-03-31" AND date <= "2020-06-30" 
ORDER BY date

--Let's see how many caucasions contracted the virus in each state between April 2020 and June 2020

SELECT cases_white, date, state
FROM `bigquery-public-data.covid19_tracking.covid_racial_data_tracker` 
WHERE date > "2020-03-31" AND date <= "2020-06-30" 
ORDER BY date 

--Let's see how many African American contracted the virus

SELECT cases_black, date, state
FROM `bigquery-public-data.covid19_tracking.covid_racial_data_tracker` 
WHERE date > "2020-03-31" AND date <= "2020-06-30" 
ORDER BY date 

--Let's see how many Latinos contracted the virus

SELECT cases_latinx, date, state
FROM `bigquery-public-data.covid19_tracking.covid_racial_data_tracker` 
WHERE date > "2020-03-31" AND date <= "2020-06-30" 
ORDER BY date 

--And let's see how many Asian Americans contracted the virus

SELECT cases_asian, date, state
FROM `bigquery-public-data.covid19_tracking.covid_racial_data_tracker` 
WHERE date > "2020-03-31" AND date <= "2020-06-30" 
ORDER BY date 

--Let's determine which race had the highest amount of cases in AL on April 12th, 2020

SELECT cases_white, cases_black, cases_latinx, cases_asian, date, state
FROM `bigquery-public-data.covid19_tracking.covid_racial_data_tracker` 
WHERE date = "2020-04-12" AND state = "AL"

