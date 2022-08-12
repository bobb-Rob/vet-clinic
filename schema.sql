/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL(6,2),    
    PRIMARY KEY(id)
);

ALTER TABLE animals ADD COLUMN species VARCHAR(100);

-- CREATE TABLE - OWNERS---------------------------
CREATE TABLE owners (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR(100),
    age INT
);

-- CREATE TABLE - species---------------------------
CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100)
);

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id INT,
ADD COLUMN owner_id INT;

ALTER TABLE animals
ADD CONSTRAINT FK_species_animals FOREIGN KEY (species_id) REFERENCES species (id),
ADD CONSTRAINT FK_owners_animals FOREIGN KEY (owner_id) REFERENCES owners (id);
