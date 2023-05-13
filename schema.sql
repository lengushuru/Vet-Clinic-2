/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT,
    name VARCHAR(100),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DOUBLE PRECISION
);

ALTER TABLE animals ADD COLUMN species VARCHAR(50);

CREATE TABLE owners (
    id BIGSERIAL primary key, 
    full_name varchar(255), 
    age integer
);

CREATE TABLE species (
    id BIGSERIAL primary key, 
    name varchar(255)
);

ALTER TABLE animals DROP column species;
ALTER TABLE animals ADD species_id INT;
ALTER TABLE animals ADD FOREIGN key(species_id) REFERENCES species(id);

ALTER TABLE animals ADD owner_id INT;

ALTER TABLE animals ADD FOREIGN key(owner_id) REFERENCES owners(id);