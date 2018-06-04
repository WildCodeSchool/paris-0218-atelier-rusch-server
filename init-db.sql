DROP DATABASE IF EXISTS rusch;
CREATE DATABASE rusch;
USE rusch;
CREATE TABLE homepage (
	id INT NOT NULL AUTO_INCREMENT,
	title varchar(64),
	description varchar(1024),
	PRIMARY KEY (id)
) ENGINE=INNODB ;

INSERT INTO homepage (title, description)
	VALUES ("notre titre", "notre description");

SELECT * FROM homepage;
