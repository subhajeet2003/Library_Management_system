-- Library Management System Project 2

-- creating the database
CREATE DATABASE libraray_management_system;

USE libraray_management_system;

-- creating branch table
CREATE TABLE branch (
		branch_id VARCHAR(10) PRIMARY KEY,	
        manager_id VARCHAR(10),  -- FK
        branch_address VARCHAR(30),	
        contact_no VARCHAR(50)
);

-- creating employees table
CREATE TABLE employees (
		emp_id	VARCHAR(10) PRIMARY KEY,
        emp_name VARCHAR(30),
        position VARCHAR(30),
        salary  INT,
        branch_id VARCHAR(10)   -- FK
);

-- creating books table
CREATE TABLE books (
		isbn VARCHAR(20) PRIMARY KEY,
        book_title	VARCHAR(50),
        category  VARCHAR(20),
        rental_price FLOAT,
        status	VARCHAR(10),
        author	VARCHAR(30),
        publisher  VARCHAR(50)
);

ALTER TABLE books
MODIFY book_title varchar(100);

-- creating members table
CREATE TABLE members (
		member_id VARCHAR(10) PRIMARY KEY,
        member_name	VARCHAR(25),
        member_address	VARCHAR(50),
        reg_date DATE 
);

-- creating issued status table
CREATE TABLE issued_status (
		issued_id VARCHAR(10) PRIMARY KEY,
        issued_member_id  VARCHAR(10),     -- FK
        issued_book_name  VARCHAR(75),
        issued_date	 DATE,
        issued_book_isbn  VARCHAR(25),    -- FK
        issued_emp_id VARCHAR(10)      -- FK
);

-- creating returned status table
CREATE TABLE returned_status (
		return_id  VARCHAR(10) PRIMARY KEY,
        issued_id  VARCHAR(10),     -- FK
        return_book_name  VARCHAR(50),
        return_date	 DATE,
        return_book_isbn VARCHAR(10)   -- FK
);


-- ADDING FOREIGN KEY
ALTER TABLE issued_status
ADD CONSTRAINT fk_members
FOREIGN KEY (issued_member_id)
REFERENCES members(member_id);

ALTER TABLE issued_status
ADD CONSTRAINT fk_books
FOREIGN KEY (issued_book_isbn)
REFERENCES books(isbn);

ALTER TABLE issued_status
ADD CONSTRAINT fk_employees
FOREIGN KEY (issued_emp_id)
REFERENCES employees(emp_id);

ALTER TABLE employees
ADD CONSTRAINT fk_branch
FOREIGN KEY (branch_id)
REFERENCES branch(branch_id);

ALTER TABLE returned_status
ADD CONSTRAINT fk_issued_status
FOREIGN KEY (issued_id)
REFERENCES issued_status(issued_id);

ALTER TABLE returned_status
ADD CONSTRAINT fk_isbn
FOREIGN KEY (isbn)
REFERENCES books(isbn);

select * from returned_status;
truncate returned_status;