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
