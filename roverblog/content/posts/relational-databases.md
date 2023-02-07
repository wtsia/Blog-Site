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
# Relational Databases: MySQL
An introduction to the relational model, relational algebra, and SQL. Also covers XML data including DTDs
and XML Schema for validation, and an introduction to the query and transformation languages XPath, 
XQuery, and XSLT. The course includes relational design principles based on dependencies and normal 
forms. Additional database topics introduced are indexes, views, transactions, authorization, integrity 
constraints, triggers, on-line analytical processing (OLAP), and emerging NoSQL (Not only SQL) 
databases for cloud and desktop computing.

Book: murach's MySQL (3rd Edition, 2019)

## Outcomes
1. Create and assure the quality of a suitable data model for a given application.
2. Use normalization to transform a relational schema into a set of normalized relations (3NF).
3. Use SQL for database creation, manipulation and control.
4. Employ data storage and indexing options and perform query optimization.
5. Perform basic database administration tasks.
6. Employ XML technologies to query, manipulate and transform data.
7. Develop NoSQL desktop and cloud database solutions.

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
docker cp myscript.sql container_id:/<my directory>/myscript.sql
```
Now, it should copy the file straight into the root directory or inside `<my directory>` in your root directory. We can do this via:
```
docker cp myfile.ext <container name>:/<my directory>/myfileout.ext
```
To run the script, we use the path into the MySQL db.
```

```

# Creating a DB from Scratch
create a database "mysqldev":
```
create database mysqldev;
use mysqldev;
```
create table and specify InnoDB engine:
```
create table ADDRESS(ADDRESS_ID INT, ADDRESS_LINE1 VARCHAR(100), ADDRESS_LINE2 VARCHAR(100), CITY VARCHAR(100), STATE_CD VARCHAR(2)) ENGINE=INNODB;
```
confirm table is made to specification:
```
show table;
show ADDRESS;
```