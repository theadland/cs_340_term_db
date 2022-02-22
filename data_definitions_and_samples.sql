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
FOREIGN KEY (plant_ID) REFERENCES Facilities(plant_ID), 
FOREIGN KEY (fuel_type_ID) REFERENCES FuelTypes(fuel_type_ID)
);

CREATE TABLE FacilityTechnologies( 
plant_ID INT, 
technology_ID INT, 
PRIMARY KEY(plant_ID, technology_ID), 
FOREIGN KEY (plant_ID) REFERENCES Facilities(plant_ID), 
FOREIGN KEY (technology_ID) REFERENCES Technologies(technology_ID) 
);

INSERT INTO Facilities(name, location_country, location_state, location_street_address, location_latitude, location_longitude, date_of_construction, cost_of_construction, power_output, emission_output) VALUES 
('Diablo Canyon', 'USA', 'California', 'San Luis Obispo', 35.12, 120.51, '1985-05-07', 11.556, 2256, 3411);
