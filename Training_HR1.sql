set serverout on size 100000

begin

for i in (SELECT /*+ parallel */ * FROM employees) 
loop
dbms_output.put_line(i.first_name);
end loop;

INSERT /*+ append */ INTO my_target_table
SELECT /*+ parallel */ * FROM employees;
end;

create table my_target_table as select * from employees;
INSERT /*+ append */ INTO my_target_table
SELECT /*+ parallel */ * FROM my_staging_table;

select * from my_target_table;