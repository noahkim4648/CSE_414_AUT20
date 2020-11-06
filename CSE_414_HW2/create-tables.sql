/*
Creating the four tables where
Flights.carrier_id references Carrier.cid
Flights.month_id references Months.mid
Flights.day_of_week_id references Weekdays.did
*/

PRAGMA foreign_keys=ON;

CREATE TABLE FLIGHTS 
        (fid int PRIMARY KEY, 
         month_id int references MONTHS(mid),        -- 1-12
         day_of_month int,    -- 1-31 
         day_of_week_id int references WEEKDAYS(did),  -- 1-7, 1 = Monday, 2 = Tuesday, etc
         carrier_id varchar(7) references CARRIERS(cid), 
         flight_num int,
         origin_city varchar(34), 
         origin_state varchar(47), 
         dest_city varchar(34), 
         dest_state varchar(46), 
         departure_delay int, -- in mins
         taxi_out int,        -- in mins
         arrival_delay int,   -- in mins
         canceled int,        -- 1 means canceled
         actual_time int,     -- in mins
         distance int,        -- in miles
         capacity int, 
         price int            -- in $             
         );

CREATE TABLE CARRIERS (cid varchar(7) PRIMARY KEY, name varchar(83));

CREATE TABLE MONTHS (mid int PRIMARY KEY, month varchar(9));

CREATE TABLE WEEKDAYS (did int PRIMARY KEY, day_of_week varchar(9));