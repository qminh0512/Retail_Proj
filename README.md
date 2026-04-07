# Retail Project

This project focuses on cleaning and analyzing retail transaction data using SQL Server.

## Dataset
- Retail transaction data from a UK-based online shop  
- Around 500 thousands rows  
- Includes information such as Invoice, Product, Quantity, Price, Customer ID, and Country  

## Objectives
- Clean and prepare raw data for analysis  
- Explore sales performance and customer behavior  
- Practice SQL for real-world data analysis  

## Data Cleaning
The dataset contains some issues such as:
- Missing values (e.g. Customer ID, Description)  
- Cancelled invoices (Invoice starting with 'C')  
- Invalid values (Quantity <= 0, Price <= 0)
![Unclean data](screenshots/uncleanedData)

Steps performed:
- Handled null values  
- Converted data types  
- Removed or filtered invalid transactions for analysis
![Clean data](screenshots/cleanDataCols)

## Analysis
Some basic analyses were performed:
- Total revenue and number of orders  
- Monthly revenue trend
  ![](screenshots/monthRevenues)
- Top products by sales  
- Top customers by revenue
  ![](screenshots/topCustomers)
- Revenue by country  

## SQL Techniques Used
- SELECT, WHERE, GROUP BY  
- CASE WHEN  
- Aggregate functions (SUM, COUNT, AVG)  
- Basic window functions  

## Project Purpose
This project is for practicing SQL and understanding basic data cleaning and analysis on real-world data.
