-- Use the newly created database
USE `sql9630816`;

-- Create a new table on clients
CREATE TABLE IF NOT EXISTS client (
    `client_id` INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `firstname` VARCHAR(50) NOT NULL,
    `lastname` VARCHAR(50) NOT NULL,
    `login` VARCHAR(50) NOT NULL,
    `email` VARCHAR(50) DEFAULT NULL,
    `password` VARCHAR(50) NOT NULL,
    `birthday_month` CHAR(3) NOT NULL,
    `birthday_day` INT(2) NOT NULL,
    `birthday_year` INT(4) NOT NULL,
    `phone_number` VARCHAR(10) DEFAULT NULL,
    `admin_access` ENUM ('YES', 'NO') NOT NULL DEFAULT 'NO'
);

-- Remove duplicates from the table
DELETE c1 FROM client c1
               JOIN
               client c2 ON c1.client_id > c2.client_id
               WHERE
                   c1.client_id = c2.client_id
                   AND c1.firstname = c2.firstname
                   AND c1.lastname = c2.lastname
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
-- TransModus User
SELECT
    LPAD(client_id, 5, '0') AS user_id,
    firstname,
    lastname,
    login AS username,
    email,
    password,
    (CONCAT(UCASE(LEFT(birthday_month, 1)),LCASE(SUBSTRING(birthday_month, 2)))) AS birthday_month,
    birthday_day,
    birthday_year,
    ufn_FormatPhone(phone_number) AS phone_number
FROM
    client
WHERE
    email <> '';

-- TransModus Admin Table
SELECT
    LPAD(client_id, 5, '0') AS user_id,
    firstname,
    lastname,
    CONCAT(UCASE(LEFT(birthday_month, 1)), LCASE(SUBSTRING(birthday_month, 2)), ' ', birthday_day, ', ', birthday_year) AS dateOfBirth,
    email,
    ufn_FormatPhone(phone_number) AS phone_number,
    login AS username,
    password,
    admin_access
FROM
    client;