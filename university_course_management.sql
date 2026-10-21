
use final_project;	

drop table if exists enrollments;
drop table if exists instructors;
drop table if exists courses;
drop table if exists students;
drop table if exists departments;

create table departments (
    department_id int primary key,
    department_name varchar(100) not null unique
);

create table students (
    student_id int primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    email varchar(150) not null unique,
    birth_date date not null,
    enrollment_date date not null
);

create table courses (
    course_id int primary key,
    course_name varchar(150) not null,
    department_id int not null,
    credits int not null check (credits > 0),
    foreign key (department_id) references departments(department_id)
);

create table instructors (
    instructor_id int primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    email varchar(150) not null unique,
    department_id int not null,
    salary decimal(10, 2) not null check (salary >= 0),
    foreign key (department_id) references departments(department_id)
);

create table enrollments (
    enrollment_id int primary key,
    student_id int not null,
    course_id int not null,
    enrollment_date date not null,
    foreign key (student_id) references students(student_id),
    foreign key (course_id) references courses(course_id),
    unique (student_id, course_id)
);

insert into departments (department_id, department_name) values
    (1, 'computer science'),
    (2, 'mathematics');

insert into students (
    student_id,
    first_name,
    last_name,
    email,
    birth_date,
    enrollment_date
) values
    (1, 'john', 'doe', 'john.doe@email.com', '2000-01-15', '2022-08-01'),
    (2, 'jane', 'smith', 'jane.smith@email.com', '1999-05-25', '2021-08-01'),
    (3, 'michael', 'brown', 'michael.brown@email.com', '2001-03-12', '2023-08-01'),
    (4, 'sarah', 'davis', 'sarah.davis@email.com', '2000-07-20', '2023-08-01'),
    (5, 'david', 'wilson', 'david.wilson@email.com', '1998-11-05', '2023-08-01'),
    (6, 'emily', 'miller', 'emily.miller@email.com', '2001-02-18', '2023-08-01'),
    (7, 'daniel', 'moore', 'daniel.moore@email.com', '1999-09-30', '2023-08-01'),
    (8, 'olivia', 'taylor', 'olivia.taylor@email.com', '2002-04-14', '2023-08-01'),
    (9, 'james', 'anderson', 'james.anderson@email.com', '2000-12-22', '2023-08-01'),
    (10, 'ava', 'thomas', 'ava.thomas@email.com', '2001-06-08', '2023-08-01'),
    (11, 'william', 'jackson', 'william.jackson@email.com', '1999-01-27', '2023-08-01'),
    (12, 'sophia', 'white', 'sophia.white@email.com', '2002-10-11', '2023-08-01');

insert into courses (course_id, course_name, department_id, credits) values
    (101, 'introduction to sql', 1, 3),
    (102, 'data structures', 2, 4);

insert into instructors (
    instructor_id,
    first_name,
    last_name,
    email,
    department_id,
    salary
) values
    (1, 'alice', 'johnson', 'alice.johnson@univ.com', 1, 72000.00),
    (2, 'bob', 'lee', 'bob.lee@univ.com', 2, 68000.00);

insert into enrollments (
    enrollment_id,
    student_id,
    course_id,
    enrollment_date
) values
    (1, 1, 101, '2022-08-01'),
    (2, 2, 102, '2021-08-01'),
    (3, 2, 101, '2023-08-01'),
    (4, 3, 101, '2023-08-01'),
    (5, 4, 101, '2023-08-01'),
    (6, 5, 101, '2023-08-01'),
    (7, 6, 101, '2023-08-01'),
    (8, 7, 101, '2023-08-01'),
    (9, 8, 101, '2023-08-01'),
    (10, 9, 101, '2023-08-01'),
    (11, 10, 101, '2023-08-01'),
    (12, 11, 101, '2023-08-01'),
    (13, 12, 101, '2023-08-01');

-- crud operations for all five tables
start transaction;

insert into departments (department_id, department_name)
values (999, 'temporary department');

select *
from departments
where department_id = 999;

update departments
set department_name = 'updated department'
where department_id = 999;

delete from departments
where department_id = 999;

insert into students (
    student_id,
    first_name,
    last_name,
    email,
    birth_date,
    enrollment_date
) values (
    999,
    'temporary',
    'student',
    'temporary.student@email.com',
    '2000-01-01',
    '2024-08-01'
);

