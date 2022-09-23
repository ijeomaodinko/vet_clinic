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

 /*to insert data into the table*/
 INSERT INTO animals (name, date_of_birth , escape_attempts, neutered, weight_kg)
VALUES ( 'Charmander', DATE '2020-02-08', 0, FALSE, -11),
	    ( 'Plantmon', DATE '2021-11-15', 2, TRUE, -5.7),
	    ('Squirtle', DATE '1993-04-02', 3, FALSE, -12.13),
	    ('Angemon', DATE '2005-06-12', 1, TRUE,  -45),
        ( 'Boarmon', DATE '2005-06-07', 7, TRUE, 20.4),
	    ('Blossom', DATE '1998-10-13', 3,  TRUE, 17),
	    ('Ditto', DATE '2022-05-14', 4, TRUE, 22);


/*to insert data into the owners table*/
  INSERT INTO owners (full_name, age)
VALUES ( 'Sam Smith', 34),
	    ( 'Jennifer Orwell', 19),
	    ('Bob', 45),
	    ('Melody', 77),
        ( 'Dean Winchester', 14),
	    ('Jodie Whittaker', 38);
	   
/*to insert data into the species tables*/
 INSERT INTO species (name)
VALUES ( 'Pokemon'),
	    ( 'Digimon');

/*to update animals species*/
UPDATE animals SET species_id= '2' WHERE name LIKE '%mon';

UPDATE animals SET species_id= '1' WHERE name NOT LIKE '%mon';

/*to update animal owners*/
UPDATE animals SET owners_id='1' WHERE name ='Agumon';
UPDATE animals SET owners_id='2' WHERE name ='Gabumon' OR name='Pikachu';
UPDATE animals SET owners_id='3' WHERE name ='Devimon' OR name='Plantmon';
UPDATE animals SET owners_id='4' WHERE name ='Charmander' OR name='Squirtle' OR name='Blossom';
UPDATE animals SET owners_id='5' WHERE name IN ('Angemon', 'Boarmon');

/*to add data in the vets table*/
INSERT INTO vets (name, age, date_of_graduation) VALUES 
('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-19'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2008-06-08');

/*to add data in the specializations table*/
INSERT INTO specializations (vets_id, species_id) VALUES 
((SELECT id FROM vets WHERE name='William Tatcher'), (SELECT id FROM species WHERE name='Pokemon')),
((SELECT id FROM vets WHERE name='Stephanie Mendez'), (SELECT id FROM species WHERE name='Digimon')),
((SELECT id FROM vets WHERE name='Stephanie Mendez'), (SELECT id FROM species WHERE name='Pokemon')),
((SELECT id FROM vets WHERE name='Jack Harkness'), (SELECT id FROM species WHERE name='Digimon'));

/*to add data in the visits table*/
INSERT INTO visits (animals_id, vets_id, date_of_visit ) VALUES
((SELECT id FROM animals WHERE name='Agumon'), (SELECT id FROM vets WHERE name='William Tatcher'), '2020-05-24'),
((SELECT id FROM animals WHERE name='Agumon'), (SELECT id FROM vets WHERE name='Stephanie Mendez'), '2020-07-22'),
((SELECT id FROM animals WHERE name='Gabumon'), (SELECT id FROM vets WHERE name='Jack Harkness'), '2020-02-02'),
((SELECT id FROM animals WHERE name='Pikachu'), (SELECT id FROM vets WHERE name='Maisy Smith'), '2020-01-05'),
((SELECT id FROM animals WHERE name='Pikachu'), (SELECT id FROM vets WHERE name='Maisy Smith'), '2020-03-08'),
((SELECT id FROM animals WHERE name='Pikachu'), (SELECT id FROM vets WHERE name='Maisy Smith'), '2020-05-14'),
((SELECT id FROM animals WHERE name='Devimon'), (SELECT id FROM vets WHERE name='Stephanie Mendez'), '2021-05-04'),
((SELECT id FROM animals WHERE name='Charmander'), (SELECT id FROM vets WHERE name='Jack Harkness'), '2021-02-24'),
((SELECT id FROM animals WHERE name='Plantmon'), (SELECT id FROM vets WHERE name='Maisy Smith'), '2019-12-21'),
((SELECT id FROM animals WHERE name='Plantmon'), (SELECT id FROM vets WHERE name='William Tatcher'), '2020-08-10'),
((SELECT id FROM animals WHERE name='Plantmon'), (SELECT id FROM vets WHERE name='Maisy Smith'), '2021-04-07'),
((SELECT id FROM animals WHERE name='Squirtle'), (SELECT id FROM vets WHERE name='Stephanie Mendez'), '2019-09-29'),
((SELECT id FROM animals WHERE name='Angemon'), (SELECT id FROM vets WHERE name='Jack Harkness'), '2020-10-03'),
((SELECT id FROM animals WHERE name='Angemon'), (SELECT id FROM vets WHERE name='Jack Harkness'), '2020-11-04'),
((SELECT id FROM animals WHERE name='Boarmon'), (SELECT id FROM vets WHERE name='Maisy Smith'), '2019-01-24'),
((SELECT id FROM animals WHERE name='Boarmon'), (SELECT id FROM vets WHERE name='Maisy Smith'), '2019-05-15'),
((SELECT id FROM animals WHERE name='Boarmon'), (SELECT id FROM vets WHERE name='Maisy Smith'), '2020-02-27'),
((SELECT id FROM animals WHERE name='Boarmon'), (SELECT id FROM vets WHERE name='Maisy Smith'), '2020-08-03'),
((SELECT id FROM animals WHERE name='Blossom'), (SELECT id FROM vets WHERE name='Stephanie Mendez'), '2020-05-24'),
((SELECT id FROM animals WHERE name='Blossom'), (SELECT id FROM vets WHERE name='William Tatcher'), '2021-01-11');
