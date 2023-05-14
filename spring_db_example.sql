USE db_example;

SELECT * FROM address_entity;
SELECT * FROM city_entity;
SELECT * FROM country_entity;
SELECT * FROM user_entity;

DELETE FROM address_entity;
UPDATE address_sequence SET next_val = 1 WHERE next_val > 1;
SELECT * FROM address_sequence;
DELETE FROM city_entity;
UPDATE city_sequence SET next_val = 1 WHERE next_val > 1;
SELECT * FROM city_sequence;
DELETE FROM country_entity;
UPDATE country_sequence SET next_val = 1 WHERE next_val > 1;
SELECT * FROM country_sequence;
DELETE FROM user_entity;
UPDATE user_sequence SET next_val = 1 WHERE next_val > 1;
SELECT * FROM user_sequence;

DROP TABLE address_entity;
DROP TABLE address_sequence;
DROP TABLE city_entity;
DROP TABLE city_sequence;
DROP TABLE country_entity;
DROP TABLE user_entity;
DROP TABLE user_sequence;
