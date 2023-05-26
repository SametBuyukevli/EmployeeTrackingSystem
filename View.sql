--Employee Info
CREATE VIEW EmpInfo
AS
    SELECT e.TCKN, CONCAT(FirstName,' ',Minit,' ',LastName) AS Name, PhoneNumber, Email, DeptName, RoleName, Salary
    FROM Employee AS e
        JOIN Department AS d ON e.DeptID = d.DeptID
        JOIN Role AS r ON e.RoleID = r.RoleID
        JOIN EmpEmail AS ee ON e.TCKN = ee.TCKN;

--employees entry and exit information
CREATE VIEW EmpTimeLog
AS
    SELECT t.TCKN, CONCAT(FirstName,' ',Minit,' ',LastName) AS Name, LoginDateTime, OutDateTime
    FROM Employee AS e, TimeLog AS t
    WHERE e.TCKN = t.TCKN

--Employee Service
CREATE VIEW EmpService
AS
    SELECT e.TCKN, CONCAT(FirstName,' ',Minit,' ',LastName) AS Name, NumberPlate, DriverName
    FROM Employee AS e, Service AS s
    WHERE e.RouteID = s.RouteID

--It shows how many days off in which month the employees take
CREATE VIEW LeaveDaysEmpoyee
AS
    SELECT e.FirstName, e.LastName,
        SUM(DATEDIFF(day,p.PermStartDate,p.PermEndDate) + 1) AS NumLeaveDays,
        MONTH(p.PermStartDate) AS Month,
        YEAR(p.PermStartDate) AS Year
    FROM Employee e
        INNER JOIN Permission p ON e.TCKN = p.TCKN
    GROUP BY e.FirstName,e.LastName,MONTH(p.PermStartDate), YEAR(p.PermStartDate)