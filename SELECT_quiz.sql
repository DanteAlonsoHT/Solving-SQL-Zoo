/* SELECT Basics */

SELECT population FROM world
WHERE name = 'Germany'

SELECT name, population FROM world
WHERE name IN ('Sweden', 'Norway', 'Denmark');

SELECT name, area FROM world
WHERE area BETWEEN 200000 AND 250000

/* QUIZ 1 */

SELECT capital
FROM world
WHERE name = 'France'

SELECT name, population
FROM world
WHERE population BETWEEN 1000000 AND 1250000

SELECT name, population
FROM world
WHERE name LIKE 'Al%'

SELECT name FROM world
WHERE name LIKE '%a' OR name LIKE '%l'

FROM world
WHERE length(name)=5 and continent='Europe'

SELECT name, area*2 FROM world WHERE population = 64000

SELECT name, area, population
FROM world
WHERE area > 50000 AND population < 10000000

SELECT name, population/area
FROM world
WHERE name IN ('China', 'Nigeria', 'France', 'Australia')

/* SELECT from world */

SELECT name, continent, population FROM world

SELECT name
FROM world
WHERE population > 200000000

SELECT name, gdp/population
FROM world
WHERE population >= 200000000

SELECT name, population/1000000
FROM world
WHERE continent = 'South America'

SELECT name, population
FROM world
WHERE name IN ('France', 'Germany', 'Italy')

SELECT name
FROM world
WHERE name LIKE '%United%'

SELECT name, population, area
FROM world
WHERE area > 3000000 OR population > 250000000

SELECT name, population, area
FROM world
WHERE area > 3000000 AND NOT population > 250000000 OR 
NOT area > 3000000 AND population > 250000000

SELECT name, ROUND(population/1000000, 2), ROUND(GDP/1000000000,2)
FROM world
WHERE continent = 'South America'

SELECT name, ROUND(gdp/population,-3)
FROM world
WHERE gdp > 1000000000000

SELECT name, capital
FROM world
WHERE LEN(name) = LEN(capital)

SELECT name, capital
FROM world
WHERE LEFT(name,1) = LEFT(capital,1) AND NOT name = capital

SELECT name
FROM world
WHERE name LIKE '%a%' AND name LIKE '%e%' AND name LIKE '%i%' AND name LIKE '%o%' AND name LIKE '%u%' AND NOT name LIKE '% %'

/* QUIZ 2 */

SELECT name
FROM world
WHERE name LIKE 'U%'

SELECT population
FROM world
WHERE name = 'United Kingdom'

SELECT continent 
FROM world 
WHERE name = 'France'

SELECT name, population / 10 
FROM world 
WHERE population < 10000

SELECT name, population
FROM world
WHERE continent IN ('Europe', 'Asia')

SELECT name FROM world
WHERE name IN ('Cuba', 'Togo')

SELECT name FROM world
WHERE continent = 'South America'
AND population > 40000000

/* Quiz 3 */

SELECT winner FROM nobel
WHERE winner LIKE 'C%' AND winner LIKE '%n'

SELECT COUNT(subject) FROM nobel
WHERE subject = 'Chemistry'
AND yr BETWEEN 1950 and 1960

SELECT COUNT(DISTINCT yr) FROM nobel
WHERE yr NOT IN (SELECT DISTINCT yr FROM nobel WHERE subject = 'Medicine')

SELECT subject, winner FROM nobel WHERE winner LIKE 'Sir%' AND yr LIKE '196%'

SELECT yr FROM nobel
WHERE yr NOT IN(SELECT yr 
FROM nobel
WHERE subject IN ('Chemistry','Physics'))

SELECT DISTINCT yr
FROM nobel
WHERE subject='Medicine' 
AND yr NOT IN(SELECT yr FROM nobel 
WHERE subject='Literature')
AND yr NOT IN (SELECT yr FROM nobel
WHERE subject='Peace')

SELECT subject, COUNT(subject) 
FROM nobel 
WHERE yr ='1960' 
GROUP BY subject

/* SELECT in SELECT */

SELECT name FROM world
WHERE population >
(SELECT population FROM world
WHERE name='Russia')

SELECT name FROM world
WHERE continent = 'Europe' AND gdp/population > (
SELECT gdp/population FROM world
WHERE name = 'United Kingdom')

SELECT name, continent FROM world
WHERE continent IN (SELECT continent FROM world 
WHERE name IN ('Argentina ','Australia'))

SELECT name, population FROM world
WHERE population > (SELECT population FROM world WHERE name = 'Canada') AND
population < (SELECT population FROM world WHERE name = 'Poland')

SELECT name, 
CONCAT  (CAST (100*population/(SELECT population 
FROM world 
WHERE name 
='Germany') AS DECIMAL(5,0)),'%') as  percentage
FROM world
WHERE continent = 'Europe';

SELECT name
FROM world
WHERE gdp> ALL(SELECT gdp FROM world WHERE continent = 'Europe' AND gdp > 0)

SELECT continent, name, area FROM world x
WHERE area > ALL
(SELECT area FROM world y
WHERE y.area > x.area AND y.continent = x.continent) AND area > 0

SELECT continent, name FROM world x
WHERE name < ALL
(SELECT name FROM world y
WHERE x.name != y.name AND  y.continent = x.continent)

SELECT name, continent, population FROM world x
WHERE 25000000 > ALL(SELECT population FROM world y WHERE x.continent = y.continent)

SELECT name, continent FROM world x
WHERE population > ALL(SELECT population*3 FROM world y WHERE x.continent = y.continent
AND x.name <> y.name)
