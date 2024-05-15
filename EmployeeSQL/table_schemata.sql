CREATE TABLE "employees" (
    "emp_no" int NOT NULL PRIMARY KEY,
    "emp_title" varchar (6) NOT NULL,
	"birth_date" date NOT null,
    "first_name" varchar (20)   NOT NULL,
    "last_name" varchar (20)  NOT NULL,
    "sex" varchar (1)  NOT NULL,
    "hire_date" date NOT NULL,
	FOREIGN KEY (emp_title) references titles(title_id)
     );

CREATE TABLE "salaries" (
    "emp_no" int NOT NULL PRIMARY KEY,
    "salary" int NOT NULL,
	FOREIGN KEY (emp_no) references employees(emp_no)
);

CREATE TABLE "titles" (
    "title_id" varchar (6) NOT NULL PRIMARY KEY,
    "title" varchar (20)  NOT NULL);

CREATE TABLE "dept_emp" (
    "emp_no" int NOT NULL,
    "dept_no" varchar (6) NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) references employees(emp_no),
	FOREIGN KEY (dept_no) references departments(dept_no)
);

CREATE TABLE "dept_manager" (
    "dept_no" varchar(6) NOT NULL,
    "emp_no" int NOT NULL,
	PRIMARY KEY  (dept_no, emp_no),
	FOREIGN KEY (dept_no) references departments(dept_no),
	FOREIGN KEY (emp_no) references employees(emp_no));

CREATE TABLE "departments" (
    "dept_no" varchar (6) NOT NULL PRIMARY KEY,
    "dept_name" varchar (20)  NOT NULL);