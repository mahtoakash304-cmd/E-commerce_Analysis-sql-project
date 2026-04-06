# E-commerce_Analysis-sql-project
# 🛒 E-Commerce Sales & Customer Analytics System (SQL Project)

## Project Overview
This is an **SQL-based E-Commerce Analytics Project** where we create a complete database system and generate meaningful business reports using SQL.

The project covers all major SQL concepts such as:

- SELECT
- WHERE
- ORDER BY
- DISTINCT
- LIKE / IN / BETWEEN
- Aggregate Functions (SUM, COUNT, AVG, MIN, MAX)
- GROUP BY + HAVING
- JOINS (INNER JOIN, LEFT JOIN)
- Multi-table reporting queries

---

## Objective
The main goal of this project is to analyze e-commerce business data and generate reports such as:

- Customer Dashboard
- Product Sales Report
- Payment Summary Report
- City-wise and Category-wise Revenue Reports
- Top Customers Report

---

## Database Schema

### 1) Customers
| Column | Type |
|--------|------|
| customer_id | INT (PK) |
| name | VARCHAR |
| city | VARCHAR |
| join_date | DATE |

---

### 2) Products
| Column | Type |
|--------|------|
| product_id | INT (PK) |
| product_name | VARCHAR |
| category | VARCHAR |

---

### 3) Orders
| Column | Type |
|--------|------|
| order_id | INT (PK) |
| customer_id | INT (FK) |
| order_date | DATE |
| total_amount | DECIMAL |

---

### 4) Order_Items
| Column | Type |
|--------|------|
| item_id | INT (PK) |
| order_id | INT (FK) |
| product_id | INT (FK) |
| quantity | INT |
| price | DECIMAL |

---

### 5) Payments
| Column | Type |
|--------|------|
| payment_id | INT (PK) |
| order_id | INT (FK) |
| payment_date | DATE |
| status | VARCHAR |

Payment status values:
- Paid
- Failed
- Pending

---

## Relationships (ER Overview)
- One customer can place multiple orders (**Customers → Orders**)
- One order can have multiple items (**Orders → Order_Items**)
- Products are linked with order items (**Products → Order_Items**)
- Each order has a payment record (**Orders → Payments**)

---
##  How to Run This Project

### Step 1: Create Database & Tables
Run the file:
```sql
schema.sql
