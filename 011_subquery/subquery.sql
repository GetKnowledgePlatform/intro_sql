-- WITH / SUBQUERY


SELECT arrival_airport, count(1) FROM flights
GROUP BY arrival_airport
ORDER BY 2 DESC
LIMIT 2;


SELECT * FROM flights f1 WHERE arrival_airport IN (
	SELECT f2.arrival_airport FROM flights f2
	GROUP BY f2.arrival_airport
	ORDER BY count(1) DESC
	LIMIT 2
);


SELECT * FROM tickets t
LEFT JOIN boarding_passes b ON (b.ticket_no = t.ticket_no)
WHERE b.ticket_no IS NULL;


SELECT * FROM tickets t
WHERE NOT EXISTS(
	SELECT 1 FROM boarding_passes b
	WHERE b.ticket_no = t.ticket_no
);


WITH delayed_flights AS (
	SELECT f.flight_id FROM flights f WHERE status = 'Delayed'
),
tickets_by_flight AS (
	SELECT t.ticket_no, df.flight_id FROM tickets t
	JOIN ticket_flights tf ON tf.ticket_no = t.ticket_no
	JOIN delayed_flights df ON df.flight_id = tf.flight_id
),
groupped_ticket_by_flight AS (
	SELECT tbf.flight_id, COUNT(1) FROM tickets_by_flight tbf GROUP BY tbf.flight_id
)
SELECT * FROM groupped_ticket_by_flight
ORDER BY 2 DESC;







