% salesperson(SalesPerson_id, Name, Phone_No, Start_Year, Department, Salary).
salesperson(1, 'Amal Perera', '0712345678', 2020, 'Machinery', 150000).
salesperson(2, 'Nimal Fernando', '0723456789', 2021, 'Electronics', 140000).
salesperson(3, 'Kamal Silva', '0734567890', 2020, 'Machinery', 130000).
salesperson(4, 'Sunil Perera', '0745678901', 2019, 'Automobile', 120000).
salesperson(5, 'Ruwan Wijesinghe', '0756789012', 2021, 'Machinery', 135000).

% trip(SalesPerson_id, From_City, To_City, Departure_Date, Return_Date, Trip_id).
trip(1, 'Colombo', 'Jaffna', '2023-12-28', '2023-12-30', 1001).
trip(2, 'Colombo', 'Kandy', '2023-12-28', '2023-12-29', 1002).
trip(3, 'Colombo', 'Kataragama', '2023-11-25', '2023-11-27', 1003).
trip(5, 'Colombo', 'Kataragama', '2023-11-28', '2023-12-01', 1004).
trip(4, 'Colombo', 'Jaffna', '2023-12-25', '2023-12-27', 1005).
trip(3, 'Kandy', 'Colombo', '2023-12-27', '2023-12-28', 1006).

% expense(Trip_id, Account_No, Amount).
expense(1001, 'ACC001', 80000).   % Amal Perera's trip to Jaffna
expense(1002, 'ACC002', 30000).   % Nimal Fernando's trip to Kandy
expense(1003, 'ACC003', 90000).   % Kamal Silva's trip to Kataragama
expense(1004, 'ACC004', 95000).   % Ruwan Wijesinghe's trip to Kataragama
expense(1005, 'ACC005', 100000).  % Sunil Perera's trip to Jaffna
expense(1006, 'ACC006', 51000).   % Kamal Silva's return to Colombo


% Query
?- salesperson(SalesPerson_id1, 'Amal Perera', _, _, _, _), trip(SalesPerson_id1, 'Colombo', 'Jaffna', _, _, Trip_id1), expense(Trip_id1, _, Amount1),
   trip(SalesPerson_id2, 'Colombo', 'Jaffna', _, _, Trip_id2), expense(Trip_id2, _, Amount2), Amount2 > Amount1, salesperson(SalesPerson_id2, Name, _, _, _, _).

% Expected Result
% (Assuming no one spent more than Amal Perera in the provided data).
