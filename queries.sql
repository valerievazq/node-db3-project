-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT
    P.ProductName,
    C.CategoryName
FROM
    Product AS P
    JOIN Category AS C ON P.CategoryId = C.Id
-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT
    O.Id,
    S.CompanyName
FROM
    [Order] AS O
    JOIN Shipper AS S ON O.ShipVia = S.Id
WHERE
    O.OrderDate < '2012-08-09';
-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT
    Product.ProductName,
    OrderDetail.Quantity
FROM
    OrderDetail
    JOIN Product ON Product.Id = OrderDetail.ProductId
WHERE
    OrderDetail.OrderId = 10251;
-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT
    [Order].Id,
    Customer.CompanyName,
    Employee.LastName
FROM
    [Order]
    JOIN Customer ON [Order].CustomerId = Customer.Id
    JOIN Employee ON [Order].EmployeeId = Employee.Id
