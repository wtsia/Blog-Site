+++
author = "Winston Tsia"
authorlink = ""
title = "Relational Databases"
date = 2023-01-17T19:29:32-08:00
description = "Description"
tags = [
    "tag1",
    "tag2",
]
categories = [
    "cat1",
    "cat2",
]
math = true
notaxonomy = false
images = ["/img/<folder>/example.jpg"]
imagetext = "An example text for an image you could add!"
hidden = true
norobots = true
nodate = true
hidemeta = false
+++

# Relational Databases: MySQL
An introduction to the relational model, relational algebra, and SQL. Also covers XML data including DTDs
and XML Schema for validation, and an introduction to the query and transformation languages XPath, 
XQuery, and XSLT. The course includes relational design principles based on dependencies and normal 
forms. Additional database topics introduced are indexes, views, transactions, authorization, integrity 
constraints, triggers, on-line analytical processing (OLAP), and emerging NoSQL (Not only SQL) 
databases for cloud and desktop computing.

Book: murach's MySQL (3rd Edition, 2019)

## Outcomes:
1. Create and assure the quality of a suitable data model for a given application.
2. Use normalization to transform a relational schema into a set of normalized relations (3NF).
3. Use SQL for database creation, manipulation and control.
4. Employ data storage and indexing options and perform query optimization.
5. Perform basic database administration tasks.
6. Employ XML technologies to query, manipulate and transform data.
7. Develop NoSQL desktop and cloud database solutions.

# Contents
[Building MySQL](#building-mysql)

# Building MySQL
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

We will also need MySQL Client Package's `mysql-client`, so we can run:

```sudo apt-get install mysql-client```

Now we can run it using `docker compose up -d` from the CLI or start it up using your container manager.

To confirm startup, we can check via `docker logs my-container-name`, or using `docker ps`, check that the container is running. You will need to run it using `sudo` if you haven't added docker to your user group.

![Check Running](/rover/img/MySQL/checkMySQLInstall.png)

Now lets log into the MySQL database. we can interact with a terminal in the container using: 

```docker exec -it my-sql-db-1 bash```

Now we will open a client to interface with the MySQL database. type:

```mysql -uroot -p```

![Connecting to MySQL](/rover/img/MySQL/dockerConnectingMySQL.png)

## ER Model