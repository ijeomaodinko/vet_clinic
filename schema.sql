/* Database schema to keep the structure of entire database. */

/*to create a database with the name vet_clinic*/

CREATE DATABASE vet_clinic;

/* to create a table with name animals in vet_clinic database*/

CREATE TABLE animals (
    id BIGSERIAL PRIMARY KEY,
    name varchar(100) NOT NULL,
    date_of_birth Date NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL
);
/* to add another column species*/
ALTER TABLE animals ADD COLUMN species VARCHAR (100); 

/* to create the table owner*/
CREATE TABLE owners (
    id BIGSERIAL PRIMARY KEY,
    full_name VARCHAR NOT NULL,
    age INT NOT NULL
);

/*to create species table*/
CREATE TABLE species (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR (100) NOT NULL
);



/* to remove the column speicies in animals table*/
ALTER TABLE animals DROP COLUMN species;

/*to add column species_id which is a foreign key*/
ALTER TABLE animals ADD  COLUMN species_id INT, ADD CONSTRAINT f_species_id FOREIGN KEY (species_id) REFERENCES species(id) ON DELETE CASCADE;

/*to add column owners_id which is a foreign key*/
ALTER TABLE animals ADD  COLUMN owners_id INT, ADD CONSTRAINT f_owners_id FOREIGN KEY (owners_id) REFERENCES owners(id) ON DELETE CASCADE;
