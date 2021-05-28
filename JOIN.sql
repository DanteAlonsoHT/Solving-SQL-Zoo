SELECT matchid, player FROM goal 
WHERE teamid LIKE '%GER'

SELECT id,stadium,team1,team2
FROM game
WHERE id = 1012

SELECT player, teamid, stadium, mdate 
FROM game JOIN goal ON (id=matchid) AND teamid LIKE 'GER'

SELECT team1, team2, player 
FROM game JOIN goal ON (id=matchid) AND player LIKE 'Mario%'

SELECT player, teamid, coach, gtime
FROM goal JOIN eteam ON teamid = id
WHERE gtime<=10 

SELECT mdate, teamname
FROM game JOIN eteam ON (team1=eteam.id)
WHERE coach LIKE 'Fernando Santos'

SELECT player
FROM game JOIN goal ON (id=matchid) AND stadium LIKE 'National Stadium, Warsaw'

SELECT DISTINCT player
FROM game JOIN goal ON matchid = id 
WHERE (team2='GER' OR team1 = 'GER') AND NOT (teamid = 'GER')

SELECT teamname, COUNT(eteam.id) FROM goal
JOIN eteam ON (goal.teamid= eteam.id)
GROUP BY teamname

SELECT stadium, COUNT(matchid) FROM goal
JOIN game ON matchid = game.id
GROUP BY stadium

SELECT matchid,mdate, COUNT(teamid)
FROM game JOIN goal ON matchid = id 
WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid, mdate

SELECT matchid, mdate, COUNT (teamid)
FROM goal JOIN game ON matchid = id
WHERE teamid = 'GER'
GROUP BY matchid, mdate

SELECT mdate, team1, SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) AS score1,
team2, SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) AS score2
FROM game LEFT JOIN goal

ON game.id = goal.matchid
GROUP BY mdate, matchid, team1, team2
ORDER BY mdate, matchid, team1, team2;




