-- TRANSACTION

CREATE SCHEMA bank_accounts;

SET search_path = bank_accounts;

CREATE TABLE account(
	account_num TEXT PRIMARY KEY,
	user_name TEXT NOT NULL,
	balance INT NOT NULL DEFAULT 0 CHECK (balance <= 1000)
);

CREATE TABLE account_entry(
	entry_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	account_to TEXT NOT NULL REFERENCES account(account_num),
	account_from TEXT REFERENCES account(account_num),
	amount INT NOT NULL DEFAULT 0,
	created TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);


INSERT INTO account(account_num, user_name, balance)
VALUES ('111', 'Петя', 200);
INSERT INTO account(account_num, user_name, balance)
VALUES ('222', 'Вася', 900);


BEGIN;
SELECT balance FROM account WHERE account_num='111';
-- CHECK balance
INSERT INTO account_entry(account_to,account_from, amount)
VALUES('111', '222', -100);
UPDATE account SET balance = balance - 100 WHERE account_num='111';
INSERT INTO account_entry(account_to,account_from, amount)
VALUES('222', '111', 100);
UPDATE account SET balance = balance + 100 WHERE account_num='222';
COMMIT;

ROLLBACK;




