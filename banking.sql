-- =========================================
-- BANKING DOMAIN PROJECT (MULTIPLE TABLES)
-- =========================================

-- =========================================
-- 1. CUSTOMER TABLE
-- =========================================
create database banking
use banking
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Gender VARCHAR(10),
    Age INT,
    City VARCHAR(50),
    State VARCHAR(50),
    AccountType VARCHAR(20),
    CreditScore INT
);

INSERT INTO Customers VALUES
(101,'Aman','Male',25,'Mumbai','Maharashtra','Savings',750),
(102,'Riya','Female',28,'Pune','Maharashtra','Current',720),
(103,'Rahul','Male',35,'Delhi','Delhi','Savings',680),
(104,'Sneha','Female',30,'Jaipur','Rajasthan','Savings',710),
(105,'Karan','Male',40,'Lucknow','UP','Current',790);



-- =========================================
-- 2. BRANCH TABLE
-- =========================================

CREATE TABLE Branches (
    BranchID INT PRIMARY KEY,
    BranchName VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50)
);

INSERT INTO Branches VALUES
(1,'Branch A','Mumbai','Maharashtra'),
(2,'Branch B','Pune','Maharashtra'),
(3,'Branch C','Delhi','Delhi'),
(4,'Branch D','Jaipur','Rajasthan'),
(5,'Branch E','Lucknow','UP');



-- =========================================
-- 3. TRANSACTIONS TABLE
-- =========================================

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    CustomerID INT,
    BranchID INT,
    TransactionType VARCHAR(20),
    TransactionDate DATE,
    Amount DECIMAL(10,2),
    Status VARCHAR(20),

    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID)
);

INSERT INTO Transactions VALUES
(1001,101,1,'Credit','2024-01-01',5000,'Completed'),
(1002,102,2,'Debit','2024-01-02',3000,'Completed'),
(1003,103,3,'Credit','2024-01-03',7000,'Pending'),
(1004,104,4,'Debit','2024-01-04',2500,'Completed'),
(1005,105,5,'Credit','2024-01-05',8000,'Completed');



-- =========================================
-- 4. LOANS TABLE
-- =========================================

CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    CustomerID INT,
    LoanType VARCHAR(30),
    LoanAmount DECIMAL(12,2),
    InterestRate DECIMAL(5,2),
    LoanStatus VARCHAR(20),

    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Loans VALUES
(201,101,'Home Loan',1500000,8.5,'Approved'),
(202,102,'Car Loan',500000,9.0,'Pending'),
(203,103,'Personal Loan',300000,11.5,'Rejected'),
(204,104,'Education Loan',400000,7.5,'Approved'),
(205,105,'Business Loan',2500000,10.0,'Approved');



-- =========================================
-- 5. CARDS TABLE
-- =========================================

CREATE TABLE Cards (
    CardID INT PRIMARY KEY,
    CustomerID INT,
    CardType VARCHAR(20),
    CardLimitAmount DECIMAL(10,2),
    CardStatus VARCHAR(20),

    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Cards VALUES
(301,101,'Credit Card',100000,'Active'),
(302,102,'Debit Card',50000,'Active'),
(303,103,'Credit Card',150000,'Blocked'),
(304,104,'Debit Card',40000,'Active'),
(305,105,'Credit Card',200000,'Active');


select name from sys.tables
--=========================================
select * from Customers
select * from Branches
select * from Transactions
select * from Loans
select * from Cards

--=======================================
---total amount by status
select SUM(amount),Status from Transactions
group by Status