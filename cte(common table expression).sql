with cteexample as
(
select gender,avg(salary) avg_sal,max(salary)max_sal,min(salary)min_sal,count(salary)count_sal
from employee_demographics dem
join employee_salary sal
	on dem.employee_id=sal.employee_id
    group by gender
)
select max(max_sal)
from cteexample;


with cteexample as
(
select first_name,last_name ,gender, employee_id,birth_date
from employee_demographics 
where birth_date>'1985-01-01'
),
cteexample2 as
(
select employee_id,salary
from employee_salary
where salary>50000
)
select *
from cteexample
join cteexample2
	on cteexample.employee_id = cteexample2.employee_id;