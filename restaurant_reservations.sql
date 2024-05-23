CREATE DATABASE restaurant_reservations;
USE restaurant_reservations;
CREATE TABLE Customers (
    customerId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    customerName VARCHAR(45) NOT NULL,
    contactInfo VARCHAR(200)
);
SELECT * FROM Customers;

INSERT INTO Customers (customerName, contactInfo)
VALUES 
    ("Manuel Perez", "martinez2004@gmail.com, 718-333-2121, 4122 2434 Tremont Ave, Bronx, NY"), 
    ("Carlos Martinez", "Carlos345@gmail.com, 212-657-4355, 2454 Perry Street, Milford, GA"), 
    ("Genesis Santos", "gen88@gmail.com, 316-324-7899, 3309 Mesa Drive, Morris, NV"), 
    ("Marcos Baez", "MFG2020@gmail.com, 404-8954-9999, 478 Norcross, Irvine, CA");
    SELECT * FROM Customers;
    
    CREATE TABLE Reservations (
    reservationId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    customerId INT NOT NULL,
    reservationTime DATETIME NOT NULL,
    numberOfGuests INT NOT NULL,
    specialRequests VARCHAR(200),
    FOREIGN KEY (customerId) REFERENCES Customers(customerId)
);

INSERT INTO Reservations (customerId, reservationTime, numberOfGuests, specialRequests)
VALUES
    (1, "2024-03-22", 6, "please bring the cake at 8pm"),
    (2, "2023-07-15", 5, "need a highchair"),
    (3, "2024-02-20", 1, "separate checks"),
    (4, "2024-05-01", 8, "make sure to sing happy Birthday at 12am");
    SELECT * FROM Reservations;
    
   CREATE TABLE DiningPreferences (
    preferenceId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    customerId INT NOT NULL,
    favoriteTable VARCHAR(45),
    dietaryRestrictions VARCHAR(200),
    FOREIGN KEY (customerId) REFERENCES Customers(customerId)
);

INSERT INTO DiningPreferences (customerId, favoriteTable, dietaryRestrictions)
VALUES
    (1, "Round table facing each other", "None"),
    (2, "Close to the bar", "Vegan"),
    (3, "Inside only", "Gluten-free"),
    (4, "Booth Table", "None");
    
    DELIMITER //

CREATE PROCEDURE findReservations (IN Id INT)
BEGIN
    SELECT * FROM Reservations WHERE customerId = Id;
END //

DELIMITER ;

CALL findReservations(2);

DELIMITER //

CREATE PROCEDURE addSpecialRequest (IN res_Id INT, IN new_req VARCHAR(200))
BEGIN
    UPDATE Reservations SET specialRequests = new_req WHERE reservationId = res_Id;
END //

DELIMITER ;

CALL addSpecialRequest(1, "please bring the cake at 8pm");

DELIMITER //

CREATE PROCEDURE addReservation (IN in_customer_name VARCHAR(45), IN customer_email VARCHAR(200), IN customer_phone VARCHAR(20), IN reservation_data VARCHAR(200))
BEGIN
    DECLARE customerId INT;
    SELECT customerId INTO customerId FROM Customers WHERE contactInfo = customer_email;

    IF customerId IS NULL THEN
        INSERT INTO Customers (customerName, contactInfo) VALUES (in_customer_name, customer_email, customer_phone);
        SET customerId = LAST_INSERT_ID();
    END IF;

    
    INSERT INTO Reservations (customerId, reservationTime, numberOfGuests, specialRequests) VALUES (customerId, NOW(), 1, reservation_data);
END //

DELIMITER ;

CALL addReservation("John Doe", "johndoe@example.com", "1234567890", "Special request");



