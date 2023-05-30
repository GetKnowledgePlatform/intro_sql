-- WINDOW FUNCTIONS

SET search_path=bookings;


SELECT b.total_amount, t.ticket_no, f.* FROM flights f
JOIN ticket_flights tf ON tf.flight_id = f.flight_id
JOIN tickets t ON t.ticket_no = tf.ticket_no
JOIN bookings b ON b.book_ref = t.book_ref
LIMIT 50;


WITH flight_part AS (
SELECT 
	row_number() OVER (partition by departure_airport order by scheduled_departure DESC) as rn,
	f.*
FROM flights f
)
SELECT * FROM flight_part WHERE rn <=3;

WITH tmp1 AS (
SELECT 
	b.total_amount, 
	t.ticket_no, 
	f.flight_id,
	max(b.total_amount) OVER(partition by f.flight_id) as mx_amount
FROM flights f
JOIN ticket_flights tf ON tf.flight_id = f.flight_id
JOIN tickets t ON t.ticket_no = tf.ticket_no
JOIN bookings b ON b.book_ref = t.book_ref
LIMIT 300
)
SELECT tmp1.mx_amount - tmp1.total_amount FROM tmp1;


