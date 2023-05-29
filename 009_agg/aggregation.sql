-- Aggregate functions

SELECT * FROM flights;
SELECT * FROM bookings;

SELECT 
	count(1), 
	max(actual_arrival), 
	min(actual_arrival)
FROM flights;

SELECT 
	count(1), 
	max(total_amount), 
	min(total_amount),
	sum(total_amount),
	avg(total_amount),
	max(total_amount), 
	min(book_date),
	max(book_date)
FROM bookings
WHERE book_date >= '2017-06-15';


SELECT count(distinct arrival_airport) from flights;


SELECT sum(total_amount), avg(total_amount) FROM flights f
JOIN ticket_flights tf ON f.flight_id = tf.flight_id
JOIN tickets t ON t.ticket_no = tf.ticket_no
JOIN bookings b ON b.book_ref = t.book_ref
WHERE f.flight_id = 11047;



SELECT * FROM ticket_flights;

