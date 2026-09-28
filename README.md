# 🛒 E-Commerce Sales Analysis (MySQL)

## 📌 Project Overview
This project is an end-to-end SQL database designed to analyze e-commerce sales data. 
I built this project to demonstrate my ability to design relational databases, write complex queries, and extract actionable business insights from raw data.

The database simulates a real-world online store, tracking customers, products, orders, and order items.

## 🗄️ Database Schema
The database consists of 5 relational tables designed using normalization principles:

*   **customers:** Stores customer profile information (name, email, location, signup date).
*   **categories:** Groups products into categories (e.g., Electronics, Clothing).
*   **products:** Contains product details (name, price, stock, category link).
*   **orders:** Tracks order headers (customer, date, status).
*   **order_items:** Tracks individual items within an order (quantity, unit price at time of purchase).

*Relationships: One customer can have many orders. One order can have many order items. One product can belong to one category.*

## 🛠️ Tools & Technologies Used
*   **Database:** MySQL
*   **IDE:** VS Code (with SQLTools extension)
*   **Version Control:** Git & GitHub

## 🧠 SQL Concepts Demonstrated
This repository is structured to showcase a progression of SQL skills:
*   **Basic Queries:** `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`, `LIKE`.
*   **Joins:** `INNER JOIN`, `LEFT JOIN` to combine data across multiple tables.
*   **Aggregations:** `COUNT`, `SUM`, `AVG`, `GROUP BY`, `HAVING` for calculating KPIs.
*   **Subqueries & CTEs:** Using `WITH` clauses to make complex queries readable and maintainable.
*   **Window Functions:** `RANK()`, `ROW_NUMBER()`, `SUM() OVER (PARTITION BY...)` for advanced analytics like running totals and top-N per group.
*   **Views & Stored Procedures:** Creating reusable `vw_order_details` view and `GetCustomerOrders` procedure for dashboard consumption.
*   **Indexes:** Adding indexes on frequently queried columns for performance optimization.

## 📂 Repository Structure
*   `01_schema.sql`: Database creation and table definitions (DDL).
*   `02_sample_data.sql`: Inserting realistic dummy data (DML).
*   `03_basic_queries.sql`: Fundamental data retrieval.
*   `04_joins.sql`: Combining data from multiple tables.
*   `05_aggregations.sql`: Summarizing data for business reporting.
*   `06_subqueries_ctes.sql`: Advanced filtering using subqueries and CTEs.
*   `07_windows_functions.sql`: Ranking and running totals.
*   `08_views.sql`: Creating reusable virtual tables.
*   `09_indexes_procedures.sql`: Performance tuning and automation.
*   `10_business_analysis.sql`: (Optional) Final insights and conclusions.

## 📊 Key Business Insights Discovered
Using the queries in this project, I was able to answer the following:
1.  **Top Spenders:** Identified the top 3 customers who generated the highest lifetime revenue.
2.  **Product Performance:** Ranked products by revenue and found the top-selling product in *each* category using Window Functions.
3.  **Monthly Trends:** Calculated month-over-month revenue to identify peak sales periods.

## 🚀 How to Run This Project
1. Clone this repository to your local machine.
2. Open the project in VS Code (or MySQL Workbench).
3. Run the files in numerical order (`01` to `09`).
4. Ensure you have a local MySQL server running on port `3306`.

## 🤝 Connect with Me
I am actively looking for opportunities  
*   **LinkedIn:** https://www.linkedin.com/in/hari028/
*   **Email:** hariprasath.m028@gmail.com
