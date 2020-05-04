SELECT id, title
FROM movie
WHERE yr = 1962;

SELECT yr
FROM movie
WHERE title = 'Citizen Kane';

SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr;

SELECT id
FROM actor
WHERE name = 'Glenn Close';
SELECT id
FROM movie
WHERE title = 'Casablanca';

SELECT name
FROM actor JOIN casting ON(actor.id = casting.actorid)
WHERE casting.movieid = 11768;

SELECT name
FROM actor JOIN casting ON(actor.id = casting.actorid)
WHERE casting.movieid = (
  SELECT id
  FROM movie
  WHERE title = 'Alien'
);
  
SELECT title
FROM movie JOIN casting ON(casting.movieid = movie.id)
WHERE actorid = (
  SELECT id 
  FROM actor 
  WHERE name = 'Harrison Ford'
);

SELECT title 
FROM movie JOIN casting ON(movie.id = casting.movieid)
WHERE actorid = (
  SELECT id 
  FROM actor
  WHERE name = 'Harrison Ford'
)
AND casting.ord != 1;

SELECT title, name 
FROM movie JOIN casting ON(movie.id = casting.movieid)
JOIN actor ON(actor.id = casting.actorid)
WHERE yr = 1962 AND casting.ord = 1;

SELECT yr,COUNT(title) 
FROM movie JOIN casting ON(movie.id=movieid)
JOIN actor ON(actorid=actor.id)
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2;

SELECT DISTINCT title, name 
FROM casting x JOIN movie ON(movie.id = x.movieid)
JOIN actor ON(actor.id = x.actorid)
WHERE 'Julie Andrews' IN(
  SELECT name 
  FROM actor JOIN casting y ON(y.actorid = actor.id)
  WHERE x.movieid = y.movieid
) 
AND x.ord = 1;

SELECT name 
FROM actor JOIN casting ON(casting.actorid = actor.id)
WHERE casting.ord = 1
GROUP BY casting.actorid
HAVING COUNT(casting.actorid) >=15
ORDER BY name;

SELECT title, COUNT(DISTINCT casting.actorid) 
FROM movie JOIN casting ON(casting.movieid = movie.id)
WHERE yr = 1978
GROUP BY casting.movieid
ORDER BY COUNT(DISTINCT casting.actorid) DESC, title;
