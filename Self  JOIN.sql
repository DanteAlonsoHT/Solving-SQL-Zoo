SELECT COUNT(id)
FROM stops

SELECT id
FROM stops
WHERE name = 'Craiglockhart'

SELECT id, name 
FROM stops JOIN route ON id = stop
WHERE company = 'LRT' AND num = '4';

SELECT company, num, COUNT(*)
FROM route WHERE stop = 149 OR stop = 53
GROUP BY company, num
HAVING COUNT(*) = 2;

SELECT r1.company, r1.num, r1.stop, r2.stop
FROM route r1 JOIN route r2 ON
(r1.company = r2.company AND r1.num = r2.num)
WHERE r1.stop = 53 AND r2.stop = 149;

SELECT r1.company, r1.num, stop1.name, stop2.name
FROM route r1 JOIN route r2 ON
(r1.company = r2.company AND r1.num = r2.num)
JOIN stops stop1 ON (r1.stop = stop1.id)
JOIN stops stop2 ON (r2.stop = stop2.id)
WHERE stop1.name = 'Craiglockhart' and stop2.name = 'London Road';

SELECT distinct r1.company, r1.num
FROM route r1 JOIN route r2 ON
(r1.company = r2.company AND r1.num = r2.num)
JOIN stops stop1 ON (r1.stop = stop1.id)
JOIN stops stop2 ON (r2.stop = stop2.id)
WHERE stop1.id = 115 and stop2.id = 137;

SELECT r1.company, r1.num
FROM route r1 JOIN route r2 ON
(r1.company = r2.company AND r1.num = r2.num)
JOIN stops stop1 ON (r1.stop = stop1.id)
JOIN stops stop2 ON (r2.stop = stop2.id)
WHERE stop1.name = 'Craiglockhart' and stop2.name = 'Tollcross';

SELECT DISTINCT name, r1.company, r2.num
FROM route r1
JOIN route r2 ON (r1.company = r2.company AND r1.num = r2.num)
JOIN stops ON r1.stop = stops.id
WHERE r2.stop = 53;