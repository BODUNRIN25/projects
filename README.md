# Layoffs Analysis

## Table of contents

- [Project Overview](#project-overview)
- [Exploratory Data Analysis](#exploratory-data-analysis)


### Project overview
This data analysis project aims to investigate global company layoffs over the past three years. By analyzing various aspects of the dataset, I seek to uncover patterns, trends, and gain a deeper understanding of this phenomenon.

## Data sources
Layoffs data: This analysis utilizes the "layoffs.csv" dataset, which contains detailed information on layoffs conducted by companies globally.

## Tools
- Sql server - Data cleaning
- PowerBI - Creating reports

### Data Cleaning/Preparation

In the intial data preparation phase wei performed the following task:
1. Data loading and inspection
2. Handling missing Values
3. Data cleaning and Formating

### Exploratory Data Analysis

The exploratory data analysis of layoffs data addressed several key research questions, including: the overall trend in layoffs by year, identification of the year with the highest global layoff count, determination of the industry and countries most impacted by layoffs, and an assessment of the relationship between company status (e.g., post-IPO, acquired) and layoff frequency.


### Data Analysis

```sql
-- this query retrives the number of companies that layoff workers by country
select country, COUNT(company) num_companies, SUM(total_laid_off) total_layoffs
from layoffs2
group by country
order by num_companies desc;

-- this query retrieves the total layoffs by year
select YEAR(date) Year, SUM(total_laid_off) tlayoffs
from layoffs2
where date is not NULL
group by YEAR(date)
order by tlayoffs desc;

-- this query retrieves the industries with the most layoffs in descending order
select industry, SUM(total_laid_off) tlayoffs
from layoffs2
group by industry
order by tlayoffs desc;

-- this query retrieves the most layoffs by stage in descending order
select stage, SUM(total_laid_off) tlayoffs
from layoffs2
group by stage
order by tlayoffs desc;
```

### Result/Findings

The analysis yielded the following key results:

- Post-IPO companies exhibited the highest incidence of layoffs.
- The consumer industry experienced the greatest number of layoffs.
- The United States recorded the highest volume of layoffs.
- The year 2023 witnessed the highest concentration of layoffs within a single month.

## Limitations
Companies missing both percentage_laid_off and total_laid_off were removed to ensure the accuracy of the analysis.  While companies missing only percentage_laid_off were retained, this data gap prevented a full exploration of individual company workforce scale.







