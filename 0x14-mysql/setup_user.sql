-- Setup primary/replica user on sql server                                     
CREATE USER IF NOT EXISTS 'holberton_user'@'localhost';
SET PASSWORD FOR 'holberton_user'@'localhost' = 'projectcorrection280hbtn';
GRANT REPLICATION CLIENT ON *.* TO 'holberton_user'@'localhost';
FLUSH PRIVILEGES;
