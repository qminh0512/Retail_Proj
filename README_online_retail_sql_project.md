# Online Retail SQL Portfolio Project (SSMS)

## Why this project is good for portfolio
This project is strong enough for a beginner portfolio because it shows a full SQL workflow:
- importing raw CSV data
- staging and cleaning data
- handling nulls / cancellations / invalid values
- building fact and dimension tables
- writing business KPI queries
- doing customer analytics with RFM segmentation

## Dataset snapshot
Using the two uploaded files:
- `online_retail_II_2009.csv`
- `online_retail_II_2010.csv`

Quick profiling from the files:
- 2009 file: 525,461 rows
- 2010 file: 541,910 rows
- missing customer IDs are large in both files
- there are cancellation invoices (`Invoice` starts with `C`)
- there are rows with `Quantity <= 0` and `Price <= 0`

That makes the dataset realistic enough for a portfolio project.

## Suggested project title
**E-Commerce Sales & Customer Analytics in SQL Server**

## What to put on CV / portfolio
**SQL Project: E-Commerce Sales & Customer Analytics**
- Built an end-to-end SQL Server analytics project on 1M+ retail transaction rows
- Designed staging, fact, and dimension tables in SQL Server
- Cleaned raw sales data by removing cancellations, null customer records, and invalid transactions
- Wrote KPI queries for revenue trend, top products, top countries, AOV, repeat purchase rate
- Performed customer segmentation using RFM logic in SQL

## Project structure in SSMS
1. Create database
2. Import 2 CSV files into staging tables
3. Merge into unified raw table
4. Clean data into final fact table
5. Create dimensions
6. Run analysis queries
7. Take screenshots of schema + outputs for portfolio

## Best screenshots for portfolio
- database tables in SSMS
- sample raw rows
- cleaning query / clean fact table
- monthly revenue query result
- top products query result
- RFM segmentation query result

## Nice extension ideas
- Build a stored procedure for monthly KPI refresh
- Build a SQL view for Power BI
- Add cohort analysis
- Add weekday / hour sales analysis
- Connect SSMS output to Power BI for visuals
