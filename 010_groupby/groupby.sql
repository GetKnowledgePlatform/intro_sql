-- GROUP BY / HAVING



SELECT status, count(1), min(actual_arrival), max(actual_arrival) FROM flights
WHERE actual_arrival > '2017-06-15'
GROUP BY status;


SELECT f.aircraft_code, min(a.model), avg(b.total_amount) FROM flights f
JOIN ticket_flights tf ON (tf.flight_id = f.flight_id)
JOIN tickets t ON (t.ticket_no = tf.ticket_no)
JOIN bookings b ON (b.book_ref = t.book_ref)
JOIN aircrafts a ON (a.aircraft_code = f.aircraft_code)
GROUP BY f.aircraft_code;


SELECT f.departure_airport, avg(b.total_amount) FROM flights f
JOIN ticket_flights tf ON (tf.flight_id = f.flight_id)
JOIN tickets t ON (t.ticket_no = tf.ticket_no)
JOIN bookings b ON (b.book_ref = t.book_ref)
GROUP BY f.departure_airport
HAVING avg(b.total_amount) > 80000;

