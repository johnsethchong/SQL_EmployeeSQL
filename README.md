# SQL Homework - Employee Database: A Mystery in Two Parts

## Background

It is a beautiful spring day, and it is two weeks since you have been hired as a new data engineer at Pewlett Hackard. Your first major task is a research project on employees of the corporation from the 1980s and 1990s. All that remain of the database of employees from that period are six CSV files.

You will perform:

1. Data Modeling

2. Data Engineering

3. Data Analysis

#### Data Modeling

Inspect the CSVs and sketch out an ERD of the tables at [http://www.quickdatabasediagrams.com](http://www.quickdatabasediagrams.com).

![ERD](D:\Files\Coding\SQL_EmployeeSQL\ERD.png)

#### Data Engineering

* Use the information you have to create a table schema for each of the six CSV files. Remember to specify data types, primary keys, foreign keys, and other constraints.

* Import each CSV file into the corresponding SQL table.


![Table Schema Code](D:\Files\Coding\SQL_EmployeeSQL\Table Schema Code.png)

#### Data Analysis

Once you have a complete database, do the following:

1. List the following details of each employee: employee number, last name, first name, gender, and 
   ![1](D:\Files\Coding\SQL_EmployeeSQL\Snippets\1.png)
   
2. List employees who were hired in 1986.
   
   ![2](D:\Files\Coding\SQL_EmployeeSQL\Snippets\2.png)
   
   
3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
   ![3](D:\Files\Coding\SQL_EmployeeSQL\Snippets\3.png)

4. List the department of each employee with the following information: employee number, last name, first name, and department name.
   ![4](D:\Files\Coding\SQL_EmployeeSQL\Snippets\4.png)

5. List all employees whose first name is "Hercules" and last names begin with "B."

   ![5](D:\Files\Coding\SQL_EmployeeSQL\Snippets\5.png)
   

6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
   ![6](D:\Files\Coding\SQL_EmployeeSQL\Snippets\6.png)

7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
   ![7](D:\Files\Coding\SQL_EmployeeSQL\Snippets\7.png)

8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
   ![8](D:\Files\Coding\SQL_EmployeeSQL\Snippets\8.png)

9. List all employees who were hired since 1990 and their departments
   ![9](D:\Files\Coding\SQL_EmployeeSQL\Snippets\9.png)

10. List the following details of each employee: employee number, last name, first name, gender, and salary. Order by highest salary to lowest.
    ![10](D:\Files\Coding\SQL_EmployeeSQL\Snippets\10.png)

11. List all employees that have "Engineer" in their title along with their: department name, full name, and salary. Order the list by highest salary to lowest.
    ![11](D:\Files\Coding\SQL_EmployeeSQL\Snippets\11.png)
    

12. List all employees who have an annual salary higher than $65,000 and their titles, employee numbers, full names, gender, and hire date.

![12](D:\Files\Coding\SQL_EmployeeSQL\Snippets\12.png)
