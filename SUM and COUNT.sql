-- 1

SELECT SUM(population)
FROM world

-- 2

SELECT continent FROM world

-- 3

SELECT SUM(gdp)
FROM world
WHERE continent = 'Africa'

-- 4

SELECT COUNT(name)
FROM world
WHERE area > 1000000

-- 5

SELECT SUM(population)
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania')

-- 6

SELECT continent, COUNT(name) FROM world
GROUP BY continent

-- 7

SELECT continent, COUNT(name)
FROM world 
WHERE population > 10000000 GROUP BY continent

-- 8

SELECT continent
FROM world 
WHERE population >= 100000000 GROUP BY continent

/* Quiz */

-- 1

SELECT SUM(population) FROM bbc WHERE region = 'Europe'

-- 2

SELECT COUNT(name) FROM bbc WHERE population < 150000

-- 3

AVG(), COUNT(), MAX(), MIN(), SUM()

-- 4

SELECT region, SUM(area)
FROM bbc 
WHERE SUM(area) > 15000000 
GROUP BY region
/*No result due to invalid use of the WHERE function*/

-- 5

SELECT AVG(population) FROM bbc WHERE name IN ('Poland', 'Germany', 'Denmark')

-- 6

SELECT region, SUM(population)/SUM(area) AS density FROM bbc GROUP BY region

-- 7

SELECT name, population/area AS density FROM bbc WHERE population = (SELECT MAX(population) FROM bbc)

-- 8

SELECT region, SUM(area) 
FROM bbc 
GROUP BY region 
HAVING SUM(area)<= 20000000