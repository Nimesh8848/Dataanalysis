select dem.employee_id,dem.first_name,dem.last_name,gender,salary,
 #row_number()over(partition by gender order by dem.employee_id) as number
 sum(salary) over(partition by gender order by  dem.employee_id) as partiton_salary
from employee_demographics dem
join employee_salary sal
	on dem.employee_id= sal.employee_id;