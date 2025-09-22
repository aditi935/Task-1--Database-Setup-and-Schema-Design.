CREATE DATABASE library;

USE library;


CREATE TABLE authors (
    authorid INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(50)
);

CREATE TABLE books (
    bookid INT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    genre VARCHAR(50),
    publishedyear INT,
    authorid INT,
    FOREIGN KEY (authorid) REFERENCES authors(authorid)
);

CREATE TABLE librarians (
    librarianid INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    hiredate DATE
);

CREATE TABLE members (
    memberid INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    joindate DATE
);

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
