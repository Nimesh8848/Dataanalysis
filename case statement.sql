#CASE
select first_name,last_name,age,
case
when age<=29 then 'young'
when age between 29 and 50 then 'old'
when age>60 then 'in death door'
end as age_bracket
from employee_demographics;

#pay increase
#<50000=5%
#>50000=8%
select first_name,last_name,salary,
case
	when salary<=50000 then salary+(salary*0.05)
    when salary>50000 then salary+(salary*0.07)
end as salary_bracket
from employee_salary;