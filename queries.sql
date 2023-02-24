/*Queries that provide answers to the questions from all projects.*/
SELECT * FROM animals WHERE name LIKE '%mon%';

SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT name FROM animals WHERE neutered = 't' AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT name FROM animals WHERE neutered = 't';

SELECT name FROM animals WHERE name <> 'Gabumon';

SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

-- Day two

BEGIN;
UPDATE animals
SET species = 'unspecified';
ROLLBACK;

UPDATE animals
SET species = CASE
WHEN name LIKE '%mon' THEN 'digimon'
ELSE 'pokemon'END
WHERE species IS NULL;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT savepoint;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO savepoint;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT name FROM animals WHERE escape_attempts = (SELECT MAX(escape_attempts) FROM animals);
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, ROUND(AVG(escape_attempts)::numeric, 0) FROM animals WHERE date_of_birth >= '1990-01-01' AND date_of_birth <= '2000-12-31' GROUP BY species;

-- DAY THREE
-- What animals belong to Melody Pond?
SELECT animals.name,owners.full_name FROM animals
  JOIN owners ON animals.owner_id = owners.id
  WHERE owners.full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).
SELECT animals.name, species.name FROM animals
  JOIN species ON animals.species_id = species.id
  WHERE species.name = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT owners.full_name, animals.name FROM animals
  RIGHT JOIN owners ON animals.owner_id = owners.id;

-- How many animals are there per species?
SELECT count(animals.name), species.name FROM animals
  JOIN species ON animals.species_id = species.id
  GROUP BY species.name;

-- List all Digimon owned by Jennifer Orwell.
SELECT owners.full_name, species.name FROM animals
  JOIN owners ON animals.owner_id = owners.id
  JOIN species ON animals.species_id = species.id
  WHERE species.name = 'Digimon'
  and owners.full_name = 'Jennifer Orwell';

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT animals.name, owners.full_name FROM animals
  JOIN owners ON animals.owner_id = owners.id
  WHERE animals.escape_attempts=0
  and owners.full_name = 'Dean Winchester';

  -- Who owns the most animals?
SELECT count(*), owners.full_name FROM animals
  JOIN owners ON animals.owner_id = owners.id
  GROUP BY owners.full_name ORDER BY count desc;
