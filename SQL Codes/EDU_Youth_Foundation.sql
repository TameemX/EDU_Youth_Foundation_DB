-- ________________________________________________________________________________________________________________________________________________

-- Table Creation:

CREATE TABLE Employee (
    employeeID INT PRIMARY KEY,
    firstName VARCHAR(20) NOT NULL,
    lastName VARCHAR(20) NOT NULL,
    position VARCHAR(20) NOT NULL,
    yearExp INT CHECK (yearExp >= 0),
    email VARCHAR(30) UNIQUE NOT NULL,
    password VARCHAR(20) NOT NULL,
    salary FLOAT CHECK (salary > 0)
);

CREATE TABLE Donor (
    donorID INT PRIMARY KEY,
    firstName VARCHAR(20) NOT NULL,
    lastName VARCHAR(20) NOT NULL,
    type CHAR(3) CHECK (type IN ('mbr', 'vip')),
    email VARCHAR(30) UNIQUE NOT NULL,
    password VARCHAR(20) NOT NULL
);

CREATE TABLE Event (
    eventID INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    date DATE NOT NULL,
    country VARCHAR(20) NOT NULL,
    city VARCHAR(20) NOT NULL,
    eventInfo TEXT
);

CREATE TABLE Donation (
    donationID INT PRIMARY KEY,
    amount FLOAT CHECK (amount > 0),
    donorID INT,
    employeeID INT,
    eventID INT,
    FOREIGN KEY (donorID) REFERENCES Donor(donorID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (employeeID) REFERENCES Employee(employeeID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (eventID) REFERENCES Event(eventID) ON DELETE SET NULL ON UPDATE SET NULL
);

CREATE TABLE Communication (
    employeeID INT,
    donorID INT,
    msgContent TEXT NOT NULL,
    msgDate DATE NOT NULL,
    PRIMARY KEY (employeeID, donorID),
    FOREIGN KEY (employeeID) REFERENCES Employee(employeeID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (donorID) REFERENCES Donor(donorID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Participation (
    donorID INT,
    eventID INT,
    PRIMARY KEY (donorID, eventID),
    FOREIGN KEY (donorID) REFERENCES Donor(donorID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (eventID) REFERENCES Event(eventID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE DonorPhone (
    donorID INT,
    phone VARCHAR(15),
    PRIMARY KEY (donorID, phone),
    FOREIGN KEY (donorID) REFERENCES Donor(donorID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- ________________________________________________________________________________________________________________________________________________

-- Data Insertion:

-- Events Table:

INSERT INTO Event (eventID, name, date, country, city, eventInfo)
VALUES
(1, 'Charity Gala', '2025-01-20', 'Jordan', 'Amman', 'A formal event to support education.'),
(2, 'Health Campaign', '2025-02-10', 'Jordan', 'Irbid', 'Promoting health awareness.'),
(3, 'Cultural Night', '2025-03-05', 'Jordan', 'Zarqa', 'A night celebrating Jordanian culture.'),
(4, 'Environmental Meetup', '2025-04-15', 'Jordan', 'Aqaba', 'Discussions on environmental challenges.'),
(5, 'Tech for Good', '2025-05-10', 'Jordan', 'Salt', 'Showcasing innovative tech for charity.');

-- Additional Events Batch 

INSERT INTO Event (eventID, name, date, country, city, eventInfo)
VALUES
(6, 'Startup Expo', '2025-06-15', 'Jordan', 'Amman', 'A showcase of innovative startups and projects.'),
(7, 'Medical Awareness Drive', '2025-07-10', 'Jordan', 'Irbid', 'An initiative to spread medical awareness and provide free check-ups.'),
(8, 'Art and Culture Fair', '2025-08-20', 'Jordan', 'Madaba', 'A celebration of art, music, and cultural performances.'),
(9, 'Clean Energy Forum', '2025-09-25', 'Jordan', 'Ma’an', 'Discussing advancements and challenges in clean energy solutions.'),
(10, 'Coding for Charity', '2025-10-05', 'Jordan', 'Zarqa', 'A hackathon to create software solutions for non-profit organizations.');

-- ________________________________________________________________________________________________________________________________________________

-- Communication Table

INSERT INTO Communication (employeeID, donorID, msgContent, msgDate)
VALUES
(2, 1, 'Thank you for your generous donation!', '2025-01-15'),
(8, 6, 'Your support helps us achieve our goals.', '2025-01-16'),
(4, 5, 'Looking forward to seeing you at the event.', '2025-01-17'),
(7, 3, 'Your contribution makes a difference.', '2025-01-18'),
(3, 4, 'Thank you for helping us grow.', '2025-01-19'),
(9, 8, 'Your donation inspires others to contribute.', '2025-01-20'),
(10, 10, 'We are grateful for your continued support!', '2025-01-21'),
(5, 2, 'Your contribution has been greatly appreciated.', '2025-01-22'),
(6, 9, 'Thank you for attending and donating!', '2025-01-23'),
(1, 7, 'Your generosity inspires us to do more.', '2025-01-24');

-- Additional Batch

INSERT INTO Communication (employeeID, donorID, msgContent, msgDate)
VALUES
(4, 2, 'We are thrilled to have your support. Thank you!', '2025-01-25'),
(3, 1, 'Your donation has made a huge difference!', '2025-01-26'),
(7, 4, 'We appreciate your continuous generosity!', '2025-01-27'),
(2, 6, 'Your contribution is invaluable to our mission.', '2025-01-28'),
(8, 5, 'Thank you for being part of this cause!', '2025-01-29'),
(9, 3, 'Your kindness and generosity mean the world to us.', '2025-01-30'),
(10, 7, 'We are grateful for your support and belief in our mission.', '2025-01-31'),
(5, 9, 'Thank you for attending and making a difference!', '2025-02-01'),
(1, 10, 'Your involvement has been incredibly impactful. Thank you!', '2025-02-02'),
(6, 8, 'We couldn’t have done it without you. Thank you for your support!', '2025-02-03');

-- ________________________________________________________________________________________________________________________________________________

-- Employee Table

INSERT INTO Employee (employeeID, firstName, lastName, position, yearExp, email, password, salary)
VALUES
(1, 'Ahmad', 'Al-Zoubi', 'Manager', 10, 'ahmad.zoubi@org.com', 'pass123', 1500.0),
(2, 'Rana', 'Abu Hassan', 'Coordinator', 5, 'rana.hassan@org.com', 'rana456', 1200.0),
(3, 'Tareq', 'Al-Haj', 'Event Planner', 7, 'tareq.haj@org.com', 'tareq789', 1300.0),
(4, 'Aseel', 'Al-Tamimi', 'Fundraiser', 4, 'aseel.tamimi@org.com', 'aseel111', 1100.0),
(5, 'Hani', 'Al-Najjar', 'Accountant', 8, 'hani.najjar@org.com', 'hani333', 1450.0),
(6, 'Yasmeen', 'Al-Rawabdeh', 'PR Specialist', 5, 'yasmeen.rawabdeh@org.com', 'yasmeen1', 1250.0),
(7, 'Layla', 'Al-Abadi', 'Event Manager', 6, 'layla.abadi@org.com', 'layla222', 1350.0),
(8, 'Khalid', 'Al-Qudah', 'IT Specialist', 3, 'khalid.qudah@org.com', 'khalid456', 1200.0),
(9, 'Samer', 'Al-Faraj', 'Marketing Lead', 9, 'samer.faraj@org.com', 'samer789', 1400.0),
(10, 'Mohammed', 'Al-Salem', 'Assistant', 2, 'mohammed.salem@org.com', 'mohammed1', 1000.0);

-- ________________________________________________________________________________________________________________________________________________

-- Donor Table

INSERT INTO Donor (donorID, firstName, lastName, type, email, password)
VALUES
(1, 'Omar', 'Al-Dabbas', 'mbr', 'omar.dabbas@donor.com', 'donor123'),
(2, 'Yasmeen', 'Al-Ajlouni', 'vip', 'yasmeen.ajlouni@donor.com', 'yas123'),
(3, 'Mahmoud', 'Al-Hussein', 'mbr', 'mahmoud.hussein@donor.com', 'mah123'),
(4, 'Suha', 'Al-Naser', 'vip', 'suha.naser@donor.com', 'suha123'),
(5, 'Nizar', 'Al-Kilani', 'mbr', 'nizar.kilani@donor.com', 'nizar456'),
(6, 'Adel', 'Al-Basha', 'vip', 'adel.basha@donor.com', 'adel456'),
(7, 'Hadeel', 'Al-Ramahi', 'mbr', 'hadeel.ramahi@donor.com', 'hadeel789'),
(8, 'Rana', 'Al-Qawasmi', 'vip', 'rana.qawasmi@donor.com', 'rana456'),
(9, 'Zaina', 'Al-Taher', 'vip', 'zaina.taher@donor.com', 'zaina789'),
(10, 'Ayman', 'Al-Jarrah', 'mbr', 'ayman.jarrah@donor.com', 'ayman789');

-- ________________________________________________________________________________________________________________________________________________

-- Donation Table

INSERT INTO Donation (donationID, amount, donorID, employeeID, eventID)
VALUES
(1, 500.0, 1, 2, 1),
(2, 1000.0, 6, 8, 2),
(3, 750.0, 5, 4, 3),
(4, 200.0, 2, 1, 4),
(5, 600.0, 9, 3, 5),
(6, 400.0, 8, 7, 1),
(7, 1100.0, 10, 6, 2),
(8, 450.0, 4, 10, 3),
(9, 300.0, 3, 9, 4),
(10, 700.0, 1, 5, 5);

-- ________________________________________________________________________________________________________________________________________________

-- Participation Table

INSERT INTO Participation (donorID, eventID)
VALUES
(1, 3),
(2, 5),
(3, 1),
(4, 4),
(5, 2),
(6, 3),
(7, 5),
(8, 2),
(9, 1),
(10, 4);

-- ________________________________________________________________________________________________________________________________________________

-- Donor Phone Table

INSERT INTO DonorPhone (donorID, phone)
VALUES
(1, '0791234567'),
(1, '0789991111'),
(2, '0776543210'),
(3, '0791122334'),
(4, '0784433221'),
(5, '0795544332'),
(6, '0783322114'),
(7, '0779988776'),
(8, '0798877665'),
(9, '0785544332'),
(10, '0796677889');
-- ________________________________________________________________________________________________________________________________________________

-- View Creation

CREATE VIEW ViewDonorList AS
SELECT 
    d.donorID,
    d.firstName,
    d.lastName,
    d.type,
    d.email,
    SUM(dn.amount) AS totalDonations
FROM Donor d
INNER JOIN Donation dn ON d.donorID = dn.donorID
GROUP BY d.donorID, d.firstName, d.lastName, d.type, d.email;

CREATE VIEW TotalDonations AS
SELECT 
    SUM(amount) AS totalDonations
FROM Donation;

CREATE VIEW EmployeeInfo AS
SELECT 
    e.employeeID,
    e.firstName,
    e.lastName,
    e.position,
    e.email,
    COUNT(dn.donationID) AS numberOfDonationsManaged
FROM Employee e
LEFT JOIN Donation dn ON e.employeeID = dn.employeeID
GROUP BY e.employeeID, e.firstName, e.lastName, e.position, e.email;

CREATE VIEW EventParticipants AS
SELECT 
    e.eventID,
    e.name AS eventName,
    e.date AS eventDate,
    COUNT(p.donorID) AS totalParticipants
FROM Event e
LEFT JOIN Participation p ON e.eventID = p.eventID
GROUP BY e.eventID, e.name, e.date;


-- ________________________________________________________________________________________________________________________________________________


-- Procedure Creation 

CREATE PROCEDURE TopDonorList(IN topCount INT)
BEGIN
    SELECT 
        d.donorID,
        d.firstName,
        d.lastName,
        SUM(dn.amount) AS totalDonations
    FROM Donor d
    INNER JOIN Donation dn ON d.donorID = dn.donorID
    GROUP BY d.donorID, d.firstName, d.lastName
    ORDER BY totalDonations DESC
    LIMIT topCount;
END;

CREATE PROCEDURE CreateEvent(
    IN eventName VARCHAR(50),
    IN eventDate DATE,
    IN eventCountry VARCHAR(50),
    IN eventCity VARCHAR(50),
    IN eventInfo TEXT
)
BEGIN
    INSERT INTO Event (name, date, country, city, eventInfo)
    VALUES (eventName, eventDate, eventCountry, eventCity, eventInfo);
END;

CREATE PROCEDURE DonorContact(
    IN employeeID INT,
    IN donorID INT,
    IN msgContent TEXT,
    IN msgDate DATE
)
BEGIN
    INSERT INTO Communication (employeeID, donorID, msgContent, msgDate)
    VALUES (employeeID, donorID, msgContent, msgDate);
END;

CREATE PROCEDURE Donate(
    IN donationAmount FLOAT,
    IN donorID INT,
    IN employeeID INT,
    IN eventID INT
)
BEGIN
    INSERT INTO Donation (amount, donorID, employeeID, eventID)
    VALUES (donationAmount, donorID, employeeID, eventID);
END;

CREATE PROCEDURE UpdateMessage(
    IN employeeID INT,
    IN donorID INT,
    IN newMsgContent TEXT,
    IN newMsgDate DATE
)
BEGIN
    UPDATE Communication
    SET msgContent = newMsgContent,
        msgDate = newMsgDate
    WHERE employeeID = employeeID AND donorID = donorID;
END;

CREATE PROCEDURE DeleteDonation(
    IN donationID INT
)
BEGIN
    DELETE FROM Donation
    WHERE donationID = donationID;
END;

-- ________________________________________________________________________________________________________________________________________________

-- User Creation

-- Create Admin User

CREATE USER 'admin_tameem' IDENTIFIED BY 'admin_password';

-- Assign Privileges

GRANT ALL PRIVILEGES ON *.* TO 'admin_tameem' WITH GRANT OPTION;

-- ________________________________________________________________________________________________________________________________________________

-- Create Employee User

CREATE USER 'employee_zaid' IDENTIFIED BY 'employee_password';

-- Assign Privileges for Event and Donation Management
GRANT SELECT, INSERT, UPDATE ON Donation TO 'employee_zaid';
GRANT SELECT, INSERT, UPDATE ON Communication TO 'employee_zaid';
GRANT SELECT ON Donor TO 'employee_zaid';

-- Restrict Deletion Rights

REVOKE DELETE ON Donation FROM 'employee_zaid'@'localhost';

REVOKE ALTER, DROP, CREATE ON *.* FROM 'employee_zaid';
REVOKE ALTER, DROP, CREATE ON *.* FROM 'donor_ahmad';


-- ________________________________________________________________________________________________________________________________________________

-- Create Donor User

CREATE USER 'donor_ahmad' IDENTIFIED BY 'donor_password';

-- Assign Privileges

GRANT SELECT ON Donor TO 'donor_ahmad'@'localhost';
GRANT SELECT ON Donation TO 'donor_ahmad'@'localhost';
GRANT INSERT ON Donation TO 'donor_ahmad'@'localhost';

REVOKE INSERT, UPDATE, DELETE ON Donor FROM 'donor_ahmad';
REVOKE INSERT, UPDATE, DELETE ON Employee FROM 'donor_ahmad';
REVOKE INSERT, UPDATE, DELETE ON Event FROM 'donor_ahmad';

GRANT EXECUTE ON PROCEDURE DeleteDonation TO 'admin_tameem';
REVOKE EXECUTE ON PROCEDURE DeleteDonation FROM 'employee_zaid';
REVOKE EXECUTE ON PROCEDURE DeleteDonation FROM 'donor_ahmad';


-- ________________________________________________________________________________________________________________________________________________

-- SQL commands and codes used for testing

INSERT INTO donorPhone (donorID, phone) 
VALUES 
(44, 0799945459);

UPDATE donor SET donorID = 100 WHERE donorID = 1;
SELECT * FROM donorPhone;

DELETE from donor WHERE donorID = 100;
SELECT * FROM donorPhone;

SELECT * FROM Event;
DELETE from event WHERE eventID = 1;
SELECT * FROM Participation;

UPDATE employee SET salary = -100 WHERE employeeID = 2;
SELECT * from employee;

SELECT * FROM employee;

INSERT INTO employee (employeeID, firstName, lastName, position, yearExp, email, password, salary)
VALUE 
(11, 'Ahmad', 'Hosam', 'Auditor', '0', 'ahmad1980@org.com', 'password12345', 1000);

SELECT * FROM employee WHERE salary > 1200;

INSERT INTO employee (employeeID, firstName, lastName, position, yearExp, email, password, salary)
VALUE 
(11, 'Alaa', 'Abbadi', 'Software Engineer', '10', 'a.abbadi.15@gmail.com', 'password12345', 2000);

SELECT * FROM donor;
UPDATE donor SET firstName = 'Yassmeena' WHERE DonorID = 2;

DELETE FROM donor WHERE donorID = 9;

DELIMITER $$

CREATE PROCEDURE TopDonorList(IN topCount INT)
BEGIN
    SELECT 
        d.donorID,
        d.firstName,
        d.lastName,
        SUM(dn.amount) AS totalDonations
    FROM Donor d
    INNER JOIN Donation dn ON d.donorID = dn.donorID
    GROUP BY d.donorID, d.firstName, d.lastName
    ORDER BY totalDonations DESC
    LIMIT topCount;
END $$

DELIMITER ;

CALL TopDonorList(5);

DELIMITER $$
CREATE PROCEDURE DeleteDonation(
    IN donationID INT
)
BEGIN
    DELETE FROM Donation
    WHERE donationID = donationID;
END $$
DELIMITER ;

SELECT * FROM donor;

INSERT INTO participation (donorID, eventID) VALUE (1, 1);

SELECT * FROM event;
SELECT * from donation;
SELECT * from employee;

REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'employee_zaid';

SHOW GRANTS for 'employee_zaid';

SELECT * FROM employee;

GRANT SELECT, INSERT, UPDATE, ALTER, DELETE, DROP ON event TO 'employee_zaid';
GRANT SELECT, INSERT, UPDATE, ALTER, DELETE, DROP ON participation TO 'employee_zaid';
GRANT SELECT, INSERT, UPDATE, ALTER, DELETE, DROP ON communication TO 'employee_zaid';
GRANT SELECT, INSERT ON donor TO 'employee_zaid';
GRANT SELECT ON donation TO 'employee_zaid';


REVOKE SELECT, INSERT, UPDATE, ALTER, DELETE, DROP ON employee FROM 'employee_zaid';

REVOKE SELECT ON employee FROM 'employee_zaid';

INSERT INTO donorPhone (donorID, phone) 
VALUES 
(44, 0799945459);

UPDATE donor SET donorID = 100 WHERE donorID = 1;
SELECT * FROM donorPhone;

DELETE from donor WHERE donorID = 100;
SELECT * FROM donorPhone;

SELECT * FROM Event;
DELETE from event WHERE eventID = 1;
SELECT * FROM Participation;

UPDATE employee SET salary = -100 WHERE employeeID = 2;
SELECT * from employee;

SELECT * FROM employee;

INSERT INTO employee (employeeID, firstName, lastName, position, yearExp, email, password, salary)
VALUE 
(11, 'Ahmad', 'Hosam', 'Auditor', '0', 'ahmad1980@org.com', 'password12345', 1000);

SELECT * FROM employee WHERE salary > 1200;

INSERT INTO employee (employeeID, firstName, lastName, position, yearExp, email, password, salary)
VALUE 
(11, 'Alaa', 'Abbadi', 'Software Engineer', '10', 'a.abbadi.15@gmail.com', 'password12345', 2000);

SELECT * FROM donor;
UPDATE donor SET firstName = 'Yassmeena' WHERE DonorID = 2;

DELETE FROM donor WHERE donorID = 9;

DELIMITER $$

CREATE PROCEDURE TopDonorList(IN topCount INT)
BEGIN
    SELECT 
        d.donorID,
        d.firstName,
        d.lastName,
        SUM(dn.amount) AS totalDonations
    FROM Donor d
    INNER JOIN Donation dn ON d.donorID = dn.donorID
    GROUP BY d.donorID, d.firstName, d.lastName
    ORDER BY totalDonations DESC
    LIMIT topCount;
END $$

DELIMITER ;

CALL TopDonorList(5);

DELIMITER $$
CREATE PROCEDURE DeleteDonation(
    IN donationID INT
)
BEGIN
    DELETE FROM Donation
    WHERE donationID = donationID;
END $$
DELIMITER ;

SELECT * FROM donor;

INSERT INTO participation (donorID, eventID) VALUE (1, 1);

SELECT * FROM event;
SELECT * from donation;
SELECT * from employee;

REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'employee_zaid';

SHOW GRANTS for 'employee_zaid';

SELECT * FROM employee;

GRANT SELECT, INSERT, UPDATE, ALTER, DELETE, DROP ON event TO 'employee_zaid';
GRANT SELECT, INSERT, UPDATE, ALTER, DELETE, DROP ON participation TO 'employee_zaid';
GRANT SELECT, INSERT, UPDATE, ALTER, DELETE, DROP ON communication TO 'employee_zaid';
GRANT SELECT, INSERT ON donor TO 'employee_zaid';
GRANT SELECT ON donation TO 'employee_zaid';

REVOKE SELECT ON employee FROM 'employee_zaid';


DELETE from event WHERE eventID = 1;
SELECT * FROM participation;
SELECT * FROM donation;

DELETE from event WHERE donationID = 1

REVOKE SELECT, INSERT, UPDATE, ALTER, DELETE, DROP ON employee FROM 'employee_zaid';

REVOKE SELECT ON employee FROM 'employee_zaid';
