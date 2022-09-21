/* Database schema to keep the structure of entire database. */

/*to create a database with the name vet_clinic*/

CREATE DATABASE vet_clinic;

/* to create a table with name animals in vet_clinic database*/

CREATE TABLE animal (
    id BIGSERIAL PRIMARY KEY,
    name varchar(100) NOT NULL,
    date_of_birth Date NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL
);


CREATE TABLE animals (
    name varchar(100)
);
