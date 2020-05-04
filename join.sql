SELECT matchid, player
FROM goal 
WHERE teamid LIKE '%GER';

SELECT id, stadium, team1, team2
FROM game
WHERE id = 1012;

SELECT player, teamid, stadium, mdate
FROM game JOIN goal ON(id=matchid)
WHERE teamid = 'GER';

SELECT team1, team2, player
FROM game JOIN goal ON(id=matchid)
WHERE player LIKE 'Mario%';

SELECT player, teamid, coach, gtime
FROM goal JOIN eteam ON(teamid=id)
WHERE gtime<=10;

SELECT mdate, teamname
FROM game JOIN eteam ON(game.team1 = eteam.id)
WHERE eteam.coach = 'Fernando Santos';

SELECT player
FROM goal JOIN game ON(goal.matchid = game.id)
WHERE stadium = 'National Stadium, Warsaw';

SELECT DISTINCT player
FROM goal JOIN game ON(goal.matchid = game.id)
WHERE goal.teamid <> 'GER' AND 'GER' IN (game.team1, game.team2);

SELECT teamname, COUNT(player)
FROM eteam JOIN goal ON(id=teamid)
GROUP BY teamname;

SELECT stadium, COUNT(player)
FROM game JOIN goal ON(game.id = goal.matchid)
GROUP BY stadium;

SELECT matchid,mdate, COUNT(player)
FROM game JOIN goal ON(matchid = id )
WHERE(team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid;

SELECT matchid, mdate, COUNT(player)
FROM goal JOIN game ON(game.id = goal.matchid)
WHERE goal.teamid = 'GER'
GROUP BY matchid;

SELECT mdate, team1, SUM(
  CASE WHEN teamid=team1 THEN 1 ELSE 0 END
) score1, team2,
SUM(
  CASE WHEN teamid=team2 THEN 1 ELSE 0 END
) score2
FROM game LEFT JOIN goal ON (matchid = id)
GROUP BY matchid, team1, team2
ORDER BY mdate, matchid, team1, team2;
