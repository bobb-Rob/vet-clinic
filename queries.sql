/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon%';

SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';

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

---------- Aggregates queries-----------
SELECT count(*) FROM animals;

SELECT count(*) FROM animals
WHERE escape_attempts = 0;

SELECT AVG(weight_kg)
FROM animals;

SELECT 
  MAX(escape_attempts)
FROM animals
WHERE neutered = TRUE OR neutered = FALSE;

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
WHERE date_of_birth >= '1990-01-01' AND date_of_birth <= '2000-12-30';


-- Queries using JOIN----------

-- What animals belong to Melody Pond?
SELECT animals.name, owners.full_name 
FROM animals INNER JOIN owners ON owner_id = owners.id
WHERE OWNERS.full_name = 'Melody Pond';

------- List of all animals that are pokemon.
SELECT animals.name, species.name
FROM animals INNER JOIN  species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';


------ List all owners and their animals, remember to include those that don't own any animal.
SELECT owners.full_name as pet_owners, animals.name as pet_name 
FROM owners 
LEFT JOIN animals ON owners.id = animals.owner_id;

------ How many animals are there per species?
 SELECT count(*),species.name 
 FROM animals
 INNER JOIN  species ON animals.species_id = species.id group by species.id;
 
-------  List all Digimon owned by Jennifer Orwell.
 SELECT animals.name, owners.full_name, species.name
  FROM animals
    INNER JOIN  owners  ON animals.owner_id = owners.id 
    INNER JOIN  species  ON animals.species_id = species.id 
    where species.name = 'Digimon' 
    and owners.full_name='Jennifer Orwell';

------- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT animals.name, owners.full_name, animals.escape_attempts
FROM animals
INNER JOIN  owners ON animals.owner_id = owners.id 
WHERE animals.escape_attempts = 0
AND owners.full_name='Dean Winchester';

-- Who owns the most animals? --------------
SELECT owners.full_name,COUNT(*) FROM owners 
 JOIN animals ON owners.id = animals.owner_id
 GROUP BY owners.full_name
 ORDER BY count DESC LIMIT 1;

 -- Who was the last animal seen by William Tatcher?---
 SELECT a.name, v.date_of_visit from animals a
JOIN visits v ON v.animals_id = a.id
JOIN vets ON vets.id = v.vets_id
WHERE vets.name = 'William Tatcher'
ORDER BY visits.date_of_visit DESC LIMIT 1;

