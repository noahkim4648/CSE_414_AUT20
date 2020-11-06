SELECT F1.origin_city as origin_city, ISNULL((100.0 * lessthan.three_hr / count(*)), 0) as percentage 
FROM FLIGHTS as F1 LEFT OUTER JOIN (SELECT F2.origin_city as origin_city, count(*) as three_hr
                                    FROM FLIGHTS as F2
                                    WHERE F2.actual_time < 180
                                    GROUP BY F2.origin_city) as lessthan
ON F1.origin_city = lessthan.origin_city
GROUP BY F1.origin_city, lessthan.three_hr
ORDER BY percentage, origin_city;

/* Query returned 327 rows 
   Total execution time: 00:00:09.584  
   First 20 rows: 
origin_city         percentage
Guam TT	            0.000000000000
Pago Pago TT	    0.000000000000
Aguadilla PR	    29.433962264150
Anchorage AK	    32.146037399821
San Juan PR	        33.890360709190
Charlotte Amalie VI	40.000000000000
Ponce PR	        41.935483870967
Fairbanks AK	    50.691244239631
Kahului HI	        53.664998528113
Honolulu HI	        54.908808692277
San Francisco CA	56.307656826568
Los Angeles CA	    56.604107648725
Seattle WA	        57.755416553349
Long Beach CA	    62.454116413214
Kona HI	            63.282107574094
New York NY	        63.481519772551
Las Vegas NV	    65.163009288383
Christiansted VI	65.333333333333
Newark NJ	        67.137355584082
Worcester MA	    67.741935483870

*/