1. 'Write a SELECT statement that lists the customers along with their ID numbers. Include the last
names, first names, and company names'

Select CustomerID, LastName, FirstName, Name
FROM Sales.Customer C
JOIN Person.Person P
ON C.PersonID = p.BusinessEntityID
Join Sales.Store S
ON C.StoreID = S.BusinessEntityID


2. 'Write a SELECT statement that lists the name, product number, and color of each product.'

SELECT Name, ProductNumber, Color
FROM Production.Product

3. 'Write a SELECT statement that lists the customer ID numbers and sales order ID numbers from
the SalesLT.SalesOrderHeader table'

SELECT  C.CustomerID, SalesOrderNumber
FROM Sales.SalesOrderHeader SOH
JOIN Sales.Customer C
ON SOH.CustomerID = C.CustomerID

4. 'Write a query using a WHERE clause that displays all the employees listed in the
HumanResources.Employee table who have the job title Research and Development Engineer.
Display the business entity ID number, the login ID, and the title for each one.'

SELECT BusinessEntityID, LoginID, JobTitle
FROM HumanResources.Employee
WHERE JobTitle LIKE 'Research and Development Engineer'

5. 'Write a query displaying all the columns of the Production.ProductCostHistory table from the
rows that were modified on June 17, 2003. Be sure to use one of the features in SQL Server
Management Studio to help you write this query'

SELECT *
FROM Production.ProductCostHistory
WHERE ModifiedDate =  '2003-6-17 00:00:00.000' #Dates start from 2012

6. 'Write a query that displays all the rows from the Person.Person table where the rows were
modified after December 29, 2000. Display the business entity ID number, the name columns,
and the modified date.'

SELECT BusinessEntityID, NameStyle,FirstName, MiddleName, LastName, ModifiedDate
FROM Person.Person
WHERE ModifiedDate > '2000-12-29 00:00:00.000'

7. 'Write a query like the one in question 1 that displays the products with helmet in the name.'

SELECT Name
FROM Production.Product
WHERE Name LIKE '%helmet%'

8. 'Write a query that displays the business entity ID number, first name, middle name, and last
name from the Person.Person table for only those rows that have E or B stored in the middle
name column.'

SELECT BusinessEntityID, FirstName, MiddleName, LastName
FROM Person.Person
WHERE MiddleName LIKE 'E' OR MiddleName LIKE 'B'

9. 'Explain the difference between the following two queries:
SELECT FirstName
FROM Person.Person
WHERE LastName LIKE "Ja%es"; Starts with Ja , finish with es and between contains one or more letters

SELECT FirstName

FROM Person.Person
WHERE LastName LIKE "Ja_es";  Starts with Ja , finish with es and between contains only one letter'


10. 'Write a query displaying the order ID, order date, and total due from the
Sales.SalesOrderHeader table. Retrieve only those rows where the order was placed during the
month of September 2001 and the total due exceeded $1,000.

during September 2013 and total due exceeded 10000$
'

SELECT SalesOrderID, OrderDate, TotalDue
FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '2013-09-01 00:00:00.000' AND '2013-09-30 00:00:00.000'
AND TotalDue > 10000

11. 'Change the query in question 1 so that only the dates September 1–3, 2001, are retrieved. See
whether you can figure out three different ways to write this query.'

SELECT SalesOrderID, OrderDate, TotalDue
FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '2013-09-01 00:00:00.000' AND '2013-09-3 00:00:00.000'

SELECT SalesOrderID, OrderDate, TotalDue
FROM Sales.SalesOrderHeader
WHERE OrderDate >= '2013-09-01 00:00:00.000' AND  OrderDate <='2013-09-03 00:00:00.000'

12. 'Write a query displaying the ProductID, Name, and Color columns from rows in the
Production.Product table. Display only those rows where no color has been assigned.'

SELECT ProductID, Name, Color
FROM Production.Product
WHERE Color IS NULL

13. 'Write a query displaying the ProductID, Name, and Color columns from rows in the
Production.Product table. Display only those rows in which the color is not blue.'

SELECT ProductID, Name, Color
FROM Production.Product
WHERE Color Not LIKE 'Blue'

14. 'Write a query using the Production.ProductReview table. Use CONTAINS to find all the rows that
have the word socks in the Comments column. Return the ProductID and Comments columns.'

SELECT ProductID, Comments
FROM Production.ProductReview
WHERE CONTAINS(Comments, 'socks')

SELECT ProductID, Comments
FROM Production.ProductReview
WHERE Comments LIKE '%socks%'

15. 'Write a query that returns the business entity ID and name columns from the Person.Person
table. Sort the results by LastName, FirstName, and MiddleName.'

SELECT BusinessEntityID, NameStyle, FirstName, MiddleName, LastName
FROM Person.Person
ORDER BY LastName, FirstName, MiddleName

16. 'Modify the query written in question 1 so that the data is returned in the opposite order.'

