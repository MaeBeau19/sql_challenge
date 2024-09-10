CREATE TABLE Departments(
    dept_no VARCHAR (10)  not null,
	dept_name TEXT NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY ("dept_no") 

);

drop table departments;

CREATE TABLE employees ( "emp_no" INT NOT NULL,
"emp_title_id" TEXT NOT NULL,
"birth_date" DATE NOT NULL,
"first_name" TEXT NOT NULL,
"last_name" TEXT NOT NULL,
"sex" TEXT NOT NULL,
"hire_date" DATE NOT NULL,
CONSTRAINT "pk_employees" PRIMARY KEY ("emp_no")
);

drop table employees;


CREATE TABLE "salaries" (
"emp_no" INT NOT NULL,
"salary" INT NOT NULL,
CONSTRAINT "pk_salaries" PRIMARY KEY (
"emp_no"
)
);

DROP TABLE "salaries";


CREATE TABLE "titles" (
"title_id" VARCHAR (5) NOT NULL,
"tiltle" TEXT NOT NULL,
CONSTRAINT "pk_titles" PRIMARY KEY (
"title_id"
)
);

drop table "titles";

CREATE TABLE "dept_manager" (
"dept_no" VARCHAR (5) NOT NULL,
"emp_no" INT NOT NULL,

CONSTRAINT "pk_dept_manager" PRIMARY KEY (
"emp_no" )
);

DROP TABLE "dept_manager";


CREATE TABLE "dept_emp" (
"emp_no" INT NOT NULL,
"dept_no" VARCHAR (5) NOT NULL,
CONSTRAINT "pk_dept_emp" PRIMARY KEY (
"emp_no", "dept_no")
);

drop table "dept_emp";




















select *
	from Departments;


select *
from salaries;

select * 
from titles;

select *
from Dept_manager;

select*
from dept_emp;

select *
from employees;



alter table "employees" add constraint "fk_employees_no"
foreign key("emp_no")
references "salaries";


alter table "employees" add constraint "fk_employees_emp_id" foreign key ("emp_title_id")
references "titles"	("title_id");

alter table "dept_manager" add constraint "fk_dept_manager_emp_no" foreign key ("emp_no")
	references "employees" ("emp_no");

alter table "dept_manager"	add constraint "fk_dept_manager_dept_no" foreign key ("dept_no")
	references  "departments" ("dept_no");

alter table "dept_emp" add constraint "fk_dept_emp_emp_no" foreign key ("emp_no")
	references "employees" ("emp_no");

alter table "dept_emp" add constraint "fk_dept_emp_dept_no" foreign key ("dept_no")
	references "departments" ("dept_no");

	
--1. 

select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees e 
join salaries s on e.emp_no = s.emp_no
;

select first_name, last_name, hire_date
from employees
where date_part ('year', hire_date) ='1986'
;

select d.dept_no, dep.dept_name, d.emp_no, e.last_name, e.first_name
from dept_manager d
join departments dep
on (d.dept_no = dep.dept_no)
join employees e
on (d.emp_no = e.emp_no)
;

select d.emp_no, e.last_name, e.first_name, dep.dept_name
from dept_emp d
join departments dep
on (d.dept_no = dep.dept_no)
join employees e
on (d.emp_no = e.emp_no)
;

select first_name, last_name
from employees
where first_name ='Hercules'
and last_name like 'B%'
;

select d.emp_no, e.last_name, e.first_name, dep.dept_name
from dept_emp d
join employees e
on (d.emp_no = e.emp_no)
join departments dep
on (d.dept_no = dep.dept_no)
where d.dept_no in (
select dept_no
	from departments
	where dept_name ='Sales'
	
);

select d.emp_no, e.last_name, e.first_name, dep.dept_name
from dept_emp d
join employees e
on (d.emp_no = e.emp_no)
join departments dep
on (d.dept_no = dep.dept_no)
where d.dept_no in(
select dept_no
	from departments
	where dept_name ='Sales'
	or dept_name = 'Development'
	);

select last_name, count (last_name) as count
from employees
group by 1
order by count desc
;





