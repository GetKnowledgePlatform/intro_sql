SELECT * 
FROM tickets
WHERE passenger_name LIKE 'OLEG%'
LIMIT 50;

SELECT * 
FROM tickets
WHERE passenger_name LIKE '%MELNIKOV'
LIMIT 50;

SELECT * 
FROM tickets
WHERE passenger_name LIKE 'A% B%'
LIMIT 50;

SELECT * 
FROM tickets
WHERE contact_data::text LIKE '%+703%'
LIMIT 50;

select lower('asfdsgDSGDGDFGfdsfd!');

SELECT * 
FROM tickets
WHERE lower(passenger_name) LIKE 'a% b%'
LIMIT 50;

SELECT * 
FROM tickets
WHERE passenger_name ILIKE 'a% b%'
LIMIT 50;