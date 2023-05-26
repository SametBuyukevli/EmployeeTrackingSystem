--Checking the number of empty seats in the service
CREATE TRIGGER tg_CheckSeats
ON Employee
AFTER INSERT
AS
BEGIN
    DECLARE @insertedRouteID INT
    SELECT @insertedRouteID = i.RouteID
    FROM inserted AS i
    --Finding the number of seats in the service
    DECLARE @Seats INT
    SELECT @Seats =s.NumberOfSeats
    FROM Service AS s
    WHERE s.RouteID = @insertedRouteID
    --We looked at how many people with the same route id in the employee table
    DECLARE @NumberofEmp INT
    SELECT @NumberofEmp = COUNT(*)
    FROM Employee AS e
    WHERE e.RouteID = @insertedRouteID

    IF @NumberofEmp > @Seats
    BEGIN
        RAISERROR ('There are no empty seats in the service you want to add.',16,1)
        ROLLBACK TRANSACTION
        RETURN
    END
END;


CREATE TRIGGER tg_PermissionInsert ON Permission
AFTER INSERT
AS
BEGIN
    DECLARE @EmployeeTCKN CHAR(11),@Permits INT,@CurrentPermits INT,@StartDate DATE ,@EndDate DATE

    SELECT @EmployeeTCKN = TCKN , @Permits = DATEDIFF(DAY,PermStartDate,PermEndDate) + 1
    FROM inserted

    SELECT @CurrentPermits = NumberOfPermits
    FROM Employee
    WHERE TCKN = @EmployeeTCKN

    IF (@Permits <= @CurrentPermits)
    BEGIN
        UPDATE Employee
    SET NumberOfPermits = @CurrentPermits - @Permits
    WHERE TCKN = @EmployeeTCKN
    END
    ELSE
    BEGIN
        RAISERROR('you do not have permission',16,1)
        ROLLBACK TRANSACTION
        RETURN
    END
END;