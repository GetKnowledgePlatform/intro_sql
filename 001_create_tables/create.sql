

CREATE DATABASE gk_test;
DROP DATABASE gk_test;

CREATE SCHEMA mmorpg;

SET search_path = mmorpg;


CREATE TABLE character(
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    username TEXT NOT NULL UNIQUE,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    password_hash TEXT NOT NULL
);

DROP TABLE character;
TRUNCATE TABLE character;

CREATE TABLE weapon(
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name TEXT NOT NULL,
    icon_url TEXT,
    min_damage_attack INT NOT NULL DEFAULT 10,
    max_damage_attack INT NOT NULL DEFAULT 50
);

CREATE TABLE character_equipment(
    id UUID PRIMARY KEY,
    character_id INT NOT NULL REFERENCES character(id),
    weapon_id INT NOT NULL REFERENCES weapon(id)
);

INSERT INTO character(username, created_at, password_hash)
VALUES 
    ('denismd', now(), 'wgfkdglkdsjglkdsfg'),
    ('alex', '2020-03-19'::timestamp, 'gdklgjdflkgjlkfdh');

INSERT INTO weapon(name, icon_url, min_damage_attack, max_damage_attack)
VALUES 
    ('fire sword', 'https://test.com/12.jpeg', 15, 20),
    ('ice sword', 'https://test.com/13.jpeg', 15, 54),
    ('water sword', 'https://test.com/14.jpeg', 0, 2);