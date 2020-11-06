SELECT DISTINCT C.name as carrier 
FROM CARRIERS as C, (SELECT F.carrier_id 
                    FROM FLIGHTS as F
                    WHERE F.origin_city = 'Seattle WA' AND F.dest_city = 'San Francisco CA')
                    as F1
WHERE C.cid = F1.carrier_id
ORDER BY C.name;
/* 
Query returned 4 rows
Total execution time: 00:00:01.272

carrier
Alaska Airlines Inc.
SkyWest Airlines Inc.
United Air Lines Inc.
Virgin America
*/