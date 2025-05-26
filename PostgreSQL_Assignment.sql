CREATE DATABASE conservation_db;

-- 1. Table Creation

-- rangers table
CREATE TABLE IF NOT EXISTS rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    region VARCHAR(100) NOT NULL
);

-- species table
CREATE TABLE IF NOT EXISTS species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(150) NOT NULL,
    discovery_date DATE NOT NULL,
    conservation_status VARCHAR(50) NOT NULL
);

-- sightings table
CREATE TABLE IF NOT EXISTS sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INT NOT NULL REFERENCES rangers(ranger_id),
    species_id INT NOT NULL REFERENCES species(species_id),
    sighting_time TIMESTAMP NOT NULL,
    location VARCHAR(150) NOT NULL,
    notes TEXT
);

-- 2. Sample Data Insertion

-- Rangers
INSERT INTO rangers (name, region) VALUES
    ('Alice Green', 'Northern Hills'),
    ('Bob White',   'River Delta'),
    ('Carol King',  'Mountain Range');

-- Species
INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES
    ('Snow Leopard',     'Panthera uncia',          '1775-01-01', 'Endangered'),
    ('Bengal Tiger',     'Panthera tigris tigris',  '1758-01-01', 'Endangered'),
    ('Red Panda',        'Ailurus fulgens',         '1825-01-01', 'Vulnerable'),
    ('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');

-- Sightings
INSERT INTO sightings (species_id, ranger_id, location, sighting_time, notes) VALUES
    (1, 1, 'Peak Ridge',        '2024-05-10 07:45:00', 'Camera trap image captured'),
    (2, 2, 'Bankwood Area',     '2024-05-12 16:20:00', 'Juvenile seen'),
    (3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
    (1, 2, 'Snowfall Pass',     '2024-05-18 18:30:00', NULL);


-- 3. Queries (Problems 1–9)



-- Problem 1: Register a new ranger with provided data with name = 'Derek Fox' and region = 'Coastal Plains'
INSERT INTO rangers (name, region)
VALUES ('Derek Fox', 'Coastal Plains');


-- Problem 2: Count unique species ever sighted.
SELECT COUNT(DISTINCT species_id) AS unique_species_count
FROM sightings;


-- Problem 3: Find all sightings where the location includes "Pass".
SELECT sighting_id, species_id, ranger_id, location, sighting_time, notes
FROM sightings
WHERE location ILIKE '%Pass%';


-- Problem 4: List each ranger's name and their total number of sightings.
SELECT r.name,
COUNT(s.sighting_id) AS total_sightings
FROM rangers r
LEFT JOIN sightings s ON r.ranger_id = s.ranger_id
GROUP BY r.name
ORDER BY r.name;