use world;

-- Q-1 Using COUNT, get the number of cities in the USA.

SELECT count(CountryCode) FROM city WHERE countrycode = 'USA';

-- Q-2 Find out the population and life expectancy for people in Argentina.

SELECT population, lifeexpectancy FROM country WHERE code = 'ARG';

-- Q-3  Using IS NOT NULL, ORDER BY, and LIMIT, which country has the highest life expectancy?

SELECT * FROM country WHERE lifeexpectancy IS NOT NULL ORDER BY lifeexpectancy DESC LIMIT 1;

-- Q-4 Using JOIN ... ON, find the capital city of Spain.

SELECT city.name FROM country JOIN city ON country.capital = city.id WHERE country.code = 'ESP';
 
-- Q-5 Using JOIN ... ON, list all the languages spoken in the Southeast Asia region.

SELECT cl.language FROM country c JOIN countrylanguage cl ON c.code = cl.countrycode WHERE c.region = 'Southeast Asia';

-- Q-6 Using a single query, list 25 cities around the world that start with the letter F.

SELECT name FROM city WHERE SUBSTRING(name FROM 1 FOR 1) = 'F' LIMIT 25;

-- Q-7 Using COUNT and JOIN ... ON, get the number of cities in China.

SELECT COUNT(*) FROM city WHERE CountryCode = 'chn';

-- Q-8 Using IS NOT NULL, ORDER BY, and LIMIT, which country has the lowest population? Discard non-zero populations.

SELECT * FROM city WHERE population IS NOT NULL ORDER BY population ASC LIMIT 1;

-- Q-9 Using aggregate functions, return the number of countries the database contains.

SELECT DISTINCT COUNT(`code`) FROM country;

-- Q-10  What are the top ten largest countries by area?

SELECT * FROM country WHERE SurfaceArea ORDER BY SurfaceArea DESC LIMIT 10;

-- Q-11 List the five largest cities by population in Japan.
SELECT co.Name, ci.Name AS city_name, ci.Population
FROM country AS co
JOIN city AS ci ON ci.CountryCode=co.Code
WHERE co.Code='JPN'
ORDER BY ci.Population DESC
LIMIT 5;

-- Q-12 List the names and country codes of every country with Elizabeth II as its Head of State. You will need to fix the mistake first!
-- Updated the mistake>
UPDATE `world`.`country` SET `HeadOfState` = 'Elizabeth II' WHERE (`HeadOfState` = 'Elisabeth II');
-- List the countries>
SELECT * FROM country WHERE HeadOfState = 'Elizabeth II';

-- Q-13 List the top ten countries with the smallest population-to-area ratio. Discard any countries with a ratio of 0.
SELECT * FROM country;
SELECT `name`, Population/SurfaceArea AS RATIO FROM country 
WHERE (Population/SurfaceArea) >0 
ORDER BY RATIO LIMIT 10 ;

-- Q-14 List every unique world language.
SELECT DISTINCT(`language`) FROM countrylanguage;

SELECT DISTINCT count(`language`) FROM countrylanguage;

-- Q-15 List the names and GNP of the world's top 10 richest countries.

SELECT `name`, gnp FROM country ORDER BY gnp DESC LIMIT 10;

-- Q-16 List the names of, and number of languages spoken by, the top ten most multilingual countries.

SELECT c.Name, COUNT(cl.Language)
FROM country AS c
JOIN countrylanguage AS cl ON cl.CountryCode=c.Code
GROUP BY c.Name
ORDER BY COUNT(cl.Language) DESC 
LIMIT 10;

-- Q-17 List every country where over 50% of its population can speak German.

SELECT c.Name, cl.Language, cl.Percentage
FROM country AS c
JOIN countrylanguage AS cl ON cl.CountryCode=c.Code
WHERE Language='German'
HAVING Percentage>50
ORDER BY cl.Percentage DESC;

-- Q-18 Which country has the worst life expectancy? Discard zero or null values.

SELECT * FROM country WHERE LifeExpectancy IS NOT NULL AND lIfeExpectancy > 0 ORDER BY LifeExpectancy asc LIMIT 1;

-- Q-19 List the top three most common government forms.

SELECT Name, GovernmentForm FROM country;
SELECT GovernmentForm, COUNT(GovernmentForm) AS gov_count
FROM country
GROUP BY GovernmentForm
HAVING gov_count >1 
ORDER BY gov_count DESC
LIMIT 3;

-- Q-20 How many countries have gained independence since records began?

SELECT `name`, IndepYear FROM country;
SELECT COUNT(IndepYear) AS numberofindep FROM country WHERE indepyear IS NOT NULL;


