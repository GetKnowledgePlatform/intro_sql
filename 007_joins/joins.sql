SET search_path = bookings;


SELECT * FROM tickets WHERE ticket_no = '0005432000868';
SELECT * FROM bookings;


SELECT t.ticket_no, t.passenger_name, b.total_amount FROM tickets t
INNER JOIN bookings b ON (t.book_ref = b.book_ref)
WHERE t.ticket_no = '0005432000868';


SELECT t.ticket_no, t.passenger_name, b.total_amount FROM tickets t
INNER JOIN bookings b ON (1 = 1)
WHERE t.ticket_no = '0005432000868';


SELECT t.ticket_no, t.passenger_name, b.total_amount FROM tickets t
INNER JOIN bookings b ON (t.book_ref = b.book_ref)
WHERE b.total_amount > 100000;



SELECT * FROM seats;
SELECT * FROM boarding_passes;

SELECT t.ticket_no, t.passenger_name, b.flight_id, b.seat_no, s.fare_conditions, b2.total_amount FROM tickets t
INNER JOIN boarding_passes b ON (b.ticket_no = t.ticket_no)
INNER JOIN flights f ON (f.flight_id = b.flight_id)
INNER JOIN seats s ON (b.seat_no = s.seat_no AND s.aircraft_code = f.aircraft_code)
INNER JOIN bookings b2 ON (t.book_ref = b2.book_ref)
WHERE s.fare_conditions = 'Business'
LIMIT 50;


SELECT * FROM boarding_passes where ticket_no = '0005432000860';
SELECT * FROM seats WHERE seat_no = '2F';
SELECT * FROM flights;



SELECT f.*, b.* FROM flights f
LEFT JOIN boarding_passes b ON (b.flight_id = f.flight_id) 
WHERE f.flight_id = 22;



SELECT * FROM boarding_passes;




