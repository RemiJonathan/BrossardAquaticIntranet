CREATE USER regular_user;
GRANT SELECT, INSERT, UPDATE, DELETE, FILE ON *.* TO 'regular_user'@'localhost';