+++
author = "Winston Tsia"
authorlink = ""
title = "Relational Databases"
date = 2023-01-17T19:29:32-08:00
description = "Notes on Relational Databases"
tags = [
    "MySQL",
    "Relational Databases",
]
categories = [
    "Computer Science",
    "Databases",
]
math = true
notaxonomy = false
hidden = true
norobots = true
nodate = true
hidemeta = false
+++
# Contents
- [Contents](#contents)
- [Relational Databases: MySQL](#relational-databases-mysql)
  - [Outcomes](#outcomes)
- [Basic Commands](#basic-commands)
- [Starting a MySQL Instance](#starting-a-mysql-instance)
- [Entity Relationship (ER) Model](#entity-relationship-er-model)
  - [ER Diagram Example](#er-diagram-example)
- [Populating a Database](#populating-a-database)
  - [Creating Tables](#creating-tables)
    - [**IMPORTANT**](#important)
    - [Additional commands:](#additional-commands)
  - [Creating Relationships](#creating-relationships)
- [Scripts](#scripts)
- [Creating a DB from Scratch](#creating-a-db-from-scratch)
- [SQL Query Clauses](#sql-query-clauses)
- [Working with a DB (Assignment 6)](#working-with-a-db-assignment-6)
    - [Displaying COUNT of rows](#displaying-count-of-rows)
    - [Insert New 'Student'](#insert-new-student)
    - [Inserting SCORE for STUDENT\_ID into table](#inserting-score-for-student_id-into-table)
    - [Finding COUNT of "groups" of an "attribute"](#finding-count-of-groups-of-an-attribute)
    - [Displaying Query by Value](#displaying-query-by-value)
- [Database Triggers](#database-triggers)
  - [Stored Programs](#stored-programs)
- [Midterm DB (3)](#midterm-db-3)
- [Database Transactions](#database-transactions)
    - [Lab](#lab)
# Relational Databases: MySQL
Guide based on Joel Murach's MySQL (3rd Edition, 2019)

An introduction to the relational model, relational algebra, and SQL. Also covers XML data including DTDs
and XML Schema for validation, and an introduction to the query and transformation languages XPath, 
XQuery, and XSLT. The course includes relational design principles based on dependencies and normal 
forms. Additional database topics introduced are indexes, views, transactions, authorization, integrity 
constraints, triggers, on-line analytical processing (OLAP), and emerging NoSQL (Not only SQL) 
databases for cloud and desktop computing.


## Outcomes
1. Create and assure the quality of a suitable data model for a given application.
2. Use normalization to transform a relational schema into a set of normalized relations (3NF).
3. Use SQL for database creation, manipulation and control.
4. Employ data storage and indexing options and perform query optimization.
5. Perform basic database administration tasks.
6. Employ XML technologies to query, manipulate and transform data.
7. Develop NoSQL desktop and cloud database solutions.

# Basic Commands
to list data in a table:
```
SELECT * FROM table_name;
```

updating a table entry:
```
UPDATE table_name SET field='value' WHERE attribute='value';
```

# Starting a MySQL Instance
Per instructions on [mysql's docker page](https://hub.docker.com/_/mysql), we will be making a docker compose file with the following recommended settings. This will be done on a Linux based OS:

```
version: '3.1'

services:

  db:
    image: mysql
    # NOTE: use of "mysql_native_password" is not recommended: https://dev.mysql.com/doc/refman/8.0/en/upgrading-from-previous-series.html#upgrade-caching-sha2-password
    # (this is just an example, not intended to be a production configuration)
    command: --default-authentication-plugin=sha256_password
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: ${ROOT_PWD}

  adminer:
    image: adminer
    restart: always
    ports:
      - 8080:8080
```
Since `mysql_native_password` is not recommended as the field value for `--default-authentication-plugin`, so we will use one of the recommended values, `sha256_password`. Our root password will be stored in an environment variable called `${ROOT_PWD}`, located in your `.env` or environment section of your container manager and will be used to log into mysql.

Now we can build it using `docker compose up -d` from the CLI or start it up using your container manager.

To confirm startup, we can check via `docker logs my-container-name`, or using `docker ps`, check that the container is running. You will need to run it using `sudo` if you haven't added docker to your user group.

![Check Running](/rover/img/MySQL/checkMySQLInstall.png)

Now lets log into the MySQL database. we can access the container shell using: 

```docker exec -it my-sql-db-1 bash```

Now we will log into the MySQL database as root by typing:

```mysql -uroot -p```

![Connecting to MySQL](/rover/img/MySQL/dockerConnectingMySQL.png)

# Entity Relationship (ER) Model
- Element Types:
  - Entity and Entity Sets (Rectangle)
    - similar entities == entity set
  - Attributes (Ovals): qualitative descriptors
  - Relationships (Diamonds)
    - represented by keys for entity instance
    - binary (2), tertiary(3) relationship
    - symbols
      - "$\circ$" indicates optional (0 instances of relationships between entities)
      - "$|$" means mandatory
      - "$||$" means cardinality (measure of the number of elements of a set)
      - "$\triangleleft$"+"$+$" crows foot indicates many relationships (imagine $\in$ but with straight lines)
$$
Attributes \in Entity
\\\ 
$$
  - $R:E\rArr F$ = Each $E$ to at most one member of $F$, is **"many to one"**
  - **"one-one"** is equivalent to bijection of the above relation
  - **"many-many"** is not "many to one" bijectively

## ER Diagram Example
![ER Diagram](/rover/img/MySQL/ERDiagram.png)
- Entities: CEO, Engineer, Manager, Customer, Product
  - Attributes:
    - CEO: `salary, first_name, last_name, org_id, email`
    - Engineer: `avg_salary, first_name, last_name, org_id, email`
    - Manager: `avg_salary, first_name, last_name, org_id, department`
    - Customer: `customer_id, payment_info, session_id, discount_id, transaction_id`
    - Product: `product_id, quantity, category, display_name, availability`

# Populating a Database
## Creating Tables
The following is an ER Diagram for the database we will be creating:

![ER Diagram](/rover/img/MySQL/ERDiagramStudentDB.png)

These are the following commands we will use to create our table for `user`, `student`, `instructor`, and `courses`:
```
create table user(user_id int primary key, first_name varchar(100), last_name varchar(100), email_addr varchar(100), phone_num enum('home','office','mobile'));
```

```
create table student(user_id int primary key, first_name varchar(100), last_name varchar(100), email_addr varchar(100), phone_num enum('home','office','mobile'),major varchar(100));
```

```
create table instructor(user_id int primary key, first_name varchar(100), last_name varchar(100), email_addr varchar(100), phone_num enum('home','office','mobile'), title enum('Full Professor','Reader','Instructor'));
```

```
create table courses(course_num int, dept varchar(100), title varchar(1000), level 
enum('undergraduate','graduate','research'), primary key(course_num,department));
```

we can confirm with `describe table_name;`, like `describe user;`:

![example 'describe'](/rover/img/MySQL/describeUser.png)

we can see, the `create table user --` command created the corresponding fields and data types.

Now, let's check what tables we have so far using `show tables;`:
![show table](/rover/img/MySQL/showTablesStudentDB.png)

Let's make some more tables. One for `class`, `assignments`, and `posts`:
```
create table class(class_num int primary key, start_date date, end_date date, max_students int, term varchar(100), year int, grade double);
```
```
create table assignments(assignment_id int primary key, name varchar(100), deadline datetime, grade double);
```
```
create table posts(post_id int primary key, kind text, posting_time datetime, topics text, context text, popularity_rating double);
```
![create all tables](/rover/img/MySQL/createTableFullCreate.png)

### **IMPORTANT**
Now, how do we create relationships while creating tables? Well, we can input commands via:
```
CREATE TABLE accounts(
    account_id INT NOT NULL AUTO_INCREMENT,
    customer_id INT( 4 ) NOT NULL ,
    account_type ENUM( 'savings', 'credit' ) NOT NULL,
    balance FLOAT( 9 ) NOT NULL,
    PRIMARY KEY ( account_id ), 
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) 
) ENGINE=INNODB;
```
### Additional commands:
remove a column like `level` in `courses`:

```mysql> alter table courses drop column level;```

- `alter table`: lets you `add` or `drop` columns

## Creating Relationships
We will now create relationships. We will have to use `ALTER TABLE` commands to set up relationships for our existing tables, like so:
```
ALTER TABLE `table1` ADD CONSTRAINT table1_id_refs FOREIGN KEY (`table2_id`) REFERENCES `table2` (`id`);
```
Referenced from the [documentation (MySQL 8.0 Reference Manual)](https://dev.mysql.com/doc/):
>The `FOREIGN KEY` and `REFERENCES` clauses are supported by the InnoDB and NDB storage engines, which implement `ADD [CONSTRAINT [symbol]] FOREIGN KEY [index_name] (...) REFERENCES ... (...)`. See Section 13.1.20.5, “FOREIGN KEY Constraints”. For other storage engines, the clauses are parsed but ignored.
>
>For `ALTER TABLE`, unlike `CREATE TABLE`, `ADD FOREIGN KEY` ignores `index_name` if given and uses an automatically generated foreign key name. As a workaround, include the `CONSTRAINT` clause to specify the foreign key name:
>
>```ADD CONSTRAINT name FOREIGN KEY (....) ...```

An example of usage from older docs:
>```
>ALTER TABLE tbl_name
>    ADD [CONSTRAINT [symbol]] FOREIGN KEY
>    [index_name] (index_col_name, ...)
>    REFERENCES tbl_name (index_col_name,...)
>    [ON DELETE reference_option]
>    [ON UPDATE reference_option
>```
- `FOREIGN KEY`: one or more columns in a table that refer to a primary key in another table.

> **Important**
> 
> MySQL silently ignores inline `REFERENCES` specifications, where the references are defined as part of the column specification. MySQL accepts only `REFERENCES` clauses defined as part of a separate `FOREIGN KEY` specification.
>
> **Note**
> 
> Partitioned InnoDB tables do not support foreign keys. This restriction does not apply to NDB tables, including those explicitly partitioned by [LINEAR] KEY. For more information, see Section 24.6.2, “Partitioning Limitations Relating to Storage Engines”.

With that out of the way, let's begin:
```
ALTER TABLE user ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES student (user_id);

ALTER TABLE user ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES instructor (user_id);

ALTER TABLE user ADD CONSTRAINT user_id FOREIGN KEY (post_id) REFERENCES posts (post_id);

ALTER TABLE student ADD CONSTRAINT user_id FOREIGN KEY (assignment_id) REFERENCES assignments (assignment_id);

ALTER TABLE student ADD CONSTRAINT user_id FOREIGN KEY (class_num) REFERENCES class (class_num);

ALTER TABLE instructor ADD CONSTRAINT user_id FOREIGN KEY (class_num) REFERENCES class (class_num);

ALTER TABLE courses ADD CONSTRAINT department FOREIGN KEY (class_num) REFERENCES class (class_num);

ALTER TABLE courses ADD CONSTRAINT course_num FOREIGN KEY (class_num) REFERENCES class (class_num);

ALTER TABLE class ADD CONSTRAINT class_num FOREIGN KEY (assignment_id) REFERENCES assignments (assignment_id);

```


# Scripts
We will be loading a script into our docker container. SSH into the server and create a file that will house our script. 

```
touch myscript.sql
nano myscript.sql
docker cp myscript.sql container_id:/{directory}/myscript.sql
```
Now, it should copy the file straight into the root directory or inside `{directory}` in your root directory. The full workings of this command is:
```
docker cp {myfile.ext} {container name}:/{directory}/{myfileout.ext}
```
To run the script, we use `source` and set the path in mySQL.
```
source /{directory/{script.sql}
```

# Creating a DB from Scratch
create a database "mysqldev":
```
create database mysqldev;
use mysqldev;
```
create table and specify InnoDB engine:
```
create table ADDRESS(ADDRESS_ID INT, ADDRESS_LINE1 VARCHAR(100), ADDRESS_LINE2 VARCHAR(100), CITY VARCHAR(100), STATE_CD VARCHAR(2), PRIMARY KEY (ADDRESS_ID)) ENGINE=INNODB;
```
confirm table is made to specification:
```
show tables;
describe ADDRESS;
```

create an "ORDER" table. Because order is a keyword, we must use backticks:
```
create table `ORDER`(ORDER_ID INT, PRODUCT_CODE VARCHAR(100), PRODUCT_DESCRIPTION VARCHAR(100), TRANSACTION_DATE DATE, PRIMARY KEY (ORDER_ID)) ENGINE=INNODB;
```

create a "CUSTOMER" table:
```
create table CUSTOMER(CUSTOMER_ID INT, FIRST_NAME VARCHAR(100), LAST_NAME VARCHAR(100), EMAIL VARCHAR(100), PHONE VARCHAR(100), DATE_PURCHASED DATE, ADDRESS_ID INT, ORDER_ID INT, PRIMARY KEY (CUSTOMER_ID)) ENGINE=INNODB;
```

create foreign key on `ADDRESS_ID` referring to `ADDRESS TABLE`, and a foreign key on `ORDER_ID` referring to `ORDER TABLE`, as well as a unique constraint on `EMAIL` column. 

We've already added primary keys, but can do it again as a learning experience in addition to adding foreign keys and unique constraints:
```
ALTER TABLE CUSTOMER ADD CONSTRAINT FK_ADDRESS_ID FOREIGN KEY (ADDRESS_ID) REFERENCES ADDRESS(ADDRESS_ID);

ALTER TABLE CUSTOMER ADD CONSTRAINT FK_ORDER_ID FOREIGN KEY (ORDER_ID) REFERENCES `ORDER`(ORDER_ID);

// don't need to do this!
ALTER TABLE ADDRESS ADD CONSTRAINT PK_ADDRESS_ID PRIMARY KEY(ADDRESS_ID);

// don't need to do this!
ALTER TABLE CUSTOMER ADD CONSTRAINT PK_CUSTOMER_ID PRIMARY KEY(CUSTOMER_ID);

// don't need to do this!
ALTER TABLE `ORDER` ADD CONSTRAINT PK_ORDER_ID PRIMARY KEY(ORDER_ID);

ALTER TABLE CUSTOMER ADD CONSTRAINT EMAIL_UNIQUE UNIQUE (EMAIL);
```

# SQL Query Clauses
```
SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY
```

# Working with a DB (Assignment 6)
Using a database. For example `studentdb` which has tables `STUDENT`, `grade_event`, and `score`.

### Displaying COUNT of rows
Perhaps we want to know how many rows exist in each table. We can obtain this via `COUNT()` which counts the number of rows:
```
mysql> SELECT COUNT(*) FROM STUDENT;
+----------+
| COUNT(*) |
+----------+
|       31 |
+----------+

```
we can display the `COUNT` of all rows similarly:
```
mysql> SELECT COUNT(*) FROM grade_event;
+----------+
| COUNT(*) |
+----------+
|        6 |
+----------+

mysql> SELECT COUNT(*) FROM score;
+----------+
| COUNT(*) |
+----------+
|      173 |
+----------+
```
### Insert New 'Student'
To insert a new row into a table, for example, `STUDENT`:
```
INSERT INTO STUDENT VALUES ('JOESCHMO', 'M', '12345666');
```
Here we insert a new row with the indicated values above. It's important that the datatype are correspondingly matched.

Now we can check if the row updated correctly by recounting the rows present in table `STUDENT`:
```
mysql> SELECT COUNT(*) FROM STUDENT;
+----------+
| COUNT(*) |
+----------+
|       32 |
+----------+
```

Now, what if we wanted to update the `score` table with an event for our new "student" using the previous `INSERT` command?

### Inserting SCORE for STUDENT_ID into table
```
mysql> INSERT INTO score VALUES (12345666, 10, 70);
```
we get:
```

ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`studentdb`.`score`, CONSTRAINT `score_ibfk_1` FOREIGN KEY (`EVENT_ID`) REFERENCES `grade_event` (`EVENT_ID`))
```
Oh no! We can recall from: 
```
mysql> describe score;
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| STUDENT_ID | int unsigned | NO   | PRI | NULL    |       |
| EVENT_ID   | int unsigned | NO   | PRI | NULL    |       |
| SCORE      | int          | NO   |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
```
`EVENT_ID` has a foreign key constraint such that `EVENT_ID` from score references the parent table `grade_event`'s `EVENT_ID`.

Thus, we can populate the parent table with dummy data and push our insert command to `score` 

```
mysql> INSERT INTO grade_event VALUES ('2012-10-02', 'Q', 10);
Query OK, 1 row affected (0.01 sec)
```
and then successfully insert data:
```
mysql> INSERT INTO score VALUES (12345666, 10, 70);
Query OK, 1 row affected (0.01 sec)
```

### Finding COUNT of "groups" of an "attribute" 

The command below finds the count of each group in EVENT_ID. In this case, we are finding the count of each `EVENT_ID` in the `score` table:
```
mysql> SELECT EVENT_ID, COUNT(*) FROM score GROUP BY EVENT_ID;
+----------+----------+
| EVENT_ID | COUNT(*) |
+----------+----------+
|        1 |       29 |
|        2 |       30 |
|        3 |       31 |
|        4 |       27 |
|        5 |       27 |
|        6 |       29 |
|       10 |        1 |
+----------+----------+
7 rows in set (0.00 sec)
```

and finding it by `STUDENT_ID`:
```
mysql> SELECT STUDENT_ID, COUNT(*) FROM score GROUP BY STUDENT_ID;
+------------+----------+
| STUDENT_ID | COUNT(*) |
+------------+----------+
|          1 |        5 |
|          2 |        5 |
|          3 |        6 |
... // removed for readability
|         30 |        5 |
|         31 |        6 |
|   12345666 |        1 |
+------------+----------+
32 rows in set (0.00 sec)
```
### Displaying Query by Value
Let's find the student who has the maximum score, minimum score, and their respective student names.

```
SELECT 
  STUDENT.name, score.SCORE 
  FROM STUDENT INNER JOIN score 
  ON STUDENT.STUDENT_ID = STUDENT.STUDENT_ID 
    WHERE score.SCORE = (SELECT MIN(SCORE) FROM score);

```

# Database Triggers
A history of edits made to tables in a database. 

A database trigger is a special type of stored program that automatically executes in response to certain events or actions occurring within a database. These events can include things like the insertion, update or deletion of data in a particular table or database.

Triggers in MySQL are written using SQL statements and are associated with a specific table or database. When the specified event occurs, the trigger's code is executed, allowing you to perform a variety of actions such as logging changes, enforcing data integrity rules, or updating related tables.

example:
```
CREATE TRIGGER log_changes AFTER INSERT ON mytable
FOR EACH ROW
BEGIN
  INSERT INTO log_table (user, action, timestamp) 
  VALUES (USER(), 'INSERT', NOW());
END;
```
Database triggers are a subset of **stored programs**.

## Stored Programs
| Type | Description |
|:----------:|:----------:|
| Stored procedure | Can be called from an appljcation that has access to the database| 
| Stored function | Can be called from a SQL statement. A stored function works much like the functions provided by MySQL that are described in chapter 9. |
| Trigger | Is executed in response to an INSERT, UPDATE, or DELETE statement on a specified table. |
| Event | ls executed at a scbeduled time. |

# Midterm DB (3)
```
CREATE DATABASE MIDTERM;

USE MIDTERM;

CREATE TABLE COUNTRIES(
  COUNTRY_ID CHAR(2) NOT NULL, 
  COUNTRY_NAME varchar (40), 
  REGION_ID INT);

ALTER TABLE COUNTRIES ADD PRIMARY KEY (COUNTRY_ID);

CREATE TABLE DEPARTMENTS( 
  DEPARTMENT_ID INT(4) NOT NULL, 
  DEPARTMENT_NAME varchar(30) NOT NULL, 
  MANAGER_ID INT(6), 
  LOCATION_ID INT(4));

CREATE INDEX DEPT_LOCATION_IX ON DEPARTMENTS (LOCATION_ID);

ALTER TABLE DEPARTMENTS ADD PRIMARY KEY (DEPARTMENT_ID);

CREATE TABLE EMPLOYEES(
  EMPLOYEE_ID INT(6) NOT NULL, 
  FIRST_NAME varchar(20), 
  LAST_NAME varchar(25) NOT NULL, 
  EMAIL varchar(25) NOT NULL, 
  PHONE_NUMBER varchar (20), 
  HIRE_DATE DATE NOT NULL, 
  JOB_ID varchar(10) NOT NULL, 
  SALARY DOUBLE(8,2), 
  COMMISSION_PCT DOUBLE(2,2), 
  MANAGER_ID INT(6), 
  DEPARTMENT_ID INT(4));

CREATE INDEX EMP_DEPARTMENT_IX ON EMPLOYEES (DEPARTMENT_ID);

CREATE INDEX EMP_NAME_IX ON EMPLOYEES (LAST_NAME ASC, FIRST_NAME ASC);

CREATE INDEX EMP_JOB_IX ON EMPLOYEES (JOB_ID ASC);

CREATE TABLE JOBS(
  JOB_ID varchar(10) NOT NULL, 
  JOB_TITLE varchar (35) NOT NULL, 
  MIN_SALARY INT(6), 
  MAX_SALARY INT(6));

ALTER TABLE JOBS ADD CONSTRAINT JOB_ID_PK PRIMARY KEY (JOB_ID);

CREATE TABLE JOB_HISTORY( 
  EMPLOYEE_ID INT(6) NOT NULL, 
  START_DATE DATE NOT NULL, 
  END_DATE DATE NOT NULL, 
  JOB_ID varchar(10) NOT NULL, 
  DEPARTMENT_ID INT(4));

CREATE TABLE LOCATIONS(
  LOCATION_ID INT(4) NOT NULL, 
  STREET_ADDRESS varchar(40), 
  POSTAL_CODE varchar(12), 
  CITY varchar(30) NOT NULL, 
  STATE_PROVINCE varchar(25), 
  COUNTRY_ID CHAR(2)); 

CREATE INDEX LOC_CITY_IX ON LOCATIONS (CITY);

ALTER TABLE LOCATIONS ADD CONSTRAINT LOC_ID_PK PRIMARY KEY (LOCATION_ID);
```
2.

```
CREATE TABLE STUDENT_AUDIT (
  name varchar(20),
  GENDER enum('F','M'),
  STUDENT_ID INT unsigned,
  CREATE_DATE DATE,
  ACTION_TYPE varchar(10),
  USER varchar(20));

DELIMITER //
CREATE TRIGGER insert_trigger
AFTER INSERT ON STUDENT
FOR EACH ROW
BEGIN
  INSERT INTO STUDENT_AUDIT (name, GENDER, STUDENT_ID, CREATE_DATE, ACTION_TYPE, USER)
  VALUES (NEW.name, new.GENDER, new.STUDENT_ID, NOW(), 'INSERTED', USER());
END //

DELIMITER //
CREATE TRIGGER delete_trigger
AFTER DELETE ON STUDENT
FOR EACH ROW
BEGIN
  INSERT INTO STUDENT_AUDIT (name, GENDER, STUDENT_ID, CREATE_DATE, ACTION_TYPE, USER)
  VALUES (OLD.name, OLD.GENDER, OLD.STUDENT_ID, NOW(), 'DELETED', USER());
END //

DELIMITER //
CREATE TRIGGER update_trigger
AFTER UPDATE ON STUDENT
FOR EACH ROW
BEGIN
  INSERT INTO STUDENT_AUDIT (name, GENDER, STUDENT_ID, CREATE_DATE, ACTION_TYPE, USER)
  VALUES (NEW.name, new.GENDER, new.STUDENT_ID, NOW(), 'UPDATED', USER());
END //


INSERT INTO STUDENT(name, GENDER, STUDENT_ID) VALUES('test1', 'M', '111');

UPDATE STUDENT SET name='test22' WHERE name='test1';

DELETE FROM STUDENT WHERE name='test22';
```

# Database Transactions
Transactions in MySQL are used to ensure data integrity and consistency. They provide a way to guarantee that multiple operations on the database are completed successfully or not at all, even if the database is accessed by multiple users concurrently.

A transaction typically consists of four main operations, known as the ACID properties:

| ACID Type | Property Description |
|:----------:|:----------:|
|Atomicity| This property ensures that either all the operations within the transaction are completed successfully, or none of them are completed at all.|
|Consistency| This property ensures that the database remains in a valid state before and after the transaction. It guarantees that all constraints, such as referential integrity and data type constraints, are satisfied.|
|Isolation| This property ensures that the effects of one transaction are not visible to another transaction until it is completed.|
|Durability| This property ensures that the results of a completed transaction are permanent and can survive system failures, such as power outages or crashes.|

### Lab
For this lab, we will do the following:

1. Use STUDENTDB database to work on the tables.

2. In this exercise, you will first open 2 sessions by connecting to mysql database. One session is used to either insert, update, delete data from the tables. The second session is used to check the data.

3. You should first turn OFF autocommit option. Please see class video to turn off autocommit.

4. From the first session, insert a new student into STUDENT table. Check from 2nd session if student was inserted or not. If it is not inserted, write a reason and if it is inserted take a screenshot.

5. From the first session, update data into SCORE table by updating score for student_id=10 and event_id=5 to a new value. Check the score from 2nd session to see if it is inserted or not. Take a screenshot. Go back to 1st session and COMMIT the data and check the data in the 2nd session.

6. From the 1st session, delete from SCORE table where student_id=20 and event_id=5. Check if the data is deleted or not from 2nd session. Take a screenshot. Go back now to 1st session and perform ROLLBACK. Now check the data from both 1st and 2nd session. Take a screenshot.

```
SET autocommit = 0; --set autocommit option OFF

INSERT INTO student
```
