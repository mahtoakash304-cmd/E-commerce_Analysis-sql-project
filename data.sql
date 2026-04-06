INSERT INTO Customers VALUES
(1,'Akash','Delhi','2025-01-10'),
(2,'Rahul','Mumbai','2025-02-15'),
(3,'Neha','Delhi','2025-03-20'),
(4,'Aman','Kolkata','2025-04-05'),
(5,'Riya','Pune','2025-05-12'),
(6,'Sahil','Mumbai','2025-06-01');

INSERT INTO Products VALUES
(101,'iPhone 15','Electronics'),
(102,'Samsung TV','Electronics'),
(103,'Nike Shoes','Fashion'),
(104,'T-Shirt','Fashion'),
(105,'Laptop Dell','Electronics'),
(106,'Office Chair','Furniture'),
(107,'Table Lamp','Furniture');

INSERT INTO Orders VALUES
(1001,1,'2025-06-10',75000),
(1002,2,'2025-06-11',45000),
(1003,1,'2025-06-15',12000),
(1004,3,'2025-06-18',3000),
(1005,4,'2025-06-20',60000),
(1006,5,'2025-06-21',1500);

INSERT INTO Order_Items VALUES
(1,1001,101,1,75000),
(2,1002,105,1,45000),
(3,1003,103,2,6000),
(4,1004,104,3,1000),
(5,1005,102,1,60000),
(6,1006,107,1,1500);

INSERT INTO Payments VALUES
(501,1001,'2025-06-10','Paid'),
(502,1002,'2025-06-11','Paid'),
(503,1003,'2025-06-15','Failed'),
(504,1004,'2025-06-18','Paid'),
(505,1005,'2025-06-20','Pending'),
(506,1006,'2025-06-21','Paid');