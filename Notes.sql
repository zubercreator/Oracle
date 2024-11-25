alter session set "_ORACLE_SCRIPT"=true;

https://www.hipeople.io/interview-questions/tricky-oracle-sql-interview-questions

https://sql-plsql.blogspot.com/2009/04/sql-interview-questions.html#google_vignette

https://forums.oracle.com/ords/apexds/post/oracle-sql-and-pl-sql-interview-questions-3872



SELECT t1.ID
FROM Table1 t1
    LEFT JOIN Table2 t2 ON t1.ID = t2.ID
WHERE t2.ID IS NULL


table_A:             table_B:                  table_C:

id    object1         id    tag                 id    object1
1     lamp           1     furniture           3     stool
2     table          2     furniture           4     bench
3     stool          3     furniture
4     bench          4     furniture
                     4     chair
                     3     chair


create table table_A (id number, object1 varchar2(20) );		 
			
create table table_C (id number, object1 varchar2(20) );

		

insert into table_A values (1 ,    'lamp' );
insert into table_A values (2 ,    'table');
insert into table_A values (3  ,   'stool');
insert into table_A values (4   ,  'bench');
insert into table_A values (5   ,  'bench2');

insert into table_c values (3 ,    'stool' );
insert into table_c values (4 ,    'bench');
insert into table_c values (5 ,    'bench');
insert into table_c values (5 ,    'bench4');


commit;

SELECT t1.ID
FROM table_A t1
    LEFT JOIN table_c t2 ON t1.ID = t2.ID and t1.object1 = t2.object1
WHERE t2.ID IS NULL;

"ID"	"OBJECT1"
2	"table"
5	"bench2"
1	"lamp"



SELECT t2.*
FROM table_A t1
    RIGHT JOIN table_c t2 ON t1.ID = t2.ID and t1.object1 = t2.object1
WHERE t1.ID IS NULL;


"ID"	"OBJECT1"
5	"bench"
5	"bench4"

=====================================


SELECT *
FROM table_A t1
    LEFT JOIN table_c t2 ON t1.ID = t2.ID and t1.object1 = t2.object1
WHERE t2.ID IS NULL;
"ID"	"OBJECT1"	"ID_1"	"OBJECT1_1"
2	"table"		""
5	"bench2"		""
1	"lamp"		""


SELECT *
FROM table_A t1
    RIGHT JOIN table_c t2 ON t1.ID = t2.ID and t1.object1 = t2.object1
WHERE t1.ID IS NULL;
"ID"	"OBJECT1"	"ID_1"	"OBJECT1_1"
	""	5	"bench"
	""	5	"bench4"


================================================================================

40 Find out nth highest salary from emp table
SELECT DISTINCT (a.sal) FROM EMP A WHERE &N = (SELECT COUNT (DISTINCT (b.sal)) FROM EMP B WHERE a.sal<=b.sal);
For Eg:-
Enter value for n: 2
SAL
---------
3700


SELECT DISTINCT (a.salary) FROM employees A WHERE 2 = (SELECT COUNT (DISTINCT (b.salary)) FROM employees B WHERE a.salary<=b.salary);

================================================================================
 Display the number value in Words?
select Salary, ' Rs. '||(to_char(to_date(Salary,'j'), 'Jsp'))|| ' only.'  "Salary in Words"
from employees;

Salary Sal in Words
------- ------------------------------------------------------
800 Rs. Eight Hundred only.
1600 Rs. One Thousand Six Hundred only.
1250 Rs. One Thousand Two Hundred Fifty only.

================================================================================
44 Difference between procedure and function.
Functions are named PL/SQL blocks that return a value and can be called with arguments procedure a named block that can be called with parameter. A procedure all is a PL/SQL statement by itself, while a Function call is called as part of an expression.

45 Difference between NO DATA FOUND and %NOTFOUND
NO DATA FOUND is an exception raised only for the SELECT....INTO statements when the where clause of the querydoes not match any rows. When the where clause of the explicit cursor does not match any rows the %NOTFOUND attribute is set to TRUE instead.



================================================================================

53 What are various joins used while writing SUBQUERIES?
Self join-Its a join foreign key of a table references the same table. Outer Join--Its a join condition used where One can query all the rows of one of the tables in the join condition even though they don't satisfy the join condition.
Equi-join--Its a join condition that retrieves rows from one or more tables in which one or more columns in one table are equal to one or more columns in the second table.



================================================================================
Write an Oracle SQL query to find employees who earn more than their managers.

SELECT emp.*
FROM Employees emp
INNER JOIN Employees mgr ON emp.manager_id = mgr.employee_id
WHERE emp.salary > mgr.salary;

================================================================================
CREATE INDEX emp_deptid_ix ON hr.employees(department_id); 


CREATE INDEX emp_deptid_ix ON hr.employees(department_id); 


CREATE INDEX emp_name_dpt_ix ON hr.employees(last_name ASC, department_id DESC); 


================================================================================

CREATE TABLE raises (emp_id NUMBER, sal NUMBER 
   CONSTRAINT check_sal CHECK(sal > 8000));

EXECUTE DBMS_ERRLOG.CREATE_ERROR_LOG('raises', 'errlog');

SELECT ORA_ERR_MESG$, ORA_ERR_TAG$, emp_id, sal FROM errlog;

select * from all_tables where table_name = 'ERRLOG';

select * from  errlog;

================================================================================
Starting with Oracle 12c (12.1) there is a syntax available to limit rows or start at offsets.

-- only get first 10 results

SELECT salary
FROM   employees
ORDER BY salary DESC
FETCH FIRST 1 ROWS ONLY;

SELECT * 
FROM   employees
ORDER BY salary
OFFSET 10 ROWS FETCH NEXT 5 ROWS ONLY;


================================================================================
CREATE TABLE rownum_order_test (
  val  NUMBER
);

INSERT ALL
  INTO rownum_order_test
SELECT level
FROM   dual
CONNECT BY level <= 10;

COMMIT;


================================================================================

SELECT SCN_TO_TIMESTAMP(ORA_ROWSCN), ORA_ROWSCN FROM employees
   WHERE employee_id = 188;
22-11-2024 07:25:38.000000000 PM	2816598

================================================================================
SELECT SCN_TO_TIMESTAMP(ORA_ROWSCN), ORA_ROWSCN FROM employees
   WHERE employee_id = 188;
22-11-2024 07:25:38.000000000 PM	2816598

FLASHBACK TABLE employees TO TIMESTAMP
   TO_TIMESTAMP('24-11-2024 01:25:38.000000000 PM');

ALTER TABLE employees ENABLE ROW MOVEMENT;

SELECT salary FROM employees WHERE employee_id = 188;
update  employees set salary = 3801 where employee_id = 188;

================================================================================
SELECT  d.* 
FROM departments d LEFT OUTER JOIN employees e
ON (d.department_id = e.department_id) 
WHERE e.department_id is null;


SELECT d.*
FROM departments d 
where not exists (select distinct e.department_id from employees e where d.department_id = e.department_id ) ;

SELECT EMPLOYEEs.department_id, department_name, employees.employee_id
      FROM DEPARTMENTs LEFT OUTER JOIN EMPLOYEEs
	    ON DEPARTMENTs.manager_id = employees.employee_id

================================================================================


================================================================================


================================================================================