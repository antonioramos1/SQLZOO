--1. 1962 movies

SELECT id, title
FROM movie
WHERE yr=1962;

--2. When was Citizen Kane released

SELECT yr
FROM movie
WHERE title = 'Citizen Kane';

--3. Star Trek movies

SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr;

--4. id for actor Glenn Close

SELECT id
FROM actor
WHERE name = 'Glenn Close';

--5. id for Casablanca

SELECT id
FROM movie
WHERE title = 'Casablanca';

--6. Cast list for Casablanca

SELECT name
FROM movie
JOIN casting ON movie.id = movieid
JOIN actor ON actor.id = actorid
WHERE title = 'Casablanca';

--7. Alien cast list

SELECT name
FROM movie
JOIN casting ON movie.id = movieid
JOIN actor ON actor.id = actorid
WHERE title = 'Alien';

--8. Harrison Ford movies

SELECT title
FROM movie
JOIN casting ON movie.id = movieid
JOIN actor ON actor.id = actorid
WHERE name = 'Harrison Ford';

--9. Harrison Ford as a supporting actor

SELECT title
FROM movie
JOIN casting ON movie.id = movieid
JOIN actor ON actor.id = actorid
WHERE name = 'Harrison Ford' AND ord != 1;

--10. Lead actors in 1962 movies

SELECT title, name
FROM movie
JOIN casting ON movie.id = movieid
JOIN actor ON actor.id = actorid
WHERE yr = 1962 AND ord = 1;

--11. Busy years for John Travolta

SELECT yr, COUNT(yr)
FROM movie
JOIN casting ON movie.id=movieid
JOIN actor ON actorid=actor.id
WHERE name = 'John Travolta'
GROUP BY yr
HAVING COUNT(yr) > 2;

--12. Lead actor in Julie Andrews movies

SELECT title, name
FROM movie
JOIN casting ON movie.id = movieid
JOIN actor ON actor.id = actorid
WHERE movie.id = ANY (SELECT movie.id FROM movie
JOIN casting ON movie.id=movieid
JOIN actor ON actorid=actor.id
WHERE name = 'Julie Andrews') AND ord = 1;

--13. Actors with 30 leading roles

SELECT name
FROM movie
JOIN casting ON movie.id=movieid
JOIN actor ON actorid=actor.id
WHERE ord = 1
GROUP BY name
HAVING COUNT(NAME) >= 30
ORDER BY name;

--14. 

SELECT title, COUNT(title)
FROM movie
JOIN casting ON movie.id=movieid
JOIN actor ON actorid=actor.id
WHERE yr = 1978
GROUP BY title
ORDER BY COUNT(name) DESC, title;

--15. 

SELECT DISTINCT (name)
FROM movie
JOIN casting ON movie.id = movieid
JOIN actor ON actor.id = actorid
WHERE movie.id = ANY (SELECT movie.id FROM movie
JOIN casting ON movie.id=movieid
JOIN actor ON actorid=actor.id
WHERE name = 'Art Garfunkel') AND name != 'Art Garfunkel';
