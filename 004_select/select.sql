set search_path = bookings;


SELECT flight_id, flight_no, departure_airport, status, * 
FROM flights
WHERE 
  (departure_airport = 'SVO' AND arrival_airport IN ('MMK', 'AAQ'))
    OR
  (NOT aircraft_code = 'SU9')
ORDER BY departure_airport ASC, scheduled_arrival DESC
LIMIT 50;


SELECT * FROM ticket_flights
WHERE amount > 9000.00 AND amount < 20000.00
LIMIT 50 OFFSET 150;


select * from flights
where 
scheduled_departure >= '2017-08-26'::timestamp and 
scheduled_departure <= '2017-08-29'::timestamp
limit 50;
