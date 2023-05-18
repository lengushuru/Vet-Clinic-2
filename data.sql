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

insert into vets(name, age, date_of_graduation)
  values
    ('William Tatcher', 45, '2000-04-23'),
    ('Maisy Smith', 26, '2019-01-17'),
    ('Stephanie Mendez', 64, '1981-05-04'),
    ('Jack Harkness', 38, '2008-02-11');

  insert into specializations(vet_id, species_id)
  values
    (1, (select id from species where name = 'Pokemon')),
    (3, (select id from species where name = 'Pokemon')),
    (3, (select id from species where name = 'Digimon')),
    (4, (select id from species where name = 'Digimon'));

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES
  ((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '2020-05-24'),
  ((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2020-07-22'),
  ((SELECT id FROM animals WHERE name = 'Gabumon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2021-02-02'),
  ((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-01-05'),
  ((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-03-08'),
  ((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-05-14'),
  ((SELECT id FROM animals WHERE name = 'Devimon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2021-05-04'),
  ((SELECT id FROM animals WHERE name = 'Charmander'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2021-02-24'),
  ((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-12-21'),
  ((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '2020-08-10'),
  ((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2021-04-07'),
  ((SELECT id FROM animals WHERE name = 'Squirtle'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2019-09-29'),
  ((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2020-10-03'),
  ((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2020-11-04'),
  ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-01-24'),
  ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-05-15'),
  ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-02-27'),
  ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-08-03'),
  ((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2020-05-24'),
  ((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '2021-01-11');