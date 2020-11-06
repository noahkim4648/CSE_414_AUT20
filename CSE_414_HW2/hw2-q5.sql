/*(10 points) Find all airlines that had more than 0.5% (= 0.005) of their flights
 out of Seattle canceled. Return the name of the airline 
 and the percentage of canceled flights out of Seattle. 
 Percentages should be outputted in percent format (3.5% as 3.5 not 0.035).
  Order the results by the percentage of canceled flights in ascending order.
 Name the output columns name and percentage, in that order.
 [Output relation cardinality: 6 rows] */

 SELECT DISTINCT C.name as name, ((CAST(SUM(F.canceled) as FLOAT) * 100) / COUNT(F.fid)) as percentage

 FROM FLIGHTS as F, CARRIERS as C
 WHERE C.cid = F.carrier_id
 AND F.origin_city = "Seattle WA"

GROUP BY C.cid
HAVING percentage > 0.5
 ORDER BY percentage asc;