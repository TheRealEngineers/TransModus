-- Create a new database
CREATE DATABASE IF NOT EXISTS `TransModus`;


-- Use the newly created database
USE `TransModus`;

-- Create a new table on clients
CREATE TABLE IF NOT EXISTS client (
    `client_id` INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50) NOT NULL,
    `login` VARCHAR(50) NOT NULL,
    `email` VARCHAR(50) DEFAULT NULL,
    `password` VARCHAR(50) NOT NULL,
    `birthday_month` CHAR(3) NOT NULL,
    `birthday_day` INT(2) NOT NULL,
    `birthday_year` INT(4) NOT NULL
);

ALTER TABLE client AUTO_INCREMENT = 1;
ALTER TABLE client MODIFY client_id int NOT NULL AUTO_INCREMENT;

-- Insert data into the table
INSERT INTO client (name, login, email, password, birthday_month, birthday_day, birthday_year)
VALUES ('John Doe', 'jdoe1', 'john.doe@example.com', 'biscuitwarrior', 'Jan', 1, 2000),
       ('Jane Smith', 'jsmith2', 'jane.smith@example.com', 'justiceandliberty123', 'Aug', 18, 2002),
       ('Mike Johnson','mjohnson3', 'mike.johnson@example.com', 'password123', 'Apr', 28, 2003);

-- Remove duplicates from the table
DELETE c1 FROM client c1
               JOIN
               client c2 ON c1.client_id > c2.client_id
               WHERE
                   c1.client_id = c2.client_id
                   AND c1.name = c2.name
                   OR c1.login = c2.login
                   OR c1.email = c2.email
                   AND c1.birthday_month = c2.birthday_month
                   AND c1.birthday_day = c2.birthday_day
                   AND c1.birthday_year = c2.birthday_year;
-- WHERE
   --     c1.client_id > c2.client_id;
-- Will remove the users without email?
DELETE FROM client WHERE email = '';

-- Retrieve data from the table (permanently)
-- TransModus User Database
SELECT
    LPAD(client_id, 5, '0') AS user_id,
    name,
    login AS username,
    email,
    password,
    (CONCAT(UCASE(LEFT(birthday_month, 1)),LCASE(SUBSTRING(birthday_month, 2)))) AS birthday_month,
    birthday_day,
    birthday_year
FROM
    client
WHERE
    email <> '';