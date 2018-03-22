--1.

SELECT COUNT(*)
FROM stops;

--2.

SELECT id
FROM stops
WHERE name = 'Craiglockhart';

--3.

SELECT id, name
FROM stops
JOIN route on id = stop
WHERE company = 'LRT' AND num = 4;

--4.

SELECT company, num, COUNT(*)
FROM route 
WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) > 1;

