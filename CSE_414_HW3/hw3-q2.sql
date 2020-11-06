SELECT DISTINCT F.origin_city as city 
FROM FLIGHTS as F 
GROUP BY F.origin_city
HAVING MAX(F.actual_time) < 180
ORDER BY F.origin_city;
/* Query returns 109 lines 
   total execution time: 00:00:03.691
First 20 rows: 

city
Aberdeen SD
Abilene TX
Alpena MI
Ashland WV
Augusta GA
Barrow AK
Beaumont/Port Arthur TX
Bemidji MN
Bethel AK
Binghamton NY
Brainerd MN
Bristol/Johnson City/Kingsport TN
Butte MT
Carlsbad CA
Casper WY
Cedar City UT
Chico CA
College Station/Bryan TX
Columbia MO
Columbus GA
*/