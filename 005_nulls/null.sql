SET search_path=bookings;


SELECT *
FROM flights
WHERE actual_arrival IS NOT NULL
ORDER BY actual_arrival DESC -- NULLS FIRST
LIMIT 5;

SELECT 1=1;
SELECT 1>2;
SELECT NULL=0;
SELECT NULL=NULL;
SELECT NULL<>NULL;


SELECT * FROM flights WHERE 
flight_id = 1996 AND 1=1 AND (actual_arrival IS NULL OR actual_arrival < now());


