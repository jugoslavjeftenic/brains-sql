USE db_books;

SELECT * FROM author;
SELECT * FROM book;
SELECT * FROM book_author;
SELECT * FROM genre;

DELETE FROM author;
DELETE FROM book;
DELETE FROM book_author;
DELETE FROM genre;

SELECT * FROM hibernate_sequence;
UPDATE hibernate_sequence SET next_val = 1 WHERE next_val > 1;

ALTER TABLE parent DROP FOREIGN KEY FK40d33gedwgtajqqnj0vjcv3p0;
DROP TABLE author;

INSERT INTO `db_books`.`genre` (`id`, `name`) VALUES ('1', 'roman');
INSERT INTO `db_books`.`genre` (`id`, `name`) VALUES ('2', 'drama');
INSERT INTO `db_books`.`genre` (`id`, `name`) VALUES ('3', 'pesme');
INSERT INTO `db_books`.`author` (`id`, `name`) VALUES ('1', 'Lav Nikolajevic Tolstoj');
INSERT INTO `db_books`.`author` (`id`, `name`) VALUES ('2', 'Ivo Andric');
INSERT INTO `db_books`.`author` (`id`, `name`) VALUES ('3', 'Dobrica Eric');
INSERT INTO `db_books`.`author` (`id`, `name`) VALUES ('4', 'Jovan Sterija Popovic');
INSERT INTO `db_books`.`book` (`id`, `isbn`, `rating`, `title`, `year`, `genre_id`) VALUES ('1', '12345689097', '6', 'Na Drini Cuprija', '1945', '1');
INSERT INTO `db_books`.`book` (`id`, `isbn`, `rating`, `title`, `year`, `genre_id`) VALUES ('2', '123457890', '5', 'Rat i mir', '1869', '1');
INSERT INTO `db_books`.`book` (`id`, `isbn`, `rating`, `title`, `year`, `genre_id`) VALUES ('3', '12345789098', '4', 'Pokondirena tikva', '1830', '2');
INSERT INTO `db_books`.`book` (`id`, `isbn`, `rating`, `title`, `year`, `genre_id`) VALUES ('4', '1234567890', '5', 'Vasar u Topoli', '1965', '3');
INSERT INTO db_books.book_author (book_id, author_id) values (1, 2);
INSERT INTO db_books.book_author (book_id, author_id) values (2, 1);
INSERT INTO db_books.book_author (book_id, author_id) values (3, 4);
INSERT INTO db_books.book_author (book_id, author_id) values (4, 3);
