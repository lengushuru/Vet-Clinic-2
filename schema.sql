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