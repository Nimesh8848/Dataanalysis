Delimiter $$
create event delete_retires
on schedule every 30 second
do
begin
	delete
    from employee_demographics
    where age>=60;
end $$	
delimiter ;
select * from employee_demographics;