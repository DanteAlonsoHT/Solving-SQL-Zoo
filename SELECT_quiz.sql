/* SELECT Basics */

-- 1

SELECT population FROM world
WHERE name = 'Germany'

-- 2

SELECT name, population FROM world
WHERE name IN ('Sweden', 'Norway', 'Denmark');

-- 3

SELECT name, area FROM world
WHERE area BETWEEN 200000 AND 250000

/* QUIZ 1 */

-- 1

SELECT capital
FROM world
WHERE name = 'France'

-- 2

SELECT name, population
FROM world
WHERE population BETWEEN 1000000 AND 1250000

-- 3

SELECT name, population
FROM world
WHERE name LIKE 'Al%'

-- 4

SELECT name FROM world
WHERE name LIKE '%a' OR name LIKE '%l'

-- 5

FROM world
WHERE length(name)=5 and continent='Europe'

-- 6

SELECT name, area*2 FROM world WHERE population = 64000

-- 7

SELECT name, area, population
FROM world
WHERE area > 50000 AND population < 10000000

-- 8

SELECT name, population/area
FROM world
WHERE name IN ('China', 'Nigeria', 'France', 'Australia')

/* SELECT from world */

-- 1

SELECT name, continent, population FROM world

-- 2

SELECT name
FROM world
WHERE population > 200000000

-- 3

SELECT name, gdp/population
FROM world
WHERE population >= 200000000

-- 4

SELECT name, population/1000000
FROM world
WHERE continent = 'South America'

-- 5

SELECT name, population
FROM world
WHERE name IN ('France', 'Germany', 'Italy')

-- 6

SELECT name
FROM world
WHERE name LIKE '%United%'

-- 7

SELECT name, population, area
FROM world
WHERE area > 3000000 OR population > 250000000

-- 8

SELECT name, population, area
FROM world
WHERE area > 3000000 AND NOT population > 250000000 OR 
NOT area > 3000000 AND population > 250000000

-- 9

SELECT name, ROUND(population/1000000, 2), ROUND(GDP/1000000000,2)
FROM world
WHERE continent = 'South America'

-- 10

SELECT name, ROUND(gdp/population,-3)
FROM world
WHERE gdp > 1000000000000

-- 11

SELECT name, capital
FROM world
WHERE LEN(name) = LEN(capital)

-- 12

SELECT name, capital
FROM world
WHERE LEFT(name,1) = LEFT(capital,1) AND NOT name = capital

-- 13

SELECT name
FROM world
WHERE name LIKE '%a%' AND name LIKE '%e%' AND name LIKE '%i%' AND name LIKE '%o%' AND name LIKE '%u%' AND NOT name LIKE '% %'

/* QUIZ 2 */

-- 1

SELECT name
FROM world
WHERE name LIKE 'U%'

-- 2

SELECT population
FROM world
WHERE name = 'United Kingdom'

-- 3

SELECT continent 
FROM world 
WHERE name = 'France'

-- 4

SELECT name, population / 10 
FROM world 
WHERE population < 10000

-- 5

SELECT name, population
FROM world
WHERE continent IN ('Europe', 'Asia')

-- 6

SELECT name FROM world
WHERE name IN ('Cuba', 'Togo')

-- 7

SELECT name FROM world
WHERE continent = 'South America'
AND population > 40000000

/* Quiz 3 */

-- 1

SELECT winner FROM nobel
WHERE winner LIKE 'C%' AND winner LIKE '%n'

-- 2

SELECT COUNT(subject) FROM nobel
WHERE subject = 'Chemistry'
AND yr BETWEEN 1950 and 1960

-- 3

SELECT COUNT(DISTINCT yr) FROM nobel
WHERE yr NOT IN (SELECT DISTINCT yr FROM nobel WHERE subject = 'Medicine')

-- 4

SELECT subject, winner FROM nobel WHERE winner LIKE 'Sir%' AND yr LIKE '196%'

-- 5

SELECT yr FROM nobel
WHERE yr NOT IN(SELECT yr 
FROM nobel
WHERE subject IN ('Chemistry','Physics'))

-- 6

SELECT DISTINCT yr
FROM nobel
WHERE subject='Medicine' 
AND yr NOT IN(SELECT yr FROM nobel 
WHERE subject='Literature')
AND yr NOT IN (SELECT yr FROM nobel
WHERE subject='Peace')

-- 7

SELECT subject, COUNT(subject) 
FROM nobel 
WHERE yr ='1960' 
GROUP BY subject

/* SELECT in SELECT */

-- 1

SELECT name FROM world
WHERE population >
(SELECT population FROM world
WHERE name='Russia')

-- 2

SELECT name FROM world
WHERE continent = 'Europe' AND gdp/population > (
SELECT gdp/population FROM world
WHERE name = 'United Kingdom')

-- 3

SELECT name, continent FROM world
WHERE continent IN (SELECT continent FROM world 
WHERE name IN ('Argentina ','Australia'))

-- 4

SELECT name, population FROM world
WHERE population > (SELECT population FROM world WHERE name = 'Canada') AND
population < (SELECT population FROM world WHERE name = 'Poland')

-- 5

SELECT name, 
CONCAT  (CAST (100*population/(SELECT population 
FROM world 
WHERE name 
='Germany') AS DECIMAL(5,0)),'%') as  percentage
FROM world
WHERE continent = 'Europe';

-- 6

SELECT name
FROM world
WHERE gdp> ALL(SELECT gdp FROM world WHERE continent = 'Europe' AND gdp > 0)

-- 7

SELECT continent, name, area FROM world x
WHERE area > ALL
(SELECT area FROM world y
WHERE y.area > x.area AND y.continent = x.continent) AND area > 0

-- 8

SELECT continent, name FROM world x
WHERE name < ALL
(SELECT name FROM world y
WHERE x.name != y.name AND  y.continent = x.continent)

-- 9

SELECT name, continent, population FROM world x
WHERE 25000000 > ALL(SELECT population FROM world y WHERE x.continent = y.continent)

-- 10

SELECT name, continent FROM world x
WHERE population > ALL(SELECT population*3 FROM world y WHERE x.continent = y.continent
AND x.name <> y.name)

/* Quiz 4 */

-- 1

SELECT region, name, population FROM bbc x WHERE population <= ALL (SELECT population FROM bbc y WHERE y.region=x.region AND population>0)

-- 2

SELECT name,region,population FROM bbc x WHERE 50000 < ALL (SELECT population FROM bbc y WHERE x.region=y.region AND y.population>0)

-- 3

SELECT name, region FROM bbc x
WHERE population < ALL (SELECT population/3 FROM bbc y WHERE y.region = x.region AND y.name != x.name)

-- 4

SELECT name FROM bbc
WHERE population >
(SELECT population
FROM bbc
WHERE name='United Kingdom')
AND region IN
(SELECT region
FROM bbc
WHERE name = 'United Kingdom')

-- 5

SELECT name FROM bbc
WHERE gdp > (SELECT MAX(gdp) FROM bbc WHERE region = 'Africa')

-- 6

SELECT name FROM bbc
WHERE population < (SELECT population FROM bbc WHERE name='Russia')
AND population > (SELECT population FROM bbc WHERE name='Denmark')

-- 7

SELECT name FROM bbc
WHERE population > ALL
(SELECT MAX(population)
FROM bbc
WHERE region = 'Europe')
AND region = 'South Asia'