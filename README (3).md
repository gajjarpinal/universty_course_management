# university course management system

This project contains the complete university course management system in one
file:

- [university_course_management.sql](university_course_management.sql)

The file is written for mysql workbench. It creates the tables, inserts the
same sample data from the project brief, runs crud examples, and runs all
sixteen required queries.

## project explanation video

Watch the project explanation video here:

[youtube project explanation](https://www.youtube.com/watch?v=RvotEyEJno0)

## how to run

1. Open mysql workbench.
2. Open `university_course_management.sql`.
3. Select the mysql schema where the project should be created.
4. Run the complete file.

The script uses `start transaction` and `rollback` for the temporary crud
examples. Therefore, the temporary rows are removed and the original sample
data is not changed.

## tables

- `students`: student information.
- `courses`: course information.
- `instructors`: instructor information.
- `enrollments`: connection between students and courses.
- `departments`: department information.

## output from the project

The following results are produced from the sample data. Extra student and
enrollment rows were added so that the result of every required query has at
least one row.

### query 1: all table data

`students`

| student_id | first_name | last_name | email | birth_date | enrollment_date |
| --- | --- | --- | --- | --- | --- |
| 1 | john | doe | john.doe@email.com | 2000-01-15 | 2022-08-01 |
| 2 | jane | smith | jane.smith@email.com | 1999-05-25 | 2021-08-01 |
| 3 | michael | brown | michael.brown@email.com | 2001-03-12 | 2023-08-01 |
| 4 | sarah | davis | sarah.davis@email.com | 2000-07-20 | 2023-08-01 |
| 5 | david | wilson | david.wilson@email.com | 1998-11-05 | 2023-08-01 |
| 6 | emily | miller | emily.miller@email.com | 2001-02-18 | 2023-08-01 |
| 7 | daniel | moore | daniel.moore@email.com | 1999-09-30 | 2023-08-01 |
| 8 | olivia | taylor | olivia.taylor@email.com | 2002-04-14 | 2023-08-01 |
| 9 | james | anderson | james.anderson@email.com | 2000-12-22 | 2023-08-01 |
| 10 | ava | thomas | ava.thomas@email.com | 2001-06-08 | 2023-08-01 |
| 11 | william | jackson | william.jackson@email.com | 1999-01-27 | 2023-08-01 |
| 12 | sophia | white | sophia.white@email.com | 2002-10-11 | 2023-08-01 |

`courses`

| course_id | course_name | department_id | credits |
| --- | --- | --- | --- |
| 101 | introduction to sql | 1 | 3 |
| 102 | data structures | 2 | 4 |

`instructors`

| instructor_id | first_name | last_name | email | department_id | salary |
| --- | --- | --- | --- | --- | --- |
| 1 | alice | johnson | alice.johnson@univ.com | 1 | 72000.00 |
| 2 | bob | lee | bob.lee@univ.com | 2 | 68000.00 |

`enrollments`

| enrollment_id | student_id | course_id | enrollment_date |
| --- | --- | --- | --- |
| 1 | 1 | 101 | 2022-08-01 |
| 2 | 2 | 102 | 2021-08-01 |
| 3 | 2 | 101 | 2023-08-01 |
| 4 | 3 | 101 | 2023-08-01 |
| 5 | 4 | 101 | 2023-08-01 |
| 6 | 5 | 101 | 2023-08-01 |
| 7 | 6 | 101 | 2023-08-01 |
| 8 | 7 | 101 | 2023-08-01 |
| 9 | 8 | 101 | 2023-08-01 |
| 10 | 9 | 101 | 2023-08-01 |
| 11 | 10 | 101 | 2023-08-01 |
| 12 | 11 | 101 | 2023-08-01 |
| 13 | 12 | 101 | 2023-08-01 |

`departments`

| department_id | department_name |
| --- | --- |
| 1 | computer science |
| 2 | mathematics |

### query 2: students enrolled after 2022

| student_id | first_name | last_name | email | birth_date | enrollment_date |
| --- | --- | --- | --- | --- | --- |
| 1 | john | doe | john.doe@email.com | 2000-01-15 | 2022-08-01 |
| 3 | michael | brown | michael.brown@email.com | 2001-03-12 | 2023-08-01 |
| 4 | sarah | davis | sarah.davis@email.com | 2000-07-20 | 2023-08-01 |
| 5 | david | wilson | david.wilson@email.com | 1998-11-05 | 2023-08-01 |
| 6 | emily | miller | emily.miller@email.com | 2001-02-18 | 2023-08-01 |
| 7 | daniel | moore | daniel.moore@email.com | 1999-09-30 | 2023-08-01 |
| 8 | olivia | taylor | olivia.taylor@email.com | 2002-04-14 | 2023-08-01 |
| 9 | james | anderson | james.anderson@email.com | 2000-12-22 | 2023-08-01 |
| 10 | ava | thomas | ava.thomas@email.com | 2001-06-08 | 2023-08-01 |
| 11 | william | jackson | william.jackson@email.com | 1999-01-27 | 2023-08-01 |
| 12 | sophia | white | sophia.white@email.com | 2002-10-11 | 2023-08-01 |

### query 3: mathematics courses, maximum five rows

| course_id | course_name | department_id | credits |
| --- | --- | --- | --- |
| 102 | data structures | 2 | 4 |

### query 4: courses with more than five students

| course_id | course_name | student_count |
| --- | --- | --- |
| 101 | introduction to sql | 12 |

### query 5: students in both courses

| student_id | first_name | last_name |
| --- | --- | --- |
| 2 | jane | smith |

### query 6: students in either course

| student_id | first_name | last_name |
| --- | --- | --- |
| 1 | john | doe |
| 2 | jane | smith |
| 3 | michael | brown |
| 4 | sarah | davis |
| 5 | david | wilson |
| 6 | emily | miller |
| 7 | daniel | moore |
| 8 | olivia | taylor |
| 9 | james | anderson |
| 10 | ava | thomas |
| 11 | william | jackson |
| 12 | sophia | white |

### query 7: average course credits

| average_credits |
| --- |
| 3.5000 |

### query 8: maximum computer science instructor salary

| maximum_salary |
| --- |
| 72000.00 |

### query 9: students in each department

| department_id | department_name | student_count |
| --- | --- | --- |
| 1 | computer science | 12 |
| 2 | mathematics | 1 |

### query 10: inner join students and courses

| student_id | first_name | last_name | course_id | course_name |
| --- | --- | --- | --- | --- |
| 1 | john | doe | 101 | introduction to sql |
| 2 | jane | smith | 102 | data structures |
| 2 | jane | smith | 101 | introduction to sql |
| 3 | michael | brown | 101 | introduction to sql |
| 4 | sarah | davis | 101 | introduction to sql |
| 5 | david | wilson | 101 | introduction to sql |
| 6 | emily | miller | 101 | introduction to sql |
| 7 | daniel | moore | 101 | introduction to sql |
| 8 | olivia | taylor | 101 | introduction to sql |
| 9 | james | anderson | 101 | introduction to sql |
| 10 | ava | thomas | 101 | introduction to sql |
| 11 | william | jackson | 101 | introduction to sql |
| 12 | sophia | white | 101 | introduction to sql |

### query 11: left join all students with courses

| student_id | first_name | last_name | course_name |
| --- | --- | --- | --- |
| 1 | john | doe | introduction to sql |
| 2 | jane | smith | data structures |
| 2 | jane | smith | introduction to sql |
| 3 | michael | brown | introduction to sql |
| 4 | sarah | davis | introduction to sql |
| 5 | david | wilson | introduction to sql |
| 6 | emily | miller | introduction to sql |
| 7 | daniel | moore | introduction to sql |
| 8 | olivia | taylor | introduction to sql |
| 9 | james | anderson | introduction to sql |
| 10 | ava | thomas | introduction to sql |
| 11 | william | jackson | introduction to sql |
| 12 | sophia | white | introduction to sql |

### query 12: students in courses with more than ten students

| student_id | first_name | last_name |
| --- | --- | --- |
| 1 | john | doe |
| 2 | jane | smith |
| 3 | michael | brown |
| 4 | sarah | davis |
| 5 | david | wilson |
| 6 | emily | miller |
| 7 | daniel | moore |
| 8 | olivia | taylor |
| 9 | james | anderson |
| 10 | ava | thomas |
| 11 | william | jackson |
| 12 | sophia | white |

### query 13: enrollment year

| student_id | enrollment_year |
| --- | --- |
| 1 | 2022 |
| 2 | 2021 |
| 3 | 2023 |
| 4 | 2023 |
| 5 | 2023 |
| 6 | 2023 |
| 7 | 2023 |
| 8 | 2023 |
| 9 | 2023 |
| 10 | 2023 |
| 11 | 2023 |
| 12 | 2023 |

### query 14: complete instructor names

| instructor_id | instructor_name |
| --- | --- |
| 1 | alice johnson |
| 2 | bob lee |

### query 15: running enrollment total

| enrollment_date | daily_enrollments | running_total |
| --- | --- | --- |
| 2021-08-01 | 1 | 1 |
| 2022-08-01 | 1 | 2 |
| 2023-08-01 | 11 | 13 |

### query 16: student labels

The result depends on the date when mysql workbench runs the query. With the
current date used for this project, all sample students are labelled `senior`.

| student_id | first_name | last_name | student_level |
| --- | --- | --- | --- |
| 1 | john | doe | senior |
| 2 | jane | smith | senior |
| 3 | michael | brown | senior |
| 4 | sarah | davis | senior |
| 5 | david | wilson | senior |
| 6 | emily | miller | senior |
| 7 | daniel | moore | senior |
| 8 | olivia | taylor | senior |
| 9 | james | anderson | senior |
| 10 | ava | thomas | senior |
| 11 | william | jackson | senior |
| 12 | sophia | white | senior |

## note about salary

The assignment asks for the maximum instructor salary, but salary is not
listed in the instructor sample fields. The `salary` column and the two salary
values are included only so query 8 can be completed. The additional student
and enrollment rows are included to demonstrate the aggregate, join, and
subquery results. The two original student rows and all original sample data
remain unchanged.

All sql keywords, functions, table names, column names, comments, and sample
text are written in lowercase.
