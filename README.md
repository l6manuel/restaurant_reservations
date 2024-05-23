Database Report: restaurant_reservations
1. Introduction:
     The restaurant_reservations database is designed to manage reservations for a restaurant. It aims to streamline the reservation process, facilitate communication between staff and customers, and efficiently organize reservation data.
MySQL QUERIES.
https://github.com/l6manuel/restaurant_reservations/blob/main/restaurant_reservations.sql 
2. Schema Overview:
   The database consists of several tables that capture different aspects of the reservation process. Here's an overview of the tables:
3. Tables:
   a. Customers:
-	Description: Stores information about customers who make reservations.
-	Fields: 
-	customer_id (Primary Key)
-	name
-	email
-	phone_number
   b. Reservations:
-	Description: Contains details of each reservation made by customers.
-	Fields:
-	reservation_id (Primary Key)
-	customer_id (Foreign Key referencing Customers)
-	date_time
-	party_size
-	special_requests
   c. Tables: 
-	Description: Tracks the status of tables in the restaurant.
-	Fields:
-	table_id (Primary Key)
-	capacity
-	status (e.g., occupied, available)
4. Relationships:
-	Customers and Reservations: One-to-Many relationship, as one customer can make multiple reservations.
-	Reservations and Tables: Many-to-One relationship, as multiple reservations can be made for a single table.
5. Sample Data:
 Here's an example of some sample data for each table:
    Customers:
customer_id	name	email	phone_number
1	John Smith	john@example.com	123-456-7890
2	Jane Doe	jane@example.com	987-654-3210
    Reservations:
reservation_id	customer_id	date_time	party_size	special_request
1	1	5/20/2024 18:00	4	Window seat
2	2	5/22/2024 18:00	2	Vegetarian menu
   Tables:
table_id	capacity	status
1	4	available
2	2	occupied
6. DELIMITER 
To create a procedure, we use this code to find a reservation that is already in file.
CREATE PROCEDURE findReservations (IN Id INT)
BEGIN
    SELECT * FROM Reservations WHERE customerId = Id;
END //
Also, in order to create a special request we use this procedure similar to find a reservation.
CREATE PROCEDURE addSpecialRequest (IN res_Id INT, IN new_req VARCHAR(200))
BEGin 
UPDATE Reservations SET specialRequests = new_req WHERE reservationId = res_Id;
END //

6. Conclusion:
 The restaurant_reservations database provides a structured framework for managing reservations efficiently. By organizing customer information, reservation details, and table statuses, it enables the restaurant staff to effectively coordinate and optimize the dining experience for customers.
This report gives a comprehensive overview of the database structure, including tables, relationships, and sample data with valuable insights into how the database operates.

