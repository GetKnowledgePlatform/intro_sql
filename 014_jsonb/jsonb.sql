-- JSONB

SET search_path=bookings;

SELECT contact_data->>'email' FROM tickets
WHERE contact_data ? 'email';