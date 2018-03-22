--1. Bigger than Russia

SELECT name
FROM world
WHERE population > (SELECT population FROM world WHERE name = 'Russia');

--2. Richer than UK

SELECT name
FROM world
WHERE population > (SELECT population FROM world WHERE name = 'Russia');

--3.Neighbours of Argentina and Australia

SELECT name, continent
FROM world
WHERE continent = (SELECT continent FROM world WHERE name = 'Argentina')
OR continent = (SELECT continent FROM world WHERE name = 'Australia');
ORDER BY name;

--4. Between Canada and Poland

SELECT name, population
FROM world
WHERE population > (SELECT population FROM world WHERE name = 'Canada')
AND population < (SELECT population FROM world WHERE name = 'Poland');

--5. Percentages of Germany

SELECT name, ROUND((population/(SELECT population FROM world WHERE name = 'Germany'))*100) || '%'
FROM world
WHERE continent = 'Europe';

--6. Bigger than every country in Europe

SELECT name
FROM world
WHERE gdp > (SELECT MAX(gdp) FROM world WHERE continent = 'Europe');

--7. Largest in each continent

SELECT continent, name, area FROM world x
WHERE area >= ALL
	(SELECT area 
	FROM world y
	WHERE y.continent=x.continent AND area >0);

--8. First country of each continent

SELECT continent, MIN(name)
FROM world
GROUP BY continent;

--9. Difficult Questions that Utilize Techniques not Covered in Prior Sections

SELECT name,continent,population FROM world x
WHERE 25000000 >= ALL (
	SELECT population FROM world y
	WHERE x.continent=y.continent);

--10.

SELECT x.name, x.continent
FROM world AS x
WHERE x.population >  ALL 
	(SELECT y.population * 3
	FROM world AS y 
	WHERE y.continent = x.continent AND x.name != y.name);




