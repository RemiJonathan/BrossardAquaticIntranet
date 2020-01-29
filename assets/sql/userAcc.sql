CREATE USER regular_user;
GRANT SELECT, INSERT, UPDATE, DELETE, FILE ON *.* TO 'regular_user'@'localhost';
ALTER USER 'regular_user'@'localhost' IDENTIFIED BY 'UChNLJEjh23vrjWr';