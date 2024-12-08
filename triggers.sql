#triggers
Delimiter $$
create trigger employee_insert
	After insert on employee_salary
    for each row
		begin
         insert into employee_demographics(employee_id,first_name,last_name)
         values(new.employee_id,new.first_name,new.last_name);
		end $$
Delimiter ;
Drop trigger employee_insert;
Delimiter $$
create trigger employee_insert
	After insert on employee_salary
    for each row
		begin
         insert into employee_demographics(employee_id,first_name,last_name)
         values(new.employee_id,new.first_name,new.last_name);
		end $$
Delimiter ;


insert into employee_salary(employee_id,first_name,last_name,occupation,salary,dept_id)
values(13,'Nimesh','Mathema','Data Analyst',50000,Null);