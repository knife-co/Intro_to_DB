-- Write a script that creates all the tables below in alx_book_store in your MySQL server.

-- Tables

-- For each table/relation below, you can find the attributes in task 0
-- books
-- authors
-- customers
-- orders
-- order details
-- Name of the file should be task_2.sql

-- All SQL keywords should be in uppercase

import mysql.connector

try: 

    connection = mysql.connector.connect(
            host="localhost",
            user="alx_user",
            password="alx_password",
            database="alx_book_store"
        )

    if connection.is_connected():
        cursor = connection.cursor()
 
        cursor.execute("""
        CREATE TABLE IF NOT EXISTS Books(
            book_id INT PRIMARY KEY AUTO_INCREMENT,
            title VARCHAR(130) NOT NULL,
            author_id VARCHAR(255) NOT NULL,
            price DOUBLE,
            publication_date DATE,
            FOREIGN KEY (author_id) REFERENCES Authors(author_id)
        )
        """)

        cursor.execute("""
        CREATE TABLE IF NOT EXISTS Authors(
            author_id INT PRIMARY KEY AUTO_INCREMENT,
            author_name VARCHAR(215) NOT NULL
        )
        """)

        cursor.execute("""
        CREATE TABLE IF NOT EXISTS Customers(
            customer_id INT PRIMARY KEY AUTO_INCREMENT,
            customer_name VARCHAR(215) NOT NULL,
            email VARCHAR(215) NOT NULL,
            address TEXT
        )
        """)

        cursor.execute("""
        CREATE TABLE IF NOT EXISTS Orders(
            order_id INT PRIMARY KEY AUTO_INCREMENT,
            order_date DATE,
            FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
        )
        """)

        cursor.execute("""
        CREATE TABLE IF NOT EXISTS Order_Details(
            orderdetailid INT PRIMARY KEY AUTO_INCREMENT,
            quantity DOUBLE,
            FOREIGN KEY (order_id) REFERENCES Orders(order_id),
            FOREIGN KEY (book_id) REFERENCES Books(book_id)
        )
        """)

        print("All tables created successfully in 'alx_book_store'!")

except mysql.connector.Error as e:
    print(f"Error: {e}")

finally:
    if 'cursor' in locals():
        cursor.close()
    if 'connection' in locals() and connection.is_connected():
        connection.close()
