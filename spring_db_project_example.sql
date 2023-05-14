USE db_project_example;

SELECT * FROM bill_entity;
SELECT * FROM category_entity;
SELECT * FROM offer_entity;
SELECT * FROM user_entity;
SELECT * FROM voucher_entity;

DELETE FROM bill_entity;
UPDATE bill_sequence SET next_val = 1 WHERE next_val > 1;
SELECT * FROM bill_sequence;
DELETE FROM category_entity;
UPDATE category_sequence SET next_val = 1 WHERE next_val > 1;
SELECT * FROM category_sequence;
DELETE FROM offer_entity;
UPDATE offer_sequence SET next_val = 1 WHERE next_val > 1;
SELECT * FROM offer_sequence;
DELETE FROM user_entity;
UPDATE user_sequence SET next_val = 1 WHERE next_val > 1;
SELECT * FROM user_sequence;
DELETE FROM voucher_entity;
UPDATE voucher_sequence SET next_val = 1 WHERE next_val > 1;
SELECT * FROM voucher_sequence;

DROP TABLE bill_entity;
DROP TABLE bill_sequence;
DROP TABLE category_entity;
DROP TABLE category_sequence;
DROP TABLE offer_entity;
DROP TABLE offer_sequence;
DROP TABLE user_entity;
DROP TABLE user_sequence;
DROP TABLE voucher_entity;
DROP TABLE voucher_sequence;

ALTER TABLE voucher_entity DROP FOREIGN KEY FKfk9mu4pvbq54a1korkeywvj94;
