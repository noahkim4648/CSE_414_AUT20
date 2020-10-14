/*(10 points) Compute the total departure delay of each  airline across all flights. 
Some departure delays may be negative (indicating an early departure); 
they should reduce the total, so you don't need to handle them specially. 
Name the output columns name and delay, in that order. 
[Output relation cardinality: 22 rows] */

SELECT C.name as name, SUM(F.departure_delay) as delay

FROM FLIGHTS as F, CARRIERS as C

WHERE F.carrier_id = C.cid
GROUP BY F.carrier_id;