/*
Two Tables
- Showing Tickets (tickets)
- Client has tickets (trips)



Tickets
    - Transportation (Bus, Train, Plane)
    - Transit ID
    - Station
    - Company
    - Origin
    - Destination
    - Depart Date
    - Arrival Date
    - Departure Time
    - Arrival Time
    - Fare

Trips
    - Client ID
    - Transit ID
    - Transportation (Bus, Train, Plane)
    - Station
    - Company
    - Origin
    - Destination
    - Departure Time
    - Arrival Time
    - Fare
    - Booked?
*/

-- Use database
USE sql9630816;

-- Create a new table on ticket
CREATE TABLE IF NOT EXISTS tickets
(
    `transportation` ENUM ('Bus', 'Train', 'Plane') NOT NULL,
    `transit_id`     INT(5) NOT NULL,
    `station`        VARCHAR(50) NOT NULL,
    `company`        VARCHAR(50) NOT NULL,
    `origin`         VARCHAR(50) NOT NULL,
    `destination`    VARCHAR(50) NOT NULL,
    `depart_date`    TIME NOT NULL,
    `return_date`    TIME NOT NULL,
    `depart_time`    TIME NOT NULL,
    `arrival_time`   TIME NOT NULL,
    `fare`          decimal(19,4) DEFAULT NULL
);

-- Create a new table on trips
CREATE TABLE IF NOT EXISTS trips
(
    `client_id` INT(9) NOT NULL PRIMARY KEY,
    `transit_id`     INT(5) NOT NULL,
    `transportation` ENUM ('Bus', 'Train', 'Plane') NOT NULL,
    `station`        VARCHAR(50) NOT NULL,
    `company`        VARCHAR(50) NOT NULL,
    `origin`         VARCHAR(50) NOT NULL,
    `destination`    VARCHAR(50) NOT NULL,
    `depart_date`    TIME NOT NULL,
    `return_date`    TIME NOT NULL,
    `depart_time`    TIME NOT NULL,
    `arrival_time`   TIME NOT NULL,
`fare`               decimal(19,4) DEFAULT NULL,
    `status`         ENUM ('Booked', 'Waiting') NOT NULL DEFAULT 'Waiting'
);



-- Tickets
SELECT * FROM tickets;
-- Trips
SELECT * FROM trips;