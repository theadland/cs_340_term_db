CREATE TABLE Regions( 
region_ID INT AUTO_INCREMENT PRIMARY KEY, 
name VARCHAR(255) NOT NULL, 
geographical_size FLOAT(23) NOT NULL, 
population INT NOT NULL, 
electricity_requirement FLOAT(23) NOT NULL, 
heat_requirement FLOAT(23) NOT NULL
);

CREATE TABLE FuelTypes( 
fuel_type_ID INT AUTO_INCREMENT PRIMARY KEY, 
name VARCHAR(255) NOT NULL 
);

CREATE TABLE Technologies( 
technology_ID INT AUTO_INCREMENT PRIMARY KEY, 
name VARCHAR(255) NOT NULL 
);

CREATE TABLE Facilities( 
plant_ID INT AUTO_INCREMENT PRIMARY KEY, 
name VARCHAR(255) NOT NULL, 
location_country VARCHAR(255) NOT NULL DEFAULT "", 
location_state VARCHAR(255) NOT NULL DEFAULT "", 
location_street_address VARCHAR(255) NOT NULL DEFAULT "", 
location_latitude FLOAT(23) NOT NULL, 
location_longitude FLOAT(23) NOT NULL, 
date_of_construction DATE NOT NULL, 
cost_of_construction FLOAT(23) NOT NULL, 
power_output FLOAT(23) NOT NULL, 
emission_output FLOAT(23) NOT NULL, 
region_ID INT,
FOREIGN KEY (region_ID) REFERENCES Regions(region_ID) 
);

CREATE TABLE FuelUsages( 
plant_ID INT, 
fuel_type_ID INT, 
PRIMARY KEY(plant_ID, fuel_type_ID), 
FOREIGN KEY (plant_ID) REFERENCES Facilities(plant_ID) ON DELETE CASCADE ON UPDATE CASCADE, 
FOREIGN KEY (fuel_type_ID) REFERENCES FuelTypes(fuel_type_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE FacilityTechnologies( 
plant_ID INT, 
technology_ID INT, 
PRIMARY KEY(plant_ID, technology_ID), 
FOREIGN KEY (plant_ID) REFERENCES Facilities(plant_ID) ON DELETE CASCADE ON UPDATE CASCADE, 
FOREIGN KEY (technology_ID) REFERENCES Technologies(technology_ID) ON DELETE CASCADE ON UPDATE CASCADE 
);

INSERT INTO Facilities(name, location_country, location_state, location_street_address, location_latitude, location_longitude, date_of_construction, cost_of_construction, power_output, emission_output) VALUES 
('Diablo Canyon', 'USA', 'California', 'San Luis Obispo', 35.12, 120.51, '1985-05-07', 11.556, 2256, 3411), 
('Three Gorges Dam', 'China', 'Hubei','Sandouping', 30.49, 111.00, '2012-06-14', 31.756, 22500, 0), 
('Altbach Power Station', 'Germany', 'Baden-Wurttemberg', 'Altbach', 48.43, 9.22, '1950-01-01', 0, 1200, 0);

INSERT INTO Regions(name, geographical_size, population, electricity_requirement, heat_requirement) VALUES 
('Western Interconnect', 1009688, 53669422, 150700, 0),
('Baden-Wurttemberg', 13803.72, 11111496, 3139583, 0);

INSERT INTO FuelTypes(name) VALUES 
('Coal'), ('Gas'), ('Wind'), ('Uranium'), ('Hydropower'), ('Sunlight'), ('Oil'), ('Geothermal Heat');

INSERT INTO Technologies(name) VALUES 
('Fuel Burning Turbine'), ('Nuclear Fission'), ('Wind Turbine'), ('Photo-voltaic Panel'), ('Geothermal'), ('Gravity');

INSERT INTO FuelUsages(plant_ID, fuel_type_ID) VALUES 
(1, 4), (3, 1);

INSERT INTO FacilityTechnologies(plant_ID, technology_ID) VALUES 
(1, 2), (2, 4), (3, 1);

DROP TABLE facilitytechnologies, fuelusages, facilities, technologies, fueltypes, regions;
