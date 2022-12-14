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
SAVEPOINT animal;

/*Update all animals' weight to be their weight multiplied by -1 */
UPDATE animals SET weight_kg = (weight_kg*-1);

ROLLBACK animal;

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

/* to select animals belong to Melody Pond*/
SELECT name FROM animals INNER JOIN owners ON animals.owners_id = owners.id WHERE full_name = 'Melody';

/*to list of all animals that are pokemon (their type is Pokemon) */
SELECT animals.name FROM animals JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';

/*to list all owners and their animals, remember to include those that don't own any animal*/
SELECT  name, full_name FROM animals  RIGHT JOIN owners ON animals.owners_id = owners.id;

/* to count animals are there per species*/
SELECT species.name, COUNT('*') FROM animals LEFT JOIN species ON animals.species_id = species.id GROUP BY species.id;
SELECT species.name, COUNT('Digimon') FROM  animals LEFT JOIN species ON animals.species_id = species.id GROUP BY species.id;
SELECT species.name, COUNT('Pokemon') FROM  animals LEFT JOIN species ON animals.species_id = species.id GROUP BY species.id;

/*to list all Digimon owned by Jennifer Orwell */
SELECT animals.name  FROM  animals LEFT JOIN species ON animals.species_id = species.id LEFT JOIN owners  ON owners_id = owners.id  WHERE species.id = 1 AND owners.full_name= 'Jennifer Orwell'; 

/*to list all animals owned by Dean Winchester that haven't tried to escape*/
SELECT animals.name  FROM  animals LEFT JOIN owners ON animals.owners_id = owners.id  WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts= 0; 

/*to Who owns the most animals */
SELECT full_name, COUNT(*)  FROM  animals LEFT JOIN owners ON owners_id = owners.id GROUP BY full_name ORDER BY COUNT (*)DESC LIMIT 1;

/* toWho was the last animal seen by William Tatcher */
SELECT animals.name  FROM  animals LEFT JOIN visits ON visits.animals_id = animals.id
LEFT JOIN vets ON visits.vets_id = vets.id WHERE vets.name = 'William Tatcher' ORDER BY visits.date_of_visit DESC LIMIT 1;

/* How many different animals did Stephanie Mendez see*/
SELECT COUNT(animals.name) FROM animals LEFT JOIN visits ON visits.animals_id = animals.id
LEFT JOIN vets ON visits.vets_id =vets.id WHERE vets.name = 'Stephanie Mendez';

/*List all vets and their specialties, including vets with no specialties*/
SELECT vets.name as vets_name, species.name as species_name FROM vets LEFT JOIN specializations ON specializations.vets_id = vets.id FULL JOIN species ON specializations.species_id = species.id;

/*List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020*/
SELECT animals.name FROM animals JOIN visits ON visits.animals_id = animals.id JOIN vets ON visits.vets_id = vets.id WHERE vets.name='Stephanie Mendez' AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

/* What animal has the most visits to vets*/
SELECT animals.name, MAX(animals.name) FROM animals JOIN visits ON visits.animals_id = animals_id GROUP BY animals.name ORDER BY COUNT (animals.name) DESC LIMIT 1;

/*Who was Maisy Smith's first visit*/
SELECT animals.name  FROM animals JOIN visits ON visits.animals_id = animals.id JOIN vets ON visits.vets_id =vets.id WHERE vets.name = 'Maisy Smith' ORDER BY visits.date_of_visit LIMIT 1;

/*Details for most recent visit: animal information, vet information, and date of visit*/
SELECT animals.*, vets.*  FROM animals JOIN visits ON visits.animals_id =animals.id JOIN vets ON visits.vets_id = vets_id  ORDER BY visits.date_of_visit DESC LIMIT 1;

/*How many visits were with a vet that did not specialize in that animal's species*/
SELECT COUNT(*) FROM visits JOIN animals ON visits.animals_id =animals.id JOIN vets ON visits.vets_id = vets.id JOIN specializations ON specializations.vets_id = vets.id WHERE specializations.species_id is NULL;

/* What specialty should Maisy Smith consider getting? Look for the species she gets the most*/
SELECT species.name, COUNT (*) FROM visits JOIN animals ON visits.animals_id =animals.id JOIN species ON animals.species_id = species.id JOIN vets ON visits.vets_id = vets.id WHERE vets.name = 'Maisy Smith' GROUP BY species.name ORDER BY COUNT (*) DESC LIMIT 1;
