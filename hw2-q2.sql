/*(10 points) Find all itineraries from Seattle to Boston on July 15th. Search only for itineraries that have one stop 
(i.e., flight 1: Seattle -> [somewhere], flight2: [somewhere] -> Boston).
 Both flights must depart on the same day (same day here means the date of flight) and must be with the same carrier. 
 It's fine if the landing date is different from the departing date (i.e., in the case of an overnight flight). 
 You don't need to check whether the first flight overlaps with the second one since the departing and arriving time of the flights are not provided.
The total flight time (actual_time) of the entire itinerary should be fewer than 7 hours (but notice that actual_time is in minutes). 
 For each itinerary, the query should return the name of the carrier, the first flight number, the origin and destination of that first flight, the flight time, the second flight 
 number, the origin and destination of the second flight, the second flight time, and finally the total flight time. Only count flight times here; do not include any layover time.
 
 Name the output columns name (as in the name of the carrier), 
 f1_flight_num, f1_origin_city, f1_dest_city, f1_actual_time, 
 f2_flight_num, f2_origin_city, f2_dest_city, f2_actual_time, 
 and actual_time as the total flight time. List the output columns in this order. 
 [Output relation cardinality: 1472 rows] 
 */

SELECT
C.name as name, 
f1.flight_num as f1_flight_num, f1.origin_city as f1_origin_city, f1.dest_city as f1_dest_city, f1.actual_time as f1_actual_time,
f2.flight_num as f2_flight_num, f2.origin_city as f2_origin_city, f2.dest_city as f2_dest_city, f2.actual_time as f2_actual_time, 
f1.actual_time + f2.actual_time as actual_time
FROM FLIGHTS as f1, FLIGHTS as f2, CARRIERS as C, MONTHS as M
 
WHERE M.month = "July"
AND f1.day_of_month = 15
AND f2.day_of_month = 15
AND f1.origin_city = "Seattle WA"
AND f2.dest_city = "Boston MA"
AND f1.actual_time + f2.actual_time < 420
AND f1.dest_city = f2.origin_city
AND f1.carrier_id = C.cid
AND f1.carrier_id = f2.carrier_id
AND f1.month_id = M.mid
AND f2.month_id = M.mid;
 