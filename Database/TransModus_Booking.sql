-- Create a new database
CREATE DATABASE IF NOT EXISTS `TransModus`;

-- Use the newly created database
USE `TransModus`;

-- Create a new table on booking system
CREATE TABLE IF NOT EXISTS booking (
        booking_id INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,
        booking_name VARCHAR(50) NOT NULL,
        date_time DATETIME
);

ALTER TABLE booking AUTO_INCREMENT = 1;
ALTER TABLE booking MODIFY booking_id INT NOT NULL AUTO_INCREMENT;

-- Insert data into the booking table
INSERT INTO booking (booking_name, date_time)
VALUES ('LAX to SFO', '2023-01-01 15:11:36');

-- Removes Duplicates
DELETE c1 FROM booking c1
        INNER JOIN booking c2
            WHERE
            c1.booking_id > c2.booking_id AND
            c1.booking_name = c2.booking_name;


-- Retrieve data from booking table
SELECT
    LPAD(booking_id, 5, '0') AS booking_id,
    booking_name,
    date_time
FROM
    booking


