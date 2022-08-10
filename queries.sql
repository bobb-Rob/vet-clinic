/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon%';

SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-10';

SELECT name FROM animals WHERE neutered=true AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered=true;

SELECT * FROM animals WHERE name='Gabumon';

SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';
ROLLBACK;

BEGIN;
UPDATE animals SET species = 'digimon'
WHERE name LIKE '%mon%';

UPDATE animals SET species = 'pokemon'
WHERE species IS NULL;
COMMIT;

SELECT name, species FROM animals;

BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;

BEGIN;
 DELETE FROM animals
 WHERE date_of_birth > '01-01-2022';
 SAVEPOINT SP1;

UPDATE animals
SET weight_kg = weight_kg * -1;
ROLLBACK TO SP1;

UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;

SELECT count(*) FROM animals;

SELECT count(*) FROM animals
WHERE escape_attempts = 0;

SELECT AVG(weight_kg)
FROM animals;

SELECT 
  MAX(escape_attempts)
FROM animals
WHERE neutered = TRUE OR neutered = FASLE;

SELECT   
  MAX(weight_kg),
  MIN(weight_kg)
FROM animals
WHERE species = 'digimon';

SELECT   
  MAX(weight_kg),
  MIN(weight_kg)
FROM animals
WHERE species = 'pokemon';

SELECT   
  AVG(escape_attempts) ::numeric(10,2)
FROM animals
WHERE date_of_birth >= '1990-01-01' AND date_of_birth <= '2000-31-12';



