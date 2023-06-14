-- Create a new database
CREATE DATABASE IF NOT EXISTS `TransModus`;


-- Use the newly created database
USE `TransModus`;

-- Create a new table
CREATE TABLE IF NOT EXISTS client (
  `client_id` INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(50) NOT NULL,
  `login` VARCHAR(50) NOT NULL,
  `password` VARCHAR(50) NOT NULL,
  `birthday_month` CHAR(3) NOT NULL,
  `birthday_day` INT(2) NOT NULL,
  `birthday_year` INT(4) NOT NULL
);


-- Insert data into the table
INSERT INTO client (name, login, password, birthday_month, birthday_day, birthday_year)
VALUES ('John Doe', 'john.doe@example.com', 'biscuitwarrior', 'Jan', 01, 2000),
       ('Jane Smith', 'jane.smith@example.com', 'justiceandliberty123', 'Aug', 18, 2002),
       ('Mike Johnson', 'mike.johnson@example.com', 'password123', 'Apr', 28, 2003);

-- Remove duplicates from the table
DELETE c1 FROM client c1
                   JOIN
               client c2 ON c1.name = c2.name
                   AND c1.login = c2.login
                   AND c1.birthday_month = c2.birthday_month
                   AND c1.birthday_day = c2.birthday_day
                   AND c1.birthday_year = c2.birthday_year
WHERE
        c1.client_id > c2.client_id;

-- Retrieve data from the table
SELECT
    LPAD(client_id, 5, '0') AS formatted_id,
    name,
    login,
    password,
    birthday_month,
    birthday_day,
    birthday_year
FROM
    client;
