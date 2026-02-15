-- create database
create database company;
use company;

-- create employee first 
create table employee (
    fname           varchar(50) not null,
    lname           varchar(50) not null,
    ssn             char(9) primary key,
    bdate           date,
    address         varchar(100),
    salary          decimal(10,2),
    dno             int,
    supervisor_ssn  char(9),
    partner_ssn     char(9),
    constraint fk_supervisor foreign key (supervisor_ssn) references employee (ssn)
);

-- create department
create table department (
    dname           varchar(50) not null unique,
    dnumber         int primary key,
    mgr_ssn         char(9),
    mgr_start_date  date,
    constraint fk_mgr foreign key (mgr_ssn) references employee (ssn)
);

-- add foreign key from employee to department
alter table employee
    add constraint fk_dept foreign key (dno) references department (dnumber);

-- create dept_location
create table dept_location (
    dnumber     int,
    dlocation   varchar(50),
    primary key (dnumber, dlocation),
    constraint fk_deptloc_dept foreign key (dnumber) references department (dnumber)
);

-- create project
create table project (
    pname       varchar(50) not null,
    pnumber     int primary key,
    plocation   varchar(50),
    dnum        int,
    constraint fk_proj_dept foreign key (dnum) references department (dnumber)
);

-- create work_on
create table work_on (
    essn    char(9),
    pno     int,
    hours   decimal(5,2),
    primary key (essn, pno),
    constraint fk_work_emp foreign key (essn) references employee (ssn),
    constraint fk_work_proj foreign key (pno) references project (pnumber)
);

-- create dependent
create table dependent (
    essn            char(9),
    dependent_name  varchar(50),
    sex             char(1),
    bdate           date,
    relationship    varchar(25),
    primary key (essn, dependent_name),
    constraint fk_dep_emp foreign key (essn) references employee (ssn)
);

-- insert department info
insert into department (dname, dnumber, mgr_ssn, mgr_start_date)
values
    ('love research', 1, null, '2025-11-18'),
    ('romance administration', 2, null, '2025-11-19');

-- insert dept_location info
insert into dept_location (dnumber, dlocation)
values
    (1, 'tokyo'),
    (1, 'kyoto'),
    (2, 'osaka');

-- insert employees info
insert into employee (fname, lname, ssn, bdate, address, salary, dno, supervisor_ssn, partner_ssn)
values
    ('kaguya', 'shinomiya', '111111111', '1998-01-01', 'tokyo academy', 75000, 1, null, null),
    ('miyuki', 'shirogane', '222222222', '1997-03-09', 'student council hall', 82000, 1, '111111111', '333333333'),
    ('gojo', 'wakana', '333333333', '1996-05-05', 'shibuya district', 95000, 2, null, null),
    ('marin', 'kitagawa', '444444444', '1999-07-07', 'harajuku street', 60000, 2, '333333333', null),
    ('chika', 'fujiwara', '555555555', '1998-12-12', 'kanda shrine area', 70000, 1, '111111111', null);

-- insert projects info
insert into project (pname, pnumber, plocation, dnum)
values
    ('project confession war', 101, 'tokyo', 1),
    ('project cosplay hearts', 102, 'osaka', 2),
    ('project love is war', 103, 'kyoto', 1);

-- insert work_on info
insert into work_on (essn, pno, hours)
values
    ('111111111', 101, 20.0),
    ('222222222', 101, 15.5),
    ('333333333', 102, 30.0),
    ('444444444', 102, 25.0),
    ('555555555', 103, 10.0);

-- insert dependents info
insert into dependent (essn, dependent_name, sex, bdate, relationship)
values
    ('111111111', 'ai hayasaka', 'F', '1999-02-14', 'assistant'),
    ('222222222', 'kei shirogane', 'F', '2005-06-01', 'sister'),
    ('333333333', 'grandpa gojo', 'M', '1945-11-11', 'grandparent'),
    ('444444444', 'cosplay buddy', 'F', '2000-08-08', 'friend'),
    ('555555555', 'dance partner', 'M', '1998-09-09', 'friend');

-- cleanup 
drop table work_on;
drop table dependent;
drop table project;
drop table dept_location;
drop table employee;
drop table department;
