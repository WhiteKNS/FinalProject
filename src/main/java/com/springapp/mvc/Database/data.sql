CREATE USER contactmanager@localhost identified BY '1234';
GRANT usage ON *.* TO contactmanager@localhost identified BY '1234';
CREATE DATABASE IF NOT EXISTS contactmanager;
GRANT ALL privileges ON contactmanager.* TO contactmanager@localhost;
USE FinalProject;
CREATE TABLE USER
  (
     id        INT PRIMARY KEY AUTO_INCREMENT,
     firstname VARCHAR(30),
     lastname  VARCHAR(30),
     password VARCHAR(16),
     phone VARCHAR(15),
     email     VARCHAR(30),
     login VARCHAR(15),
     birthdate VARCHAR(8),

     created   TIMESTAMP DEFAULT NOW()
  );