select *
from students
where student_id = 999;

update students
set last_name = 'updated student'
where student_id = 999;

delete from students
where student_id = 999;

insert into courses (course_id, course_name, department_id, credits)
values (999, 'temporary course', 1, 3);

select *
from courses
where course_id = 999;

update courses
set credits = 4
where course_id = 999;

delete from courses
where course_id = 999;

insert into instructors (
    instructor_id,
    first_name,
    last_name,
    email,
    department_id,
    salary
) values (
    999,
    'temporary',
    'instructor',
    'temporary.instructor@univ.com',
    1,
    50000.00
);

select *
from instructors
where instructor_id = 999;

update instructors
set salary = 52000.00
where instructor_id = 999;

delete from instructors
where instructor_id = 999;

insert into enrollments (
    enrollment_id,
    student_id,
    course_id,
    enrollment_date
) values (
    999,
    1,
    101,
    '2024-08-01'
);

select *
from enrollments
where enrollment_id = 999;

update enrollments
set enrollment_date = '2024-08-15'
where enrollment_id = 999;

delete from enrollments
where enrollment_id = 999;

rollback;

-- 1. retrieve all rows from every table
select * from students;
select * from courses;
select * from instructors;
select * from enrollments;
select * from departments;

-- 2. retrieve students who enrolled after 2022
select *
from students
where enrollment_date >= '2022-01-01';

-- 3. retrieve up to five courses from the mathematics department
select c.*
from courses c
join departments d on d.department_id = c.department_id
where d.department_name = 'mathematics'
limit 5;

-- 4. count students in each course and keep courses with more than five
select c.course_id, c.course_name, count(e.student_id) as student_count
from courses c
left join enrollments e on e.course_id = c.course_id
group by c.course_id, c.course_name
having count(e.student_id) > 5;

-- 5. find students enrolled in both introduction to sql and data structures
select s.student_id, s.first_name, s.last_name
from students s
join enrollments e on e.student_id = s.student_id
join courses c on c.course_id = e.course_id
where c.course_name in ('introduction to sql', 'data structures')
group by s.student_id, s.first_name, s.last_name
having count(c.course_name) = 2;

-- 6. find students enrolled in either introduction to sql or data structures
select distinct s.student_id, s.first_name, s.last_name
from students s
join enrollments e on e.student_id = s.student_id
join courses c on c.course_id = e.course_id
where c.course_name in ('introduction to sql', 'data structures');

-- 7. calculate the average credits for all courses
select avg(credits) as average_credits
from courses;

-- 8. find the maximum instructor salary in computer science
select max(i.salary) as maximum_salary
from instructors i
join departments d on d.department_id = i.department_id
where d.department_name = 'computer science';

-- 9. count students in each department
select d.department_id, d.department_name, count(distinct s.student_id) as student_count
from departments d
left join courses c on c.department_id = d.department_id
left join enrollments e on e.course_id = c.course_id
left join students s on s.student_id = e.student_id
group by d.department_id, d.department_name;

-- 10. inner join students and their courses
select s.student_id, s.first_name, s.last_name, c.course_id, c.course_name
from students s
inner join enrollments e on e.student_id = s.student_id
inner join courses c on c.course_id = e.course_id;

-- 11. left join all students with their courses, if any
select s.student_id, s.first_name, s.last_name, c.course_name
from students s
left join enrollments e on e.student_id = s.student_id
left join courses c on c.course_id = e.course_id;

-- 12. find students enrolled in courses with more than ten students
select distinct s.student_id, s.first_name, s.last_name
from students s
join enrollments e on e.student_id = s.student_id
where e.course_id in (
    select course_id
    from enrollments
    group by course_id
    having count(student_id) > 10
);

-- 13. extract the enrollment year
select student_id, extract(year from enrollment_date) as enrollment_year
from students;

-- 14. concatenate each instructor's first and last name
select instructor_id, concat(first_name, ' ', last_name) as instructor_name
from instructors;

-- 15. calculate the running total of enrollments by date
select enrollment_date,
       count(*) as daily_enrollments,
       sum(count(*)) over (order by enrollment_date) as running_total
from enrollments
group by enrollment_date
order by enrollment_date;

-- 16. label students as senior or junior using the current date
select student_id,
       first_name,
       last_name,
       case
           when enrollment_date < current_date - interval 4 year then 'senior'
           else 'junior'
       end as student_level
from students;
