set search_path = bookings;


select * from tickets limit 50;

UPDATE tickets SET passenger_name = 'DENIS MARKOV', contact_data = '{"test": 123}'::jsonb
WHERE ticket_no = '0005432000905';

DELETE FROM boarding_passes WHERE ticket_no = '0005432000905';
DELETE FROM ticket_flights where ticket_no = '0005432000905';
DELETE FROM tickets WHERE ticket_no = '0005432000905';

select * from boarding_passes;
select * from ticket_flights limit 50;

select * from tickets where ticket_no = '0005432000905';