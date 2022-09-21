/* Populate database with sample data. */

INSERT INTO animals (name) VALUES ('Luna');
INSERT INTO animals (name) VALUES ('Daisy');
INSERT INTO animals (name) VALUES ('Charlie');

/* to insert data into table animals*/
INSERT INTO animals (name, date_of_birth , escape_attempts, neutered, weight_kg)
VALUES ( 'Agumon', DATE '2020-02-03', 0, TRUE, 10.23),
	    ( 'Gabumon', DATE '2018-11-05', 2, FALSE, 8),
	    ('Pikachu', DATE '2021-01-07', 1, TRUE, 15.04),
	    ('Devimon', DATE '2017-05-12', 5, TRUE, 11);

        