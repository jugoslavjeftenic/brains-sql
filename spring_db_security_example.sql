USE db_example_security;

INSERT INTO `db_example_security`.`role` (`role_id`, `role_name`) VALUES ('1', 'ROLE_ADMIN');
INSERT INTO `db_example_security`.`role` (`role_id`, `role_name`) VALUES ('2', 'ROLE_USER');
INSERT INTO `db_example_security`.`user` (`user_id`, `email`, `last_name`, `name`, `password`, `role`) VALUES ('1', 'user@example.com', 'Dimitrieski', 'Vladimir', '{noop}pass', '1');
INSERT INTO `db_example_security`.`user` (`user_id`, `email`, `last_name`, `name`, `password`, `role`) VALUES ('2', 'user2@example.com', 'Celikovic', 'Milan', '{noop}pass', '2');
INSERT INTO `db_example_security`.`user` (`user_id`, `email`, `last_name`, `name`, `password`, `role`) VALUES ('3', 'user3@example.com', 'Vujanovic', 'Angelina', '{noop}pass', '2');

SELECT * FROM role;
SELECT * FROM user;
