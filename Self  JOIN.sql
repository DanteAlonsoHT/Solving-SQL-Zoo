-- 1 

SELECT COUNT(id)
FROM stops

-- 2

SELECT id
FROM stops
WHERE name = 'Craiglockhart'

-- 3

SELECT id, name 
FROM stops JOIN route ON id = stop
WHERE company = 'LRT' AND num = '4';

-- 4

SELECT company, num, COUNT(*)
FROM route WHERE stop = 149 OR stop = 53
GROUP BY company, num
HAVING COUNT(*) = 2;

-- 5

SELECT r1.company, r1.num, r1.stop, r2.stop
FROM route r1 JOIN route r2 ON
(r1.company = r2.company AND r1.num = r2.num)
WHERE r1.stop = 53 AND r2.stop = 149;

-- 6

SELECT r1.company, r1.num, stop1.name, stop2.name
FROM route r1 JOIN route r2 ON
(r1.company = r2.company AND r1.num = r2.num)
JOIN stops stop1 ON (r1.stop = stop1.id)
JOIN stops stop2 ON (r2.stop = stop2.id)
WHERE stop1.name = 'Craiglockhart' and stop2.name = 'London Road';

-- 7

SELECT distinct r1.company, r1.num
FROM route r1 JOIN route r2 ON
(r1.company = r2.company AND r1.num = r2.num)
JOIN stops stop1 ON (r1.stop = stop1.id)
JOIN stops stop2 ON (r2.stop = stop2.id)
WHERE stop1.id = 115 and stop2.id = 137;

-- 8

SELECT r1.company, r1.num
FROM route r1 JOIN route r2 ON
(r1.company = r2.company AND r1.num = r2.num)
JOIN stops stop1 ON (r1.stop = stop1.id)
JOIN stops stop2 ON (r2.stop = stop2.id)
WHERE stop1.name = 'Craiglockhart' and stop2.name = 'Tollcross';

-- 9

SELECT DISTINCT name, r1.company, r2.num
FROM route r1
JOIN route r2 ON (r1.company = r2.company AND r1.num = r2.num)
JOIN stops ON r1.stop = stops.id
WHERE r2.stop = 53;

/* Quiz */

-- 1

SELECT DISTINCT a.name, b.name
FROM stops a JOIN route z ON a.id=z.stop
JOIN route y ON y.num = z.num
JOIN stops b ON y.stop=b.id
WHERE a.name='Craiglockhart' AND b.name ='Haymarket'

-- 2

SELECT S2.id, S2.name, R2.company, R2.num
FROM stops S1, stops S2, route R1, route R2
WHERE S1.name='Haymarket' AND S1.id=R1.stop
AND R1.company=R2.company AND R1.num=R2.num
AND R2.stop=S2.id AND R2.num='2A'

-- 3

SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
JOIN stops stopa ON (a.stop=stopa.id)
JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Tollcross'