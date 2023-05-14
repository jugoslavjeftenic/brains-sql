create user 'springuser'@'localhost' identified by '1234';
create database db_books;
grant all on db_books.* to 'springuser'@'localhost';

drop schema db_project_example;
