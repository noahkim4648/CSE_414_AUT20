SELECT DISTINCT C.name as carrier 
FROM CARRIERS as C, FLIGHTS as F 
WHERE F.origin_city = 'Seattle WA'
AND F.dest_city = 'San Francisco CA'
AND C.cid = F.carrier_id
ORDER BY C.name;

/* 
Query returned 4 rows
Total execution time: 00:00:01.623

carrier
Alaska Airlines Inc.
SkyWest Airlines Inc.
United Air Lines Inc.
Virgin America
*/