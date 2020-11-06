/* (10 points) Find the day of the week with the longest average arrival delay.
 Return the name of the day and the average delay.
 Name the output columns day_of_week and delay, in that order. 
 (Hint: consider using LIMIT. Look up what it does!)
 [Output relation cardinality: 1 row] */

 SELECT 
 W.day_of_week as day_of_week, AVG(F.arrival_delay) as delay

 FROM FLIGHTS as F, WEEKDAYS as W
 WHERE F.day_of_week_id = W.did
 GROUP BY F.day_of_week_id
 ORDER BY AVG(F.arrival_delay) desc
 LIMIT 1;