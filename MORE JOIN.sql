-- 1

SELECT id, title
FROM movie
WHERE yr = 1962

-- 2

SELECT yr FROM movie
WHERE title = 'Citizen Kane'

-- 3

SELECT id, title, yr FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr

-- 4

SELECT id FROM actor
WHERE name = 'Glenn Close'

-- 5

SELECT id FROM movie
WHERE title= 'Casablanca'

-- 6

SELECT name FROM casting
JOIN actor ON actorid = actor.id
WHERE movieid = 27

-- 7

SELECT actor.name FROM casting
JOIN actor ON actorid = actor.id
JOIN movie ON movieid = movie.id
WHERE title = 'ALIEN'

-- 8

SELECT movie.title FROM movie
JOIN casting ON movieid = movie.id
JOIN actor ON actorid = actor.id
WHERE actor.name = 'Harrison Ford'

-- 9

SELECT movie.title FROM movie
JOIN casting ON movieid = movie.id
JOIN actor ON actorid = actor.id
WHERE actor.name = 'Harrison Ford'
AND ord > 1

-- 10

SELECT movie.title,actor.name FROM movie
JOIN casting ON movieid = movie.id
JOIN actor ON actorid = actor.id
WHERE yr = 1962
AND ord = 1

-- 11

SELECT yr,COUNT(title) FROM
movie JOIN casting ON movie.id = movieid
JOIN actor   ON actorid = actor.id
WHERE name = 'Doris Day'
GROUP BY yr
HAVING COUNT(title) > 1

-- 12

SELECT title,name FROM casting
JOIN movie ON(movieid = movie.id AND ord = 1)
JOIN actor ON actorid = actor.id
WHERE movie.id IN(SELECT movieid FROM casting
WHERE actorid IN (
SELECT actor.id FROM actor
WHERE name = 'Julie Andrews'))

-- 13

SELECT actor.name
FROM casting
JOIN actor
ON actor.id = casting.actorid
WHERE ord = 1
GROUP BY actor.name
HAVING COUNT(*) > 15
ORDER BY name

-- 14

SELECT title, COUNT(title) AS cast FROM movie 
JOIN casting ON (movieid= movie.id)
WHERE yr= 1978
GROUP BY title
ORDER BY cast DESC, title

-- 15

SELECT name
FROM casting
JOIN actor
ON casting.actorid = actor.id
WHERE movieid IN (
SELECT movieid
FROM casting
JOIN movie
ON casting.movieid = movie.id
WHERE actorid = (
SELECT id
FROM actor
WHERE name = 'Art Garfunkel'))
AND NOT actor.name = 'Art Garfunkel'

/* Quiz */

-- 1

SELECT name
FROM actor INNER JOIN movie ON actor.id = director
WHERE gross < budget

-- 2

SELECT *
FROM actor JOIN casting ON actor.id = actorid
JOIN movie ON movie.id = movieid

-- 3

SELECT name, COUNT(movieid)
FROM casting JOIN actor ON actorid=actor.id
WHERE name LIKE 'John %'
GROUP BY name ORDER BY 2 DESC

-- 4

SELECT title 
FROM movie JOIN casting ON (movieid=movie.id)
JOIN actor   ON (actorid=actor.id)
WHERE name='Paul Hogan' AND ord = 1

-- 5

SELECT name
FROM movie JOIN casting ON movie.id = movieid
JOIN actor ON actor.id = actorid
WHERE ord = 1 AND director = 351

-- 6

SELECT title, yr 
FROM movie, casting, actor 
WHERE name='Robert De Niro' AND movieid=movie.id AND actorid=actor.id AND ord = 3