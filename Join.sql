#joins
select* from employee_demographics;

select*from employee_salary;
#inner joins
select dem.employee_id,age,salary,occupation
from employee_demographics as dem
Inner Join employee_salary as sal
	on dem.employee_id= sal.employee_id;
#leftjoin
select *
from employee_demographics as dem
Left join employee_salary as sal
 on dem.employee_id =sal.employee_id;
 #right join
 select *
from employee_demographics as dem
Right join employee_salary as sal
 on dem.employee_id =sal.employee_id;
#self join
select emp1.employee_id as employee_santa,
emp1.first_name as first_name_santa,
emp1.last_name as last_name_santa,
emp2.first_name as santa_first_name_manager,
emp2.last_name as santa_last_name_manager
from
employee_salary  emp1
join employee_salary  emp2
	on emp1.employee_id+1 =emp2.employee_id