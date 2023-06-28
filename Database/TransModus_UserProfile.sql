-- Use the newly created database
USE `TransModus`;

-- Create a new table on booking system
CREATE TABLE IF NOT EXISTS userprofile(
                                          `client_id` INT(9) NOT NULL,
                                          `firstname` VARCHAR(50) NOT NULL,
                                          `lastname` VARCHAR(50) NOT NULL,
                                          `login` VARCHAR(50) NOT NULL,
                                          `birthday_month` CHAR(3) NOT NULL,
                                          `birthday_day` INT(2) NOT NULL,
                                          `birthday_year` INT(4) NOT NULL,
                                          `phone_number` VARCHAR(10) DEFAULT NULL,
                                          `email` VARCHAR(50) DEFAULT NULL
);

-- Insert data into the booking table
INSERT INTO userprofile (client_id, firstname, lastname, login, birthday_month, birthday_day, birthday_year, phone_number, email)
VALUES (00005, 'Chance', 'Chime', 'ChanceChime', 'Apr', 28, 2003, 4242068650, 'chancechime@icloud.com');


-- Retrieve data from booking table
-- TransModus User Profile Database
SELECT
    DISTINCT LPAD (client_id, 5, '0') AS user_id,
             CONCAT_WS(' ', firstname, lastname) AS name,
             login AS username,
             CONCAT(birthday_month,' ',birthday_day,', ',birthday_year) AS date_of_birth,
             ufn_FormatPhone(phone_number) AS phone_number,
             email
FROM
    userprofile
