# Employee Tracking System


![Kavramsal Tasarım]([http://url/to/img.png](https://url/to/img.png](https://user-images.githubusercontent.com/80046570/258198678-c01d95c3-5255-49e7-a39d-14404372f89e.png))

<img src="[https://url/to/img.png](https://user-images.githubusercontent.com/80046570/258198667-9867bcff-3f9a-4c73-b1db-c23a5db01ead.jpg)" alt="Mantıksal Tasarım" width="320" height="180">

Employee Tracking System is a database project used to track employees, departments, services, and permissions within a company.

## Installation

1. Download or clone the entire project to your computer.
2. Run the `Employee_Tracking_System.sql` file in your MSSQL database management tool to create the database.
3. In the project folder, you can find the necessary SQL codes in the `Trigger.sql` and `View.sql` files. Use these codes to add triggers and views.

## Usage

The project provides a database for tracking employees, departments, services, permissions, and other related data. Here are some basic usage examples:

- The `EmpInfo` view lists information about employees such as their names, phone numbers, email addresses, departments, roles, and salaries.
- The `EmpTimeLog` view shows the entry and exit times of employees.
- The `EmpService` view displays information about services, including the plate numbers and driver names associated with employees.
- The `LeaveDaysEmployee` view presents the number of leave days taken by employees each month.

## Triggers

The project includes the following triggers:

- `tg_CheckSeats`: Checks the number of empty seats in the service when a new employee is added. If there are no empty seats, it raises an error message.
- `tg_PermissionInsert`: Checks the current permission count of an employee when a new permission is added. If the permission count is not appropriate, it raises an error message.

For detailed usage instructions, refer to the other code files and documentation within the project.



## Contact

For any questions or feedback related to the project, please email [sametertugrulbuyukevli@gmail.com]

This README file provides basic information on the usage and contribution process of the Employee Tracking System project. For detailed information, refer to the relevant code files and documentation. If you have any questions or need support regarding the project, feel free to contact us using the provided contact information.
