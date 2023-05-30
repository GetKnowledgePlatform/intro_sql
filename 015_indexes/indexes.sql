-- INDEXES

EXPLAIN ANALYZE SELECT f.* FROM flights f
WHERE f.scheduled_departure > '2017-06-15' and f.scheduled_departure < '2017-06-16';


CREATE INDEX flight_scheduled_dep_indx ON flights(scheduled_departure);
