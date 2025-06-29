CREATE DATABASE alx_book_store;
USE alx_book_store;


CREATE TABLE IF NOT EXISTS Books(
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(130) NOT NULL,
    author_id VARCHAR(255) NOT NULL,
    price DOUBLE,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
)

CREATE TABLE IF NOT EXISTS Authors(
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    author_name VARCHAR(215) NOT NULL
)

CREATE TABLE IF NOT EXISTS Customers(
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL,
    address TEXT
)

CREATE TABLE IF NOT EXISTS Orders(
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
)

CREATE TABLE IF NOT EXISTS Order_Details(
    orderdetailid INT PRIMARY KEY AUTO_INCREMENT,
    quantity DOUBLE,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
)