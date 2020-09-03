-- Create a database and a table with one entry server                                     
CREATE DATABASE IF NOT EXISTS tyrell_corp;
USE tyrell_corp;
CREATE TABLE nexus6 (id INT, name VARCHAR(20));
INSERT INTO nexus6 (id,name) VALUES(1,"Leon");
GRANT SELECT ON nexus6 TO 'holberton_user'@'localhost'
