#Stored procedures allow you to encapsulate complex operations, making them reusable, efficient, and easier to maintain
#The DELIMITER command in SQL is used to change the statement termination character in a session.

create procedure large_salaries()

select * from employee_salary
where salary>50000;
call large_salaries();

DELIMITER $$

CREATE PROCEDURE large_salaries2()
BEGIN
    SELECT first_name, last_name, occupation, salary
    FROM employee_salary
    WHERE salary >= 50000;

    SELECT first_name, last_name, occupation, salary
    FROM employee_salary
    WHERE salary >= 10000;
END $$

DELIMITER ;

call large_salaries2();
