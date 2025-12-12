-- Data Exploration
select * from smoking.smoking
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/smoking.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';
-- Total number of rows
select count(*) as total_rows from smoking.smoking; 
-- Distinct value for each field
SELECT distinct gender from smoking.smoking;
SELECT distinct age from smoking.smoking order by age;
SELECT distinct marital_status from smoking.smoking;
SELECT distinct highest_qualification from smoking.smoking;
SELECT distinct nationality from smoking.smoking;
SELECT distinct ethnicity from smoking.smoking;
SELECT distinct gross_income from smoking.smoking order by gross_income;
SELECT distinct region from smoking.smoking;
SELECT distinct smoke from smoking.smoking;
SELECT distinct amt_weekends from smoking.smoking;
SELECT distinct amt_weekdays from smoking.smoking;
SELECT distinct smoking.type from smoking.smoking;
-- Age summary
SELECT min(age) as min_age, max(age) as max_age, avg(age) as avg_age from smoking.smoking
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/age_summary.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

-- Smoking prevalance rate
-- overall smoking rate
SELECT count(*) as total_people,
SUM(CASE when smoke='Yes' Then 1 else 0 END) as smokers,
SUM(case when smoke='No' then 1 else 0 END) as non_smokers,
ROUND(100*SUM(case when smoke='Yes' then 1 else 0 END)/count(*),1) as percent_of_smokers
from smoking.smoking 
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/overall_smoking_rate.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

-- smoking rate by gender
SELECT gender, COUNT(*) as total_people,
SUM(case when smoke='Yes' then 1 else 0 end) as smokers,
ROUND(100*SUM(case when smoke='Yes' then 1 else 0 end)/Count(*),1) as smokers_percent
from smoking.smoking group by gender
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/smoking_rateByGender.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

-- smoking rate by region
SELECT region, COUNT(*) as total_people,
SUM(case when smoke='Yes' then 1 else 0 end) as smokers,
ROUND(100*SUM(case when smoke='Yes' then 1 else 0 end)/Count(*),1) as smokers_percent
from smoking.smoking group by region 
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/smoking_rateByRegion.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

-- smoking rate by age bands
SELECT 
CASE 
when age<25 then '16-24'
when age between 25 and 34 then '25-34'
when age between 35 and 44 then '35-44'
when age between 45 and 54 then '45-54'
when age between 55 and 64 then '55-64'
when age>64 then '65+'
END as age_range,
count(*) as total_people,
SUM(case when smoke='Yes' then 1 else 0 End) as smokers,
Round(100*SUM(case when smoke='Yes' then 1 else 0 end)/count(*),1) as smokers_percent
from smoking.smoking group by age_range
order by field(age_range, '16-24','25-34','35-44','45-54','55-64','65+')
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/smoking_rateByAge.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

-- Cigarette consumption analysis
-- AVG weekend/weekdays consumption among smokers
SELECT ROUND(avg(amt_weekdays),2) as weekday_smokers,
ROUND(avg(amt_weekends),2) as weekend_smokers
from smoking.smoking where smoke='Yes'
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/avg_weekendWeekday_consumption.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

-- AVG cigarette per day across the week
SELECT ROUND(AVG((amt_weekdays*5 +amt_weekends*2)/7),2) as avg_daily_cig
from smoking.smoking where smoke='Yes'
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Avg_daily_cigs.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'; 

-- cigarette type distribution among smokers
SELECT smoking.type, count(*) as total_people,
ROUND(100* count(*)/(select count(*) from smoking.smoking where smoke='Yes'),2) as smokers_percent
from smoking.smoking where smoke='Yes' group by smoking.type
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cigs_type_distribution.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

-- intensity of smokers by cigarette types
SELECT smoking.type, ROUND(avg((amt_weekends*2 + amt_weekdays*5)/7),2) as avg_daily_cigs
from smoking.smoking where smoke='Yes' group by smoking.type
order by avg_daily_cigs
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/avg_daily_cigs_type.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

-- Demographics and smoking pattern
-- smoking vs highest qualification
SELECT highest_qualification, 
count(*) as total_people,
SUM(case when smoke='Yes' then 1 else 0 end) as smokers,
ROUND(100*SUM(case when smoke='Yes' then 1 else 0 end)/count(*),2) as percent_smokers
from smoking.smoking group by highest_qualification
order by percent_smokers desc
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/smokeVsHighestQualification.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

-- smoking vs income
SELECT gross_income, 
count(*) as total_people,
SUM(case when smoke='Yes' then 1 else 0 end) as smokers,
ROUND(100*SUM(case when smoke='Yes' then 1 else 0 end)/count(*),2) as percent_smokers
from smoking.smoking group by gross_income
order by percent_smokers desc
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/smoker_vs_income.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

-- smoking vs marital status
SELECT marital_status, 
count(*) as total_people,
SUM(case when smoke='Yes' then 1 else 0 end) as smokers,
ROUND(100*SUM(case when smoke='Yes' then 1 else 0 end)/count(*),2) as percent_smokers
from smoking.smoking group by marital_status
order by percent_smokers desc
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/smoker_vs_maritalStatus.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';


SELECT smoke, COUNT(*) 
FROM smoking.smoking
GROUP BY smoke
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/smoker_vs_non.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

SHOW VARIABLES LIKE 'secure_file_priv';