SELECT BusinessEntityID, NameStyle, FirstName, MiddleName, LastName
FROM Person.Person
ORDER BY LastName DESC, FirstName DESC, MiddleName DESC

17. 'Write a query that displays in the “AddressLine1 (City PostalCode)” format from the
Person.Address table.'

SELECT AddressLine1 + ' (' + City  + PostalCode +')'
FROM Person.Address

18. 'Write a query using the Production.Product table displaying the product ID, color, and name
columns. If the color column contains a NULL value, replace the color with No Color.'

SELECT ProductID, 
CASE 
	WHEN Color IS NULL THEN 'No Color'
	ELSE Color
END, Name
FROM Production.Product

19. 'Write a query using the Production.Product table displaying a description with the “ProductID:
Name” format. Hint: You will need to use a function to write this query.'

SELECT CONCAT(ProductID,':', Name) AS Description
FROM Production.Product

20. 'Write a query using the Sales.SpecialOffer table that multiplies the MaxQty column by the
DiscountPCT column. If the MaxQty value is null, replace it with the value 10. Include the
SpecialOfferID and Description columns in the results.'

SELECT MaxQty, DiscountPct, ISNULL(MaxQty,10)*DiscountPct , SpecialOfferID, Description

FROM Sales.SpecialOffer

21. 'Write a query that displays the first 10 characters of the AddressLine1 column in the
Person.Address table.'

SELECT SUBSTRING(AddressLine1, 1,11)
FROM Person.Address

22. 'The product number in the Production.Product contains a hyphen (-). Write a query that uses
the SUBSTRING function and the CHARINDEX function to display the characters in the product
number following the hyphen. Note: there is also a second hyphen in many of the rows; ignore
the second hyphen for this question. Hint: Try writing this statement in two steps, the first using
the CHARINDEX function and the second adding the SUBSTRING function.'

SELECT ProductNumber, CHARINDEX('-',ProductNumber) AS hyphen_position,
 SUBSTRING(ProductNumber, CHARINDEX('-',ProductNumber)+1,1)
FROM Production.Product


23. 'Write a query that calculates the number of days between the date an order was placed and the
date that it was shipped using the Sales.SalesOrderHeader table. Include the SalesOrderID,
OrderDate, and ShipDate columns.'

SELECT SalesOrderID, OrderDate, ShipDate,  DATEDIFF(day, OrderDate,ShipDate) AS DAYS_DIFF
FROM Sales.SalesOrderHeader

24. 'Write a query that adds six months to each order date in the Sales.SalesOrderHeader table.
Include the SalesOrderID and OrderDate columns.'

SELECT SalesOrderID, OrderDate, DATEADD(month, 6, OrderDate)
FROM Sales.SalesOrderHeader

25. 'Write a query using the HumanResources.Employee table to display the BusinessEntityID
column. Also include a CASE statement that displays “Even” when the BusinessEntityID value is
an even number or “Odd” when it is odd. Hint: Use the modulo operator.'

SELECT BusinessEntityID,
	CASE 
		WHEN BusinessEntityID%2=0 THEN 'Even'
		ELSE 'Odd'
	END AS EVEN_ODD
FROM HumanResources.Employee

26. 'Write a query using the Sales.SalesOrderDetail table to display a value (“Under 10” or “10–19”
or “20–29” or “30–39” or “40 and over”) based on the OrderQty value by using the CASE
function. Include the SalesOrderID and OrderQty columns in the results.'

SELECT SalesOrderID, OrderQty,
	CASE
		WHEN OrderQty< 10 Then 'Under 10'
		WHEN OrderQty >=10 and OrderQty<=19 THEN '10-19'
		WHEN OrderQty >19 and OrderQty<=29 THEN '20-29'
		WHEN OrderQty >29 and OrderQty<=39 THEN '30-39'
		ELSE '40 and over'
	END 

FROM Sales.SalesOrderDetail

27. 'Look up the SERVERPROPERTY function in Books Online. Write a statement that displays the
edition, instance name, and machine name using this function.'

SELECT  
  SERVERPROPERTY('MachineName') AS [Server Name],
  SERVERPROPERTY('InstanceName') AS [SQL Server Instance Name], 
  SERVERPROPERTY('Edition') AS [Edition];  
GO

28. 'Write a query using the Sales.SalesOrderHeader table listing the sales in order of the month the
order was placed and then the year the order was placed. Include the SalesOrderID and
OrderDate columns in the results.'

SELECT SalesOrderID, OrderDate, DATEPART(month, OrderDate)AS month , DATEPART(year, OrderDate) as year
FROM Sales.SalesOrderHeader


29. 'Write a query that displays the PersonType and the name columns from the Person.Person
table. Sort the results so that rows with a PersonType of IN, SP, or SC sort by LastName. The
other rows should sort by FirstName. Hint: Use the CASE function.'

SELECT PersonType, FirstName, LastName	
FROM Person.Person
ORDER BY CASE 
		WHEN PersonType IN ('IN', 'SP', 'SC') THEN  LastName
		ELSE FirstName
	END

30. 'The HumanResources.Employee table does not contain the employee names. Join that table to
the Person.Person table on the BusinessEntityID column. Display the job title, birth date, first
name, and last name.'

SELECT JobTitle, BirthDate, FirstName, LastName
FROM HumanResources.Employee E
join Person.Person P
ON E.BusinessEntityID = P.BusinessEntityID

31. 'The customer names also appear in the Person.Person table. Join the Sales.Customer table to
the Person.Person table. The BusinessEntityID column in the Person.Person table matches the
PersonID column in the Sales.Customer table. Display the CustomerID, StoreID, and TerritoryID
columns along with the name columns.'

SELECT CustomerID, StoreID,  TerritoryID
FROM Person.Person p
join Sales.Customer c
ON p.BusinessEntityID = c.PersonID

32. 'Write a query that displays the names of the customers along with the product names that they
have purchased. Hint: Five tables will be required to write this query!'
SELECT FirstName, LastName, pr.Name
FROM Person.Person p
join Sales.Customer c
on p.BusinessEntityID = c.CustomerID
join Sales.SalesOrderHeader soh
on c.CustomerID = soh.CustomerID
join Sales.SalesOrderDetail sod
on soh.SalesOrderID = sod.SalesOrderID
join Production.Product pr
on sod.ProductID = pr.ProductID

33. 'Write a query that displays all the products along with the SalesOrderID even if an order has
never been placed for that product. Join to the Sales.SalesOrderDetail table using the ProductID
column.'

SELECT p.ProductID, Name , SalesOrderID
FROM Production.Product p
LEFT JOIN Sales.SalesOrderDetail sod
on p.ProductID = sod.ProductID

34. 'Write a query that returns all the rows from the Sales.SalesPerson table joined to the
Sales.SalesOrderHeader table along with the SalesOrderID column even if no orders match.
Include the SalesPersonID and SalesYTD columns in the results.'

SELECT DISTINCT SalesPersonID,  SalesYTD
FROM Sales.SalesPerson sp
LEFT join Sales.SalesOrderHeader soh
on sp.BusinessEntityID = soh.SalesPersonID

35. 'Using a subquery, display the product names and product ID numbers from the
Production.Product table that have been ordered.'

SELECT Name, ProductID
FROM Production.Product
WHERE ProductID IN
( SELECT ProductID
FROM Sales.SalesOrderDetail)

36. 'Write a query to determine the number of customers in the Sales.Customer table.'

SELECT COUNT(*) AS Number_of_Customers
FROM Sales.Customer

37. 'Write a query that lists the total number of products ordered. Use the OrderQty column of the
Sales.SalesOrderDetail table and the SUM function.'

SELECT SUM(OrderQty) as Total_Qty
FROM Sales.SalesOrderDetail

38. 'Write a query to determine the price of the most expensive product ordered. Use the UnitPrice
column of the Sales.SalesOrderDetail table.'

SELECT MAX(UnitPrice) AS MAX_Price
FROM Sales.SalesOrderDetail

39. 'Write a query that shows the total number of items ordered for each product. Use the
Sales.SalesOrderDetail table to write the query.'

SELECT ProductID,  SUM(OrderQty) AS Total_Qty
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY Total_Qty DESC

40. 'Write a query using the Sales.SalesOrderDetail table that displays a count of the detail lines for
each SalesOrderID.'

SELECT SalesOrderID, COUNT(*) AS Count
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
ORDER BY Count DESC

41. 'Write a query that returns a count of detail lines in the Sales.SalesOrderDetail table by
SalesOrderID. Include only those sales that have more than three detail lines.'

SELECT SalesOrderID, COUNT(*) AS Count
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
HAVING COUNT(*) > 3
ORDER BY Count DESC 


42. 'Write a query that creates a sum of the LineTotal in the Sales.SalesOrderDetail table grouped by
the SalesOrderID. Include only those rows where the sum exceeds 1,000.'

SELECT SalesOrderID, SUM(LineTotal) AS LineTotal_summary
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
HAVING SUM(LineTotal) > 1000

43. 'Write a query using the Sales.SalesOrderDetail table to come up with a count of unique
ProductID values that have been ordered.'

SELECT COUNT (DISTINCT ProductID) AS Number_of_Unique_ProductID
FROM Sales.SalesOrderDetail

44. 'Write a query joining the Person.Person, Sales.Customer, and Sales.SalesOrderHeader tables to
return a list of the customer names along with a count of the orders placed.'

SELECT FirstName, LastName, COUNT(SalesOrderID) AS Number_of_orders
FROM Person.Person p
JOIN Sales.Customer c
ON p.BusinessEntityID = c.CustomerID
JOIN Sales.SalesOrderHeader soh
on c.CustomerID = soh.CustomerID
GROUP BY FirstName,LastName 
ORDER BY COUNT(SalesOrderID) DESC
