--------------------------------------------------------------------------------------------------------
-- Facilities Page
--------------------------------------------------------------------------------------------------------

-- Read all columns and all rows of Facilities table
SELECT FROM Facilities;

-- Create new entry
INSERT INTO Facilities
(name, location_country, location_state, location_street_address, location_latitude, 
location_longitude, date_of_construction, cost_of_construction, power_output, emission_output) 
VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s);

-- Update Entry
UPDATE Facilities 
SET name = %s, location_country SET name = %s, location_state SET name = %s, 
location_street_address SET name = %s, location_latitude SET name = %s, location_longitude SET name = %s, 
date_of_construction SET name = %s, cost_of_construction SET name = %s, power_output SET name = %s, 
emission_output SET name = %s;

-- Delete Entry
DELETE FROM Facilities WHERE plant_ID = '%s';


--------------------------------------------------------------------------------------------------------
-- Technologies Page
--------------------------------------------------------------------------------------------------------

-- Read all columns and all rows of Technologies table
SELECT FROM Technologies;

-- Create new entry
INSERT INTO Technologies (name) VALUES (%s);

-- Update Entry
UPDATE Technologies SET name = %s;

-- Delete Entry
DELETE FROM Technologies WHERE technology_ID = '%s';


--------------------------------------------------------------------------------------------------------
-- Fuel Types Page
--------------------------------------------------------------------------------------------------------

-- Read all columns and all rows of Technologies table
SELECT FROM FuelTypes;

-- Create new entry
INSERT INTO FuelTypes (name) VALUES (%s);

-- Update Entry
UPDATE FuelTypes SET name = %s;

-- Delete Entry
DELETE FROM FuelTypes WHERE fuel_type_ID = '%s';


--------------------------------------------------------------------------------------------------------
-- Regions Page
--------------------------------------------------------------------------------------------------------

-- Read all columns and all rows of Technologies table
SELECT FROM Regions;

-- Create new entry
INSERT INTO Regions (name, geographical_size, population, electricity_requirement, heat_requirement) 
VALUES (%s, %s, %s, %s, %s);

-- Update Entry
UPDATE Regions SET name = %s, geographical_size = %s, population = %s, electricity_requirement = %s, 
heat_requirement = %s;

-- Delete Entry
DELETE FROM Regions WHERE region_ID = '%s';


 --------------------------------------------------------------------------------------------------------
-- Fuel Usages Page
--------------------------------------------------------------------------------------------------------

-- Read all columns and all rows of Technologies table
SELECT FROM FuelUsages;

-- Create new entry
INSERT INTO FuelUsages (plant_ID, fuel_type_ID) 
VALUES (%s, %s);

-- Update Entry
UPDATE FuelTypes SET plant_ID = %s, fuel_type_ID = %s;

-- Delete Entry
DELETE FROM FuelTypes WHERE plant_ID = '%s' AND fuel_type_ID = '%s';


--------------------------------------------------------------------------------------------------------
-- Facility Technologies Page
--------------------------------------------------------------------------------------------------------

-- Read all columns and all rows of Technologies table
SELECT FROM FacilityTechnologies;

-- Create new entry
INSERT INTO FacilityTechnologies (plant_ID, technology_ID) 
VALUES (%s, %s);

-- Update Entry
UPDATE FacilityTechnologies SET plant_ID = %s, technology_ID = %s;

-- Delete Entry
DELETE FROM FacilityTechnologies WHERE plant_ID = '%s' AND technology_ID = "s%";