--Exercise 1
--The difference between DDL and DML is that DDL is used to define the schema or
--the structure of database which means it is used to create the table(relation)
--and the DML is used to access, or modify the schema or table created by DDL.
--
--a)
--DDL commands:CREATE,ALTER,DROP
--
--b)
--DML commands:SELECT,INSERT,UPDATE,DELETE


--Exercise 2
CREATE TABLE order_items(
    order_code integer NOT NULL UNIQUE REFERENCES orders (code),
    product_id varchar NOT NULL UNIQUE REFERENCES products (id),
    quantity   integer NOT NULL CHECK (quantity>0),
    PRIMARY KEY (order_code,product_id)
);

CREATE TABLE products(
    id          varchar PRIMARY KEY,
    name        varchar NOT NULL UNIQUE,
    description text,
    price       double precision NOT NULL CHECK (price>0)
);

CREATE TABLE orders(
    code        integer PRIMARY KEY,
    customer_id integer REFERENCES customers (id),
    total_sum   double precision NOT NULL CHECK (total_sum>0),
    is_paid     boolean NOT NULL
);

CREATE TABLE customers(
    id               integer PRIMARY KEY,
    full_name        varchar(50) NOT NULL,
    timestamp        timestamp NOT NULL,
    delivery_address text NOT NULL
);



--Exercise 3
CREATE TABLE lesson_participants(
    lesson_id integer PRIMARY KEY,
    lesson_title varchar(50) NOT NULL,
    teaching_instructor_id integer NOT NULL REFERENCES instructors (instructor_id),
    studying_students_class_id integer NOT NULL REFERENCES class (class_id),
    room_number integer NOT NULL CHECK (room_number>0)
);

CREATE TABLE instr_languages(
    language_instructor integer NOT NULL  ,
    language_name varchar(20) NOT NULL ,
    PRIMARY KEY (language_instructor,language_name)
);

CREATE TABLE instructors(
    instructor_id integer PRIMARY KEY REFERENCES instr_languages(language_instructor),
    full_name varchar(50) NOT NULL CHECK (char_length(full_name)>3),
    speaking_languages_id  integer NOT NULL REFERENCES instr_languages(language_instructor),
    work_experience_year varchar(20) NOT NULL,
    possibility_of_remote_lessons boolean NOT NULL
);

CREATE TABLE students(
    student_id integer PRIMARY KEY REFERENCES class (student_id),
    full_name varchar(50) NOT NULL CHECK (char_length(full_name)>3),
    age integer NOT NULL CHECK (age>5),
    birth_date date NOT NULL,
    gender varchar(20) NOT NULL,
    average_grade double precision NOT NULL CHECK (average_grade>0),
    information_about_yourself text NOT NULL,
    need_for_a_dormitory boolean NOT NULL,
    additional_info text
);

CREATE TABLE class(
    class_id integer NOT NULL,
    student_id integer NOT NULL,
    PRIMARY KEY (class_id,student_id)
);


--Exercise 4
INSERT INTO products VALUES ('012081','Computer','Gaming Computer',399999.99);

UPDATE products
SET description='Lenovo Legion'
WHERE description='Gaming Computer';

DELETE FROM products
WHERE price=399999.99;
