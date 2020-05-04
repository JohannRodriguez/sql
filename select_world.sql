SELECT name, continent, population FROM world;

SELECT name FROM world
WHERE population >= 200000000;

SELECT name, gdp/population FROM world
WHERE population >= 200000000;

SELECT name, population/1000000
FROM world
WHERE continent = 'South America';

SELECT name, population
FROM world
WHERE name = 'France' OR name = 'Germany' OR name = 'Italy';

SELECT name
FROM world
WHERE name LIKE '%United%';

SELECT name, population, area
FROM world
WHERE population >= 250000000 OR area >= 3000000;

SELECT name, population, area
FROM world
WHERE population >= 250000000 XOR area >= 3000000;

SELECT name, ROUND(population/1000000, 2) AS RoundValue, ROUND(gdp/1000000000, 2) AS RoundValue
FROM world
WHERE continent = 'South America';

SELECT name, ROUND(gdp/population, -3)
FROM world
WHERE gdp > 1000000000000;

SELECT name, capital
FROM world
WHERE LENGTH(name) LIKE LENGTH(capital);
 
SELECT name, capital
FROM world
WHERE LEFT(name, 1) LIKE LEFT(capital, 1) AND name NOT LIKE capital;

SELECT name
   FROM world
WHERE name LIKE '%a%' AND name LIKE '%e%' AND name LIKE '%i%' AND name LIKE '%o%' AND name LIKE '%u%' AND name NOT LIKE '% %'
