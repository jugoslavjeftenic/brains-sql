USE db_example_validation;

SELECT * FROM users;

DELETE FROM users;
UPDATE users_sequence SET next_val = 1 WHERE next_val > 1;
SELECT * FROM users_sequence;

DROP TABLE users;
DROP TABLE users_sequence;

ALTER TABLE voucher_entity DROP FOREIGN KEY FKfk9mu4pvbq54a1korkeywvj94;
