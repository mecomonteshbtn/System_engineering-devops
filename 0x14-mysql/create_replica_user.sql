-- Setup replica user as slave on sql server                                     
CREATE USER IF NOT EXISTS 'replica_user'@'localhost';
SET PASSWORD FOR 'replica_user'@'localhost' = 'replicapwd';
GRANT REPLICATION SLAVE ON *.* TO 'replica_user'@'localhost';
GRANT SELECT ON mysql.user TO 'holberton_user'@'localhost';
FLUSH PRIVILEGES;
