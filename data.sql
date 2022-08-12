/* Populate database with sample data. */

INSERT INTO animals  (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Agumon', '2020-2-3', 0, true, 10.23),
  ('Gabumon', '2018-11-15', 2, true, 8.0),
  ('Pikachu', '2021-1-7', 1, false, 15.04),
  ('Devimon', '2017-5-12', 5, true, 11.0);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Charmander', '02-08-2020', 0, false, -11.0),
('Plantmon', '11-15-2021', 2, true, -5.7),
('Squirtle', '04-02-1993', 3, false, -12.13),
('Angemon', '06-12-2005', 1, true, -45.0);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Boarmon', '06-07-2005', 7, true, 20.4),
('Blossom', '10-13-1998', 3, true, 17.0),
('Ditto', '05-14-2022', 4, true, 22.0);
