# Write a simple python script that creates the database alx_book_store in 
# your MySQL server.

# Name of python script should be MySQLServer.py
# If the database alx_book_store already exists, your script should not fail
# You are not allowed to use the SELECT or SHOW statements
# Note

# Required to print message such as Database 'alx_book_store' created successfully! 
# when database is successfully created.

# Print error message to handle errors when failing to connect to the DB.

# handle open and close of the DB in your script


import mysql.connector
from mysql.connector import Error

try:
    # Connect to MySQL Server (adjust user and password if needed)
    connection = mysql.connector.connect(
        host="localhost",
        user="alx_user",
        password="alx_password"  # Replace with your MySQL password if set
    )

    if connection.is_connected():
        cursor = connection.cursor()
        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
        print("Database 'alx_book_store' created successfully!")

except mysql.connector.Error as e:
    print(f"Error while connecting to MySQL: {e}")

finally:
    # Always close the connection
    if 'cursor' in locals():
        cursor.close()
    if 'connection' in locals() and connection.is_connected():
        connection.close()

