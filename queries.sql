/*Queries that provide answers to the questions from all projects.*/

/* to select records where name ends with mon*/
SELECT name FROM animals WHERE  name LIKE '%mon';

/*to list the name of all animals born between 2016 and 2019.*/
SELECT name FROM animals WHERE date_of_birth  BETWEEN  '2016-01-01' AND '2019-12-31';

/*to list the name of all animals that are neutered and have less than 3 escape attempts.*/
SELECT name FROM animals WHERE neutered = True AND escape_attempts <=3;

/*to list the date of birth of all animals named either "Agumon" or "Pikachu".*/
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name= 'Pikachu';

/* to list name and escape attempts of animals that weigh more than 10.5kg*/
SELECT name, escape_attempts FROM animals WHERE weight_kg >= 10.5;

/* to find all animals that are neutered*/
SELECT * FROM animals WHERE neutered = TRUE;

/* to find all animals not named Gabumon*/
SELECT * FROM animals WHERE name != 'Gabumon';

/* to Find all animals with a weight between 10.4kg and 17.3kg 
(including the animals with the weights that equals precisely 10.4kg or 17.3kg */
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

/* to set the value of species to unspecified*/
UPDATE  animals SET species = 'unspecified'; 

/* to begin transaction */
BEGIN TRANSACTION;

/* to rollback transaction  before committing transaction*/
ROLLBACK TRANSACTION;

/* to update the animals table by setting the 
species column to digimon for all animals that have a name ending in mon*/
UPDATE animals SET species ='digimon' WHERE name LIKE '%mon';

/* to update the animals table by setting the 
species column to pokemon for all animals that don't have species already set.*/
UPDATE animals SET species ='pokemon' WHERE species = '';
UPDATE animals SET species ='pokemon' WHERE name NOT  LIKE '%mon';

/*to delete all records*/
DELETE FROM animals WHERE id >=1 AND id <=11; 

/*to delete all animals born after Jan 1st, 2022.*/
DELETE FROM animals WHERE date_of_birth >= '2022-01-01';

/*to create a savepoint for the transaction*/
SAVEPOINT animaldel;

/*Update all animals' weight to be their weight multiplied by -1 */
UPDATE animals SET weight_kg = (weight_kg*-1);

ROLLBACK animaldel;

/* to update all animals' weights that are negative to be their weight multiplied by -1. */
UPDATE animals SET weight_kg = (weight_kg*-1) WHERE weight_kg < 0;

/*to count how many animals are there*/
SELECT COUNT (*)FROM animals;

/* to count how many animals have never tried to escape*/
SELECT COUNT (*)FROM animals WHERE escape_attempts = 0;

/* to the average weight of animals*/
SELECT AVG(weight_kg) FROM animals;

/* escapes the most, neutered or not neutered animals*/
SELECT  MAX(escape_attempts) FROM animals;

/* the minimum and maximum weight of each type of animal*/
SELECT species,  MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;


/* the average number of escape attempts per animal type of those born between 1990 and 2000*/
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth >= '1990-01-01' AND date_of_birth <= '2000-12-31'GROUP BY species;
