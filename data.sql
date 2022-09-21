/* Populate database with sample data. */

/* to insert data into table animals*/
INSERT INTO animals (name, date_of_birth , escape_attempts, neutered, weight_kg)
VALUES ( 'Agumon', DATE '2020-02-03', 0, TRUE, 10.23),
	    ( 'Gabumon', DATE '2018-11-05', 2, FALSE, 8),
	    ('Pikachu', DATE '2021-01-07', 1, TRUE, 15.04),
	    ('Devimon', DATE '2017-05-12', 5, TRUE, 11);

 /*to set the neutered value of Gabumon to TRUE since she was neutered*/
UPDATE animals SET neutered = TRUE  WHERE name= 'Gabumon';

 /* set the neutered value of Pikachu to FALSE since he was not neutered*/
 UPDATE animals SET neutered = FALSE  WHERE name= 'Pikachu';