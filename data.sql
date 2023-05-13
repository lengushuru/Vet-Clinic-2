/* Populate database with sample data. */
INSERT INTO animals(name,date_of_birth,weight_kg,neutered, escape_attempts) 
VALUES 
  ('Charmander', '2020-02-08', -11, false, 0),
  ('Plantmon', '2021-11-15', -5.7, true, 2),
  ('Squirtle', '1993-04-02', -12.13, false, 3),
  ('Angemon', '2005-06-12', -45, true, 1),
  ('Boarmon', '2005-06-07', 20.4, true, 7),
  ('Blossom', '1998-10-13', 17, true, 3),
  ('Ditto', '2022-05-14', 22, true, 4);

  INSERT INTO owners(full_name, age)
VALUES
  ('Sam Smith', 34),
  ('Jennifer Orwell', 19),
  ('Bob', 45),
  ('Melody Pond', 77),
  ('Dean Winchester', 14),
  ('Jodie Whittaker', 38);

INSERT into species(name)
values
  ('Pokemon'),
  ('Digimon');

update animals set species_id = case 
  when name like '%mon' then (select id from species where name = 'Digimon')
  else (select id from species where name = 'Pokemon')
end;

BEGIN;
UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animals.name = 'Agumon' AND owners.full_name = 'Sam Smith';
UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animals.name IN ('Gabumon', 'Pikachu') AND owners.full_name = 'Jennifer Orwell';
UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animals.name IN ('Charmander', 'Squirtle', 'Blossom') AND owners.full_name = 'Melody Pond';
UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animals.name IN ('Angemon', 'Boarmon') AND owners.full_name = 'Dean Winchester';
UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animals.name IN ('Devimon', 'Plantmon') AND owners.full_name = 'Bob';
COMMIT;