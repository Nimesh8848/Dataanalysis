#group by
select  gender,avg(age),max(age),min(age),count(age)
from employee_demographics
group by gender;

#order by
select * from employee_demographics
order by first_name Desc;
select * from employee_demographics
order by age Desc;
select * from employee_demographics
order by age,gender ;