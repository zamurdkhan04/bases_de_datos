use world;
show tables;

-- 1

select name, population, lifeExpectancy, region
from country
where  continent = 'Europe'
	and population between 10000000 and 50000000
    and lifeExpectancy is not null
order by lifeExpectancy DESC, name;

-- 2

select name, region, continent 
from country
where continent in ('Europe', 'africa')	
	and name like 'A%'
order by continent DESC, name;

-- 3

select name, IndepYear, GovernmentForm, population
from country
where GovernmentForm like 'republic%'
	and IndepYear between 1950 and 1970
    and population> 10000000
order by IndepYear DESC, name;

-- 4

select name, continent, population, GovernmentForm
from country
where IndepYear is null
	and population > 0
order by population DESC, name;

-- 5

select name, continent, GNP, GNPOld, lifeExpectancy
from country
where GNP < GNPOld
	AND lifeExpectancy < 60
order by continent DESC, name;

-- 6

select name, CountryCode, district, population
from city
where (CountryCode='ESP' or CountryCode='FRA' or CountryCode='ITA' or CountryCode='GER')
	and population >= 50000
 order by CountryCode DESC, name, population DESC;   
 
 -- 7
 
SELECT Name, District, Population
FROM city
WHERE CountryCode = 'ESP'
ORDER BY Population DESC
LIMIT 10;

-- 8

select CountryCode, language, Percentage
from countrylanguage
where IsOfficial = 'T' and percentage = 100
order by CountryCode, language;
 
 -- 9
 
 select name, continent, SurfaceArea, population
 from country
 where (continent = 'africa' or continent='oceania')
	and SurfaceArea > 1000000
    and population < 20000000
order by SurfaceArea DESC;

-- 10

select name, GovernmentForm, population
from country
where continent = 'europe' and(GovernmentForm like '%Monarchy%' or population > 50000000)
order by population DESC, name;

-- 11

SELECT Continent, COUNT(*) AS numero_paises, SUM(Population) AS poblacion_total
FROM country
GROUP BY Continent
HAVING COUNT(*) > 20
ORDER BY numero_paises DESC;

-- 12

select region, count(*) as numero_paises, sum(population) as poblacion_total
from country
group by region 
having count(*) >= 5 and sum(population) > 100000000
order by poblacion_total DESC;

-- 13

select governmentForm, count(*) as numero_paises, AVG(population) as poblacion_media
from country
group by governmentForm
having count(*) >= 3 and AVG(population) > 20000000
order by poblacion_media DESC;

-- 14

select indepYear, count(*) as numero_paises, sum(population) as poblacion_total
from country
where indepYear is not null
group by indepYear
having count(*) >= 4
order by numero_paises DESC, indepYear;

-- 15

select continent, count(lifeExpectancy) as paises_con_dato,
AVG(lifeExpectancy) as esperanza_media
from country
group by continent
having AVG(lifeExpectancy) > 70 and count(lifeExpectancy) >= 10;

-- 16




