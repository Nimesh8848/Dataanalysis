#union
select first_name,last_name,'old man' as label
from employee_demographics
where age>40 and gender='Male'
UNION
SELECT first_name,last_name,'old women'as label
from employee_demographics
where age<30 and gender ='female'
Union
select first_name,last_name,'highly paid employee' as label
from employee_salary
where salary>60000
order by  first_name;