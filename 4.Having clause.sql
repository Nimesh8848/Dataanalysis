SELECT occupation,AVG(salary) FROM 
employee_salary
where occupation Like '%Manager%'
group by occupation
Having avg(salary)>60000;