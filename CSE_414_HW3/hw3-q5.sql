SELECT DISTINCT F.dest_city as city
FROM FLIGHTS as F 
WHERE F.dest_city NOT IN (SELECT DISTINCT F1.dest_city 
                          FROM FLIGHTS AS F1
                          WHERE F1.origin_city = 'Seattle WA')
AND
F.dest_city NOT IN (SELECT DISTINCT F3.dest_city
                    FROM FLIGHTS as F2, FLIGHTS as F3
                    WHERE F2.origin_city = 'Seattle WA' AND F2.dest_city = F3.origin_city)
ORDER BY F.dest_city;
/* 
Query returns 3 rows
Total execution time: 00:02:47.579

city
Devils Lake ND
Hattiesburg/Laurel MS
St. Augustine FL
*/