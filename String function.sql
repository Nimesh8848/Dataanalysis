#length
select first_name, length(first_name) 
from employee_demographics;
#upper
select first_name,upper(first_name)
from employee_demographics;

#TRIM
select trim('  sky    ');

#substring
select first_name,Left(first_name,3),
substring(first_name,2,3),
birth_date,
substring(birth_date,6,2) as birth_month
from employee_demographics;

#replace
select first_name,replace(first_name,'a','p')
from employee_demographics;

#locate
select locate('p','Mprk');
select first_name,locate('an',first_name)
from employee_demographics;

#Concatenation
select first_name,last_name,
concat(first_name,'  ',last_name) as full_name
from employee_demographics;
