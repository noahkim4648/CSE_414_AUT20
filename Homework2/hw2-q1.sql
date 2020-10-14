/* (10 points) List the distinct flight numbers of all flights from Seattle to Boston by Alaska Airlines Inc. on Mondays. Also notice that, in the database, 
the city names include the state. So Seattle appears as Seattle WA. Please use the flight_num column instead of fid. Name the output column flight_num. */


SELECT DISTINCT F.flight_num as flight_num
FROM FLIGHTS as F, CARRIERS as C, WEEKDAYS as W
WHERE F.origin_city = "Seattle WA"
AND F.dest_city = "Boston MA"
AND C.name = "Alaska Airlines Inc."
AND W.day_of_week = "Monday"
AND F.carrier_id = C.cid
AND F.day_of_week_id = W.did;