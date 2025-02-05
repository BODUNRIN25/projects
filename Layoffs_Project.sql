-- Data cleaning
select * 
from layoffs;

select * 
from layoffs
where industry = 'NULL';

select *
from layoffs
where total_laid_off = 'NULL';

select *
from layoffs
where total_laid_off = 1;

UPDATE layoffs2
SET percentage_laid_off = TRY_CONVERT(DECIMAL(4, 2), percentage_laid_off); 

UPDATE layoffs2
SET percentage_laid_off = ROUND(percentage_laid_off, 2); 

UPDATE layoffs2
SET total_laid_off = TRY_CONVERT(int, total_laid_off);

UPDATE layoffs2
SET funds_raised_millions = TRY_CONVERT(int, funds_raised_millions);

ALTER TABLE layoffs2
ALTER COLUMN percentage_laid_off DECIMAL(4, 2);

ALTER TABLE layoffs2
ALTER COLUMN total_laid_off int;

ALTER TABLE layoffs2
ALTER COLUMN funds_raised_millions int;

select COUNT(company)
from layoffs;

select COUNT(Distinct(company))
from layoffs;


select min(Distinct(date)) as start_date, max(Distinct(date)) end_date
from layoffs;


SELECT TOP 0 *
INTO layoffs2
FROM layoffs;

select *
from layoffs2

EXEC sp_help 'layoffs2';

insert into layoffs2
select *
from layoffs;


with CTE AS (
	select *,ROW_NUMBER() OVER (PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,date,stage,country,funds_raised_millions ORDER BY company) as number
	from layoffs2
	)
select *
from CTE
where number > 1;

 select *
 from layoffs2
 where company = 'Casper'

  select *
 from layoffs2
 where company = 'Cazoo'

 with CTE AS (
	select *,ROW_NUMBER() OVER (PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,date,stage,country,funds_raised_millions ORDER BY company) as number
	from layoffs2
	)
delete from CTE
where number > 1;


-- STANDARDIZING DATA

select (trim(company))
from layoffs2;

update layoffs2
set company = TRIM(company);

select distinct(industry)
from layoffs2;

select *
from layoffs
where industry is null

select *
from layoffs2
where industry like 'crypto%'


update layoffs2
set industry = 'Crypto'
where industry like 'crypto%'

select distinct(location)
from layoffs2;

select distinct(country)
from layoffs2;

select distinct(country), TRIM(trailing '.' from country)
from layoffs2;

update layoffs2
set country = TRIM(trailing '.' from country);

update layoffs2
set date = CONVERT(DATE, date, 101);

select *
from layoffs2
where total_laid_off is null
AND percentage_laid_off is null;

select * 
from layoffs2
where industry is null
OR industry = '';

select * 
from layoffs2
where industry = 'NULL';

select * 
from layoffs2
where company like '%Bally%';


select * 
from layoffs
where company = 'Airbnb'

select t1.industry, t2.industry
from layoffs2 t1
join layoffs2 t2 on
t1.company = t2.company And t1.location = t2.location
where t1.industry is null
and t2.industry is not null;

UPDATE t1
SET industry = t2.industry
FROM layoffs2 AS t1  
INNER JOIN layoffs2 AS t2 
    ON t1.company = t2.company
   AND t1.location = t2.location
WHERE t1.industry IS NULL
  AND t2.industry IS NOT NULL;

 update layoffs2
 set industry = coalesce(industry, null)
 where industry = NULL;

select distinct(industry)
from layoffs2;


delete
from layoffs2
where total_laid_off is null
AND percentage_laid_off is null;



-- Exploratory Data analysis


-- this query retrieves the company with the most layoffs in one day
select MAX(total_laid_off) as highest_layoff, MAX(percentage_laid_off) percent_layoffs
from layoffs2;

select company, SUM(total_laid_off) tlayoffs
from layoffs2
group by company
order by tlayoffs desc;

select company, total_laid_off,funds_raised_millions
from layoffs2
order by total_laid_off desc;

-- this query retrieves the countries with the most layoffs in descending order
select country, SUM(total_laid_off) tlayoffs
from layoffs2
group by country
order by tlayoffs desc;

-- this query retrieves the most layoffs by location and country in descending order
select location, country, SUM(total_laid_off) tlayoffs
from layoffs2
group by location, country
order by tlayoffs desc;

-- this query retrieves the most layoffs by stage in descending order
select stage, SUM(total_laid_off) tlayoffs
from layoffs2
group by stage
order by tlayoffs desc;

-- this query retrieves the industries with the most layoffs in descending order
select industry, SUM(total_laid_off) tlayoffs
from layoffs2
group by industry
order by tlayoffs desc;

-- this query retrieves the total layoffs by year
select YEAR(date) Year, SUM(total_laid_off) tlayoffs
from layoffs2
where date is not NULL
group by YEAR(date)
order by tlayoffs desc;

-- this query retrives the number of companies that layoff workers by country
select country, COUNT(company) num_companies, SUM(total_laid_off) total_layoffs
from layoffs2
group by country
order by num_companies desc;

-- Query retrieves the number of companies that that shut down by country, and year
select Year(date) years, country, COUNT(company) num_companies, SUM(total_laid_off) total_layoffs
from layoffs2
where percentage_laid_off = 1
group by Year(date), country
order by num_companies desc;

select COUNT(*)
from layoffs2
where percentage_laid_off is NULL;


-- this query retrieves the compnies that shut down
select *
from layoffs2
where percentage_laid_off = 1;
 
select * 
from layoffs2;


select CAST(YEAR(date)) as varchar(4) + 'Q' + cast(QUATER(date)) as varchar(1) as Quater
from layoffs2

SELECT CONCAT(YEAR(date), 'Q', DATEPART(quarter, date)) AS Quater,SUM(total_laid_off) total_layoffs
FROM layoffs2
group by CONCAT(YEAR(date), 'Q', DATEPART(quarter, date))
order by Quater

