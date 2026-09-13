# Food Delivery Operations & Customer Analytics

## Project Overview

This project analyzes food delivery platform data using **MySQL** to understand customer behavior, restaurant performance, revenue patterns, and delivery operations.

The analysis uses multiple related datasets covering customers, restaurants, menu items, orders, and order items.

## Objectives

- Analyze customer ordering behavior
- Identify repeat customers and high-value customers
- Analyze order volume across cities and restaurants
- Evaluate restaurant ratings and performance
- Analyze revenue by restaurant and cuisine
- Identify late-order and cancellation patterns
- Calculate key operational and customer KPIs

## Dataset

The project contains five related datasets:

- `customers_medium.csv` — Customer details and city information
- `restaurants.csv` — Restaurant, cuisine, city, and rating information
- `menu_items.csv` — Menu item and pricing information
- `orders_medium.csv` — Customer orders, restaurants, order time, delivery time, and status
- `order_items (2).csv` — Order items, quantities, and prices

## Tools & Technologies

- **MySQL**
- **MySQL Workbench**
- SQL

## SQL Techniques Used

- SELECT and filtering
- GROUP BY
- ORDER BY
- HAVING
- Aggregate functions: `COUNT()`, `SUM()`, `AVG()`
- `CASE WHEN`
- INNER JOIN
- Subqueries
- Common Table Expressions (CTEs)
- Window functions
- `ROW_NUMBER()`
- `PARTITION BY`
- Percentage calculations
- KPI calculations
- `TIMESTAMPDIFF()`

## Key Insights

### Order Performance

The dataset contains **5,000 orders**:

| Status | Orders | Percentage |
|---|---:|---:|
| Delivered | 1,717 | 34.34% |
| Late | 1,671 | 33.42% |
| Cancelled | 1,612 | 32.24% |

Overall, **65.66% of orders were either late or cancelled** in the analyzed dataset.

### Customer Behavior

- **Bristol** had the highest customer count with **270 customers**.
- Bristol also recorded the highest order volume with **959 orders**.
- **1,272 out of 1,500 customers** were repeat customers, representing an **84.8% repeat-customer rate**.
- Customer **C1447** had the highest total spending at **1,527.70**.
- Customer **C1065** placed the highest number of orders with **11 orders**.

### Revenue Analysis

Total order-item revenue was **560,509.15**.

**Thai cuisine** generated the highest revenue at **127,428.71**.

The restaurant with the highest total revenue was **R061**, with **6,908.29**.

### Delivery & Cancellation Analysis

- **Birmingham** had the highest late-order rate at **36.01%**.
- **Manchester** had the highest cancellation rate at **35.38%**.
- Late orders had an average order-to-delivery time of approximately **55.12 minutes**.

### Restaurant Ratings

**Mexican** restaurants had the highest average rating at **4.20**.

The highest-rated restaurants in Birmingham, Bristol, and Liverpool had ratings of **5.0**, while the highest-rated restaurants in Leeds, London, and Manchester had ratings of **4.9**.

## Project Structure

```text
food-delivery-sql-analysis/
│
├── Insights/
│   └── project_insights.md
│
├── datasets/
│   ├── customers_medium.csv
│   ├── restaurants.csv
│   ├── menu_items.csv
│   ├── orders_medium.csv
│   └── order_items (2).csv
│
└── sql queries/
    └── food_delivery_analysis.sql
