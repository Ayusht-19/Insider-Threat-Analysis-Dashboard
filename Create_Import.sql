Create Table Departments(
DepartmentID Int,
DepartmentName varchar
)

Copy Departments from 'D:\Data Analytics\Power BI\PROJECT\Departments.csv' DELIMITER ',' csv header
select * from departments

Create Table Employees(
EmployeeID int,
DepartmentID int,
JobTitle varchar,
HireDate Date,
Security_Clearance int,
Location varchar
)
Copy Employees from 'D:\Data Analytics\Power BI\PROJECT\Employees.csv' DELIMITER ',' csv HEADER
select * from employees

Create Table Network(
NetworkID int,
EmployeeID int,
Timestamp TIMESTAMP,
SourceIP varchar,
DestinationIP varchar,
BytesSent int,
BytesReceived int,
WebsiteCategory varchar
)

copy Network from 'D:\Data Analytics\Power BI\PROJECT\NetworkActivity.csv' DELIMITER ',' csv HEADER
select * from network

Create Table Physical_Access(
AccessID int,
EmployeeID int,
Timestamp TIMESTAMP,
Location varchar
) 

copy physical_access from 'D:\Data Analytics\Power BI\PROJECT\PhysicalAccess.csv' DELIMITER ',' csv header
select * from physical_access

Create Table System(
ActivityID int,
EmployeeID int,
Timestamp TIMESTAMP,
FileType varchar,
FileName varchar,
AccessLevel varchar,
DataTransferred int,
AnomalyScore int
)

copy System from 'D:\Data Analytics\Power BI\PROJECT\SystemActivity.csv' DELIMITER ',' csv header
select * from system