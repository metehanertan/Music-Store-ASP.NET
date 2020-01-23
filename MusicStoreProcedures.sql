CREATE PROCEDURE UpdateOrderIDOfItem (@OrderID int,@ItemID int)
AS
BEGIN
	UPDATE ITEM
	SET ITEM.OrderID = @OrderID
	WHERE ITEM.ID = @ItemID
END
GO

CREATE PROCEDURE moveEmployee (@EmployeeID int,@StoreID int)
AS
BEGIN
	UPDATE EMPLOYEE
	SET EMPLOYEE.StoreID = @StoreID
	WHERE EMPLOYEE.SSN = @EmployeeID
END
GO

CREATE PROCEDURE increaseSalary
AS
BEGIN
	UPDATE EMPLOYEE
	SET EMPLOYEE.Salary = EMPLOYEE.Salary*1.1 , EMPLOYEE.TotalItemsSold = 0
	WHERE EMPLOYEE.TotalItemsSold >= 50
END
