SELECT SUM(population)
FROM world

SELECT continent FROM world

SELECT SUM(gdp)
FROM world
WHERE continent = 'Africa'

SELECT COUNT(name)
FROM world
WHERE area > 1000000

SELECT SUM(population)
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania')

SELECT continent, COUNT(name) FROM world
GROUP BY continent

SELECT continent, COUNT(name)
FROM world 
WHERE population > 10000000 GROUP BY continent

SELECT continent
FROM world 
WHERE population >= 100000000 GROUP BY continent

/* Quiz */

SELECT SUM(population) FROM bbc WHERE region = 'Europe'

SELECT COUNT(name) FROM bbc WHERE population < 150000


AVG(), COUNT(), MAX(), MIN(), SUM()

SELECT region, SUM(area)
FROM bbc 
WHERE SUM(area) > 15000000 
GROUP BY region
/*No result due to invalid use of the WHERE function*/

SELECT AVG(population) FROM bbc WHERE name IN ('Poland', 'Germany', 'Denmark')

SELECT region, SUM(population)/SUM(area) AS density FROM bbc GROUP BY region

SELECT name, population/area AS density FROM bbc WHERE population = (SELECT MAX(population) FROM bbc)

SELECT region, SUM(area) 
FROM bbc 
GROUP BY region 
HAVING SUM(area)<= 20000000