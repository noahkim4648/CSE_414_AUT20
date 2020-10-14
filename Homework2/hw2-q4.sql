/* (10 points) Find the names of all airlines that ever flew more than 
1000 flights in one day (i.e., a specific day/month, but not any 24-hour period). 
Return only the names of the airlines. Do not return any duplicates 
(i.e., airlines with the exact same name).
 Name the output column name.
 [Output relation cardinality: 12 rows] */

 SELECT DISTINCT C.name as name

 FROM FLIGHTS as F, CARRIERS as C 
 WHERE C.cid = F.carrier_id

GROUP BY F.month_id, F.day_of_month, C.cid

HAVING count(F.fid)>1000;
 