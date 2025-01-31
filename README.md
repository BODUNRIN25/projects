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

EDA involved exploring layoffs data sales data to answer key questions, such as:

- What is the overall layoffs trend
- what industry had the most layoffs?
- is there a relationship between funding and percentage of layoffs?
- What Year had the most layoffs?


### Data Analysis

```sql
SELECT *
FROM layoffs
WHERE percentage_layoffs = 1;
```

### Result/Findings

The Analysis results are summarized below:
1. The big guns had the most layoffs during the covid periods
2. The retail industry laid off the most
3. The is a 0.65 percent relationship between funding and layoffs

### Recommendation

Based on the analysis, i recommend the following actions: 
- Encourage remote working

## Limitations
We removed all null values from the percentage layoffs columns and the total layyoffs because they would have affected the anaysis and the accuracy of the conclusions. There are still few outliers after the ommisions but we can see that there is a positive correlaton.







