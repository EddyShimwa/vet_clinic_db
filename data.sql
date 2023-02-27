-- Day one
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', '2020-02-03', 0, true, 10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', '2018-11-15', 2, true, 8);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', '2021-01-07', 1, false, 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', '2017-05-12', 5, true, 11);
-- Day two
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', '2020-02-08', 0, true, -11);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon', '2021-11-15', 2, true, -5.7);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', '1993-04-02', 3, false, -12.13);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon', '2005-06-12', 1, true, -45);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon', '2005-06-07', 7, true, 20.4);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom', '1998-10-13', 3, true, 17);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Ditto', '2022-05-14', 4, true, 22);

-- day 3
INSERT INTO owners (full_name, age)
  VALUES ('Sam Smith', 34),
  ('Jennifer Orwell', 19),
  ('Bob',45), ('Melody Pond', 77),
  ('Dean Winchester', 14),
  ('Joddie Whittaker', 38);

INSERT INTO species (name)
  VALUES ('Pokemon'),
  ('Digimon');

UPDATE animals SET species_id = 2
  WHERE name LIKE '%mon';

UPDATE animals SET owner_id = 1
  WHERE name='Agumon';

UPDATE animals SET owner_id = 2
  WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animals SET owner_id = 3
  WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals SET owner_id = 4
  WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals SET owner_id = 5
  WHERE name IN ('Angemon', 'Boarmon');


-- day Four

-- Insert dummy data to the vets table
INSERT INTO vets (name, age, date_of_graduation)
  VALUES ('William Tatcher', 45, '2000-04-23'),
  ('Maisy SMith', 26, '2019-01-17'),
  ('Stephanie Mendez', 64, '1981-05-04'),
  ('Jack Harkness', 38, '2008-06-08');

-- Insert data into specializations table
INSERT INTO specializations (vet_id, species_id)
  VALUES (1, 1),(3, 1),(3, 2),(4, 2);

-- Insert data into visits table
INSERT INTO visits (animal_id, vet_id, visited_date)
  VALUES  (1, 1, '2020-05-24'),
  (1, 3, '2020-07-22'),
  (2, 4, '2021-02-02'),
  (3, 2, '2020-01-05'),
  (3, 2, '2020-03-08'),
  (3, 2, '2020-05-14'),
  (4, 3, '2021-05-04'),
  (5, 4, '2021-02-24'),
  (6, 2, '2019-12-21'),
  (6, 1, '2020-08-10'),
  (6, 2, '2021-04-07'),
  (7, 3, '2019-09-29'),
  (8, 4, '2020-10-03'),
  (8, 4, '2020-11-04'),
  (9, 2, '2019-01-24'),
  (9, 2, '2019-05-15'),
  (9, 2, '2020-02-27'),
  (9, 2, '2020-08-03'),
  (10, 3, '2020-05-24'),
  (10, 1, '2021-01-11');


INSERT INTO visits (animal_id, vet_id, visited_date) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';








