/*NOTE: Per capita income (PCI) or average income measures the average income earned per person in a given area (city, region, country, etc.) in a specified year. It is calculated by dividing the area's total income by its total population.*/
show databases; /*Shows a list of databases*/

use foreign_sales; /*Using the database, foreign sales*/

CREATE TABLE Census_data(
COMMUNITY_AREA_NUMBER INT,
COMMUNITY_AREA_NAME VARCHAR(30)            NOT NULL,
PERCENT_OF_HOUSING_CROWDED DECIMAL (18,1),
PERCENT_HOUSEHOLDS_BELOW_POVERTY DECIMAL (18,1),
PERCENT_AGED_16ANDUP_UNEMPLOYED DECIMAL (18,1),
PERCENT_AGED_25ANDUP_WITHOUT_HIGH_SCHOOL_DIPLOMA DECIMAL(18,1),
PERCENT_AGED_UNDER_18_OR_OVER_64  DECIMAL (18,1),
PER_CAPITA_INCOME  INT,
HARDSHIP_INDEX  INT
); /*Created census table*/

SELECT * FROM Census_data; /*Shows everything from the census_data table that got imported*/

SELECT AVG(PERCENT_AGED_16ANDUP_UNEMPLOYED)
    FROM Census_data; /*Average percentage of the people aged 16 and up who are unemployed in the dataset*/

SELECT AVG(PERCENT_AGED_25ANDUP_WITHOUT_HIGH_SCHOOL_DIPLOMA)
    FROM Census_data; /*Average percentage of the people aged 25 and up who have no high school diploma in the dataset*/

SELECT AVG(PER_CAPITA_INCOME)
    FROM Census_data; /*Average of the per capita income in the dataset*/
    
SELECT AVG(PERCENT_HOUSEHOLDS_BELOW_POVERTY)
    FROM Census_data; /*Average of the percent of households below poverty in the dataset*/
    
SELECT MIN(PERCENT_AGED_16ANDUP_UNEMPLOYED) least, 
     MAX(PERCENT_AGED_16ANDUP_UNEMPLOYED) max
  FROM Census_data; /*Selecting the minimum and maximum perecentages of those that are ages 16 and up unemployed*/
 
SELECT MIN(PERCENT_AGED_25ANDUP_WITHOUT_HIGH_SCHOOL_DIPLOMA) least, 
     MAX(PERCENT_AGED_25ANDUP_WITHOUT_HIGH_SCHOOL_DIPLOMA) max
  FROM Census_data; /*Selecting the minimum and maximum perecentages of those that are ages 25 and up without a high school diploma*/
  
  SELECT MIN(PER_CAPITA_INCOME) least, 
     MAX(PER_CAPITA_INCOME) max
  FROM Census_data; /*Selecting the minimum and maximum per capita income*/
  
  SELECT MIN(PERCENT_HOUSEHOLDS_BELOW_POVERTY) least, 
     MAX(PERCENT_HOUSEHOLDS_BELOW_POVERTY) max
  FROM Census_data; /*Selecting the minimum and maximum of the percentage of households below poverty*/ 
  
  ALTER TABLE Census_data
    DROP COMMUNITY_AREA_NUMBER; /*Dropping the commnunity area number column*/
    
ALTER TABLE Census_data
    DROP HARDSHIP_INDEX; /*Dropping the hardship index column*/
    
SELECT * FROM Census_data;

SELECT COMMUNITY_AREA_NAME, PERCENT_HOUSEHOLDS_BELOW_POVERTY
FROM Census_data
WHERE PERCENT_HOUSEHOLDS_BELOW_POVERTY > 10; /*Filtered the data to select the community area name and the percent of households below poverty where the percent of households below poverty is greater than 10%*/

SELECT NOW();/*Current time which is 7:04 July 20th, 2020*/

SELECT * FROM Census_data;

CREATE VIEW CHICAGO_VIEW AS
SELECT COMMUNITY_AREA_NAME, PER_CAPITA_INCOME
FROM Census_data
WHERE PER_CAPITA_INCOME < 50000; /* Created a view called CHICAGO_VIEW Filtering dataset to only grab rows where the per capita income is less than 50,000*/

SELECT * FROM CHICAGO_VIEW; /*Shows all of the rows of the chicago_view view*/

SELECT MIN(PER_CAPITA_INCOME) least,
	MAX(PER_CAPITA_INCOME) max 
  FROM CHICAGO_VIEW; /*Selects the minimum and maximum per capita income from the view*/
  
SELECT AVG(PER_CAPITA_INCOME)
   FROM CHICAGO_VIEW; /*Shows the average of the per capita income in from the view*/

CREATE TABLE chicago_schools(
School_ID INT,
NAME_OF_SCHOOL longtext             NOT NULL,
HEALTHY_SCHOOL_CERTIFIED VARCHAR(3)      NOT NULL,
SAFETY_SCORE VARCHAR(3)                         ,                   
COLLEGE_ENROLLMENT INT,
COMMUNITY_AREA_NUMBER INT,
COMMUNITY_AREA_NAME VARCHAR(30)          NOT NULL
); /*Created table chicago_schools*/

SELECT * FROM chicago_schools; /*Shows a table of chicago_schools dataset*/

SELECT COUNT(*) FROM chicago_schools; /*Counts the total number of rows in the dataset*/

SELECT COUNT(*) FROM chicago_schools
  WHERE HEALTHY_SCHOOL_CERTIFIED = "Yes"; /* Counts the number of records where the healthy school certified is yes*/

SELECT COUNT(*) FROM chicago_schools
  WHERE HEALTHY_SCHOOL_CERTIFIED = "No";  /* Counts the number of records where the healthy school certified is no*/

DROP TABLE chicago_schools; /*Gets rid of the table*/

SELECT MIN(COLLEGE_ENROLLMENT) least,
    MAX(COLLEGE_ENROLLMENT) max
FROM chicago_schools; /*Selects the least and maximum college enrollment for the schools*/

SELECT * FROM chicago_schools;

ALTER TABLE chicago_schools
  ORDER BY School_ID, COMMUNITY_AREA_NUMBER; /*Ordering by school id and community area number*/
  
ALTER TABLE chicago_schools
  ORDER BY School_ID;/*Ordering by school id*/

SELECT * FROM chicago_schools;

SELECT AVG(COLLEGE_ENROLLMENT)
  FROM chicago_schools; /*Average of the college enrollment in the dataset*/
  
SELECT School_ID, NAME_OF_SCHOOL, COMMUNITY_AREA_NAME
FROM chicago_schools
WHERE COLLEGE_ENROLLMENT < 1000; /*Selecting school id, name of school, and the community area name where the college enrollment is less than 1000*/

SELECT School_ID, NAME_OF_SCHOOL, COMMUNITY_AREA_NAME
FROM chicago_schools
WHERE COLLEGE_ENROLLMENT > 1000; /*Selecting school id, name of school, and the community area name where the college enrollment is greater than 1000*/

CREATE VIEW CHICAGO_SCHOOLSVIEW2 AS
SELECT School_ID, NAME_OF_SCHOOL, SAFETY_SCORE, COLLEGE_ENROLLMENT
FROM chicago_schools
WHERE HEALTHY_SCHOOL_CERTIFIED = "No"
ORDER BY School_ID; /*View that includes the school id, name of the school, safety score, and the college enrollment. All of these are not healthy school certified and ordered by school ID*/

SELECT * FROM CHICAGO_SCHOOLSVIEW2; /* querying the view as we would query an actual table*/

SELECT AVG(COLLEGE_ENROLLMENT)
   FROM CHICAGO_SCHOOLSVIEW2; /*Average of college cnrollment in the view*/

SELECT MIN(COLLEGE_ENROLLMENT) min,
    MAX(COLLEGE_ENROLLMENT) max
    FROM CHICAGO_SCHOOLSVIEW2; /*Selects the minimum and maximum college enrollment*/

SELECT AVG(SAFETY_SCORE)
  FROM CHICAGO_SCHOOLSVIEW2; /*Calculates the average of the safety score in the dataset*/

CREATE VIEW CHICAGO_SCHOOLSVIEW3 AS
SELECT School_ID, NAME_OF_SCHOOL, SAFETY_SCORE, COLLEGE_ENROLLMENT
FROM chicago_schools
WHERE HEALTHY_SCHOOL_CERTIFIED = "Yes"
ORDER BY School_ID; /*View that includes the school id, name of the school, safety score, and the college enrollment. All of these are healthy school certified and ordered by school ID*/
 
SELECT * FROM CHICAGO_SCHOOLSVIEW3; /* querying the view as we would query an actual table*/

SELECT AVG(SAFETY_SCORE), AVG(COLLEGE_ENROLLMENT)
FROM CHICAGO_SCHOOLSVIEW3; /*Shows the aveage safety score and average college enrollment*/







