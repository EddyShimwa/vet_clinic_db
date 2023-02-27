/* Database schema to keep the structure of entire database. */
CREATE TABLE animals(
  id INT GENERATED ALWAYS AS IDENTITY,
  name  VARCHAR(100),
  date_of_birth   DATE,
  escape_attempts  INT,
  neutered   BOOLEAN,
  weight_kg   DECIMAL,
  PRIMARY KEY (id)
);

ALTER TABLE animals ADD species VARCHAR(255);

CREATE TABLE owner (
    id bigserial PRIMARY KEY,
    full_name VARCHAR(100),
    age INT
);

CREATE TABLE species (
    id bigserial PRIMARY KEY,
    name VARCHAR(100)
);

ALTER TABLE animals
    DROP COLUMN species;
ALTER TABLE animals
    ADD species_id INT;
ALTER TABLE animals
    ADD owner_id INT;

CREATE TABLE vets (
    id serial PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    date_of_graduation DATE
);

CREATE TABLE specializations (
    species_id INT REFERENCES species(id),
	   vet_id INT REFERENCES vets(id)
);

CREATE TABLE visits (
    animal_id INT REFERENCES animals(id),
    vet_id INT REFERENCES vets(id),
    visited_date date NOT NULL DEFAULT CURRENT_DATE
);



