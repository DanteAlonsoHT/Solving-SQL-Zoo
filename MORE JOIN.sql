SELECT id, title
FROM movie
WHERE yr = 1962

SELECT yr FROM movie
WHERE title = 'Citizen Kane'

SELECT id, title, yr FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr

SELECT id FROM actor
WHERE name = 'Glenn Close'

SELECT id FROM movie
WHERE title= 'Casablanca'

SELECT name FROM casting
JOIN actor ON actorid = actor.id
WHERE movieid = 27

SELECT actor.name FROM casting
JOIN actor ON actorid = actor.id
JOIN movie ON movieid = movie.id
WHERE title = 'ALIEN'

SELECT movie.title FROM movie
JOIN casting ON movieid = movie.id
JOIN actor ON actorid = actor.id
WHERE actor.name = 'Harrison Ford'

SELECT movie.title FROM movie
JOIN casting ON movieid = movie.id
JOIN actor ON actorid = actor.id
WHERE actor.name = 'Harrison Ford'
AND ord > 1

SELECT movie.title,actor.name FROM movie
JOIN casting ON movieid = movie.id
JOIN actor ON actorid = actor.id
WHERE yr = 1962
AND ord = 1

SELECT yr,COUNT(title) FROM
movie JOIN casting ON movie.id = movieid
JOIN actor   ON actorid = actor.id
WHERE name = 'Doris Day'
GROUP BY yr
HAVING COUNT(title) > 1

SELECT title,name FROM casting
JOIN movie ON(movieid = movie.id AND ord = 1)
JOIN actor ON actorid = actor.id
WHERE movie.id IN(SELECT movieid FROM casting
WHERE actorid IN (
SELECT actor.id FROM actor
WHERE name = 'Julie Andrews'))

SELECT actor.name
FROM casting
JOIN actor
ON actor.id = casting.actorid
WHERE ord = 1
GROUP BY actor.name
HAVING COUNT(*) > 15
ORDER BY name

SELECT title, COUNT(title) AS cast FROM movie 
JOIN casting ON (movieid= movie.id)
WHERE yr= 1978
GROUP BY title
ORDER BY cast DESC, title

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

SELECT name
FROM actor INNER JOIN movie ON actor.id = director
WHERE gross < budget

SELECT *
FROM actor JOIN casting ON actor.id = actorid
JOIN movie ON movie.id = movieid

SELECT name, COUNT(movieid)
FROM casting JOIN actor ON actorid=actor.id
WHERE name LIKE 'John %'
GROUP BY name ORDER BY 2 DESC

SELECT title 
FROM movie JOIN casting ON (movieid=movie.id)
JOIN actor   ON (actorid=actor.id)
WHERE name='Paul Hogan' AND ord = 1

SELECT name
FROM movie JOIN casting ON movie.id = movieid
JOIN actor ON actor.id = actorid
WHERE ord = 1 AND director = 351

SELECT title, yr 
FROM movie, casting, actor 
WHERE name='Robert De Niro' AND movieid=movie.id AND actorid=actor.id AND ord = 3