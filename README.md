# 📚 Library Management Database

## 📌 Project Overview
This project contains the schema for a **Library Management System**.  
It includes tables for **authors, books, librarians, members, and borrow records**.  
The design applies **normalization principles** to reduce redundancy and ensure **data integrity**.  

---

## ⚙️ Database Setup
```sql
CREATE DATABASE library;
USE library;
📂 Tables
1. Authors Table
sql
Copy code
CREATE TABLE authors (
    authorid INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(50)
);
Primary Key: authorid → uniquely identifies each author

Purpose: Stores author details (name, country)

Normalization:

1NF: Atomic values

2NF: All non-key attributes depend on primary key

3NF: No transitive dependency

2. Books Table
sql
Copy code
CREATE TABLE books (
    bookid INT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    genre VARCHAR(50),
    publishedyear INT,
    authorid INT,
    FOREIGN KEY (authorid) REFERENCES authors(authorid)
);
Primary Key: bookid → uniquely identifies each book

Foreign Key: authorid → references authors(authorid)

Purpose: Stores book details (title, genre, published year, author)

Normalization:

1NF, 2NF, 3NF applied

3. Librarians Table
sql
Copy code
CREATE TABLE librarians (
    librarianid INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    hiredate DATE
);
Primary Key: librarianid → uniquely identifies each librarian

Unique Key: email → ensures no duplicate emails

Purpose: Stores librarian details (name, email, hire date)

Normalization:

1NF, 2NF, 3NF applied

4. Members Table
sql
Copy code
CREATE TABLE members (
    memberid INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    joindate DATE
);
Primary Key: memberid → uniquely identifies each member

Unique Key: email → ensures no duplicate emails

Purpose: Stores member details (name, email, phone, join date)

Normalization:

1NF, 2NF, 3NF applied

5. Borrow Table
sql
Copy code
CREATE TABLE borrow (
    borrowid INT PRIMARY KEY,
    memberid INT,
    bookid INT,
    librarianid INT,
    borrowdate DATE,
    returndate DATE,
    FOREIGN KEY (memberid) REFERENCES members(memberid),
    FOREIGN KEY (bookid) REFERENCES books(bookid),
    FOREIGN KEY (librarianid) REFERENCES librarians(librarianid)
);
Primary Key: borrowid → uniquely identifies each borrow record

Foreign Keys:

memberid → references members(memberid)

bookid → references books(bookid)

librarianid → references librarians(librarianid)

Purpose: Tracks book borrowings and returns

Normalization:

1NF, 2NF, 3NF applied

🔗 Entity-Relationship Diagram (ERD)
Relationships:

authors ↔ books → One-to-many (an author can write multiple books)

members ↔ borrow → One-to-many (a member can borrow multiple books)

books ↔ borrow → One-to-many (a book can be borrowed multiple times)

librarians ↔ borrow → One-to-many (a librarian processes multiple borrow records)

✅ Normalization Summary
1NF: All tables have atomic columns and unique primary keys

2NF: All non-key attributes depend fully on their primary key

3NF: No transitive dependencies; foreign keys manage relationships

