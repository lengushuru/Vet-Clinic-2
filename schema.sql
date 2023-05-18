/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DOUBLE PRECISION
);

ALTER TABLE animals ADD COLUMN species VARCHAR(50);

CREATE TABLE vets (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255),
    age INT,
    date_of_graduation DATE
);

CREATE TABLE specializations (
    vets_id INT,
    species_id INT,
    PRIMARY KEY (vets_id, species_id),
    FOREIGN KEY (vets_id) REFERENCES vets(id) ON DELETE CASCADE,
    FOREIGN KEY (species_id) REFERENCES species(id) ON DELETE CASCADE
);

CREATE TABLE visits (
    animals_id INT,
    vet_id INT,
    visits_date DATE,
    FOREIGN KEY (animals_id) REFERENCES animals(id) ON DELETE CASCADE,
    FOREIGN KEY (vet_id) REFERENCES vets(id) ON DELETE CASCADE,
    PRIMARY KEY (animals_id, vet_id, visits_date)
);
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

create table vets (id serial primary key, name varchar(255), age integer, date_of_graduation date);

create table specializations (
    vet_id integer references vets(id),
    species_id integer references species(id),
    primary key(vet_id, species_id)
);

create table visits (
    animal_id integer references animals(id),
    vet_id integer references vets(id),
    date_of_visit date,
    primary key(animal_id, vet_id, date_of_visit)
);