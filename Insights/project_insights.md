# Food Delivery Operations & Customer Analytics

## Project Objective

Analyze food delivery customer, restaurant, order, and order-item data using MySQL to identify customer behavior, revenue patterns, restaurant performance, and delivery-related operational insights.

---

## Key Findings

### 1. Order Status Distribution

The dataset contains 5,000 orders.

- Delivered: 1,717 orders (34.34%)
- Late: 1,671 orders (33.42%)
- Cancelled: 1,612 orders (32.24%)

Overall, 65.66% of orders were either late or cancelled, indicating a significant operational performance issue in the dataset.

---

### 2. Average Delivery Time for Late Orders

Late orders had an average order-to-delivery time of approximately **55.12 minutes**.

This indicates that delivery delays are a significant factor affecting operational performance.

---

### 3. Customer Distribution by City

Customer counts were:

- Bristol: 270
- Leeds: 252
- Liverpool: 247
- London: 246
- Birmingham: 245
- Manchester: 240

**Bristol** had the highest number of customers among the six cities.

---

### 4. Orders by City

Bristol recorded the highest order volume with **959 orders**.

This indicates that Bristol had the strongest order activity among the analyzed cities.

---

### 5. Repeat Customer Analysis

Out of 1,500 customers, **1,272 customers placed more than one order**.

This represents a repeat-customer rate of **84.8%**.

The result indicates strong repeat ordering behavior within the dataset.

---

### 6. Revenue Analysis

Total order-item revenue was **560,509.15**.

The highest-revenue cuisine was:

**Thai — 127,428.71**

Other cuisine revenues included:

- Indian: 102,630.54
- American: 90,864.14
- Mexican: 90,060.25
- Italian: 89,963.60
- Chinese: 59,561.91

Thai cuisine generated the highest revenue among the analyzed cuisine categories.

---

### 7. Restaurant Performance

The restaurant with the highest total revenue was:

**R061 — 6,908.29**

The restaurant with the highest number of orders was:

**R021 — 57 orders**

This shows that the restaurant with the highest order volume was different from the restaurant with the highest revenue.

---

### 8. Delivery Performance by City

Birmingham had the highest late-order rate:

**36.01%**

Late-order rates by city:

- Birmingham: 36.01%
- Liverpool: 34.93%
- London: 34.79%
- Bristol: 33.58%
- Leeds: 32.51%
- Manchester: 28.59%

Birmingham therefore had the highest proportion of late orders.

---

### 9. Cancellation Rate by City

Manchester had the highest cancellation rate:

**35.38%**

Cancellation rates by city:

- Manchester: 35.38%
- Birmingham: 33.12%
- Leeds: 32.39%
- London: 31.55%
- Bristol: 31.07%
- Liverpool: 30.26%

Manchester therefore showed the highest cancellation rate among the analyzed cities.

---

### 10. Restaurant Ratings by Cuisine

Average restaurant ratings by cuisine:

- Mexican: 4.20
- Chinese: 4.04
- Italian: 4.00
- American: 3.99
- Thai: 3.93
- Indian: 3.92

Mexican restaurants had the highest average rating at **4.20**.

---

### 11. Highest-Rated Restaurant by City

The highest-rated restaurants identified in each city were:

| City | Restaurant | Cuisine | Rating |
|---|---|---|---:|
| Birmingham | R115 | Chinese | 5.0 |
| Bristol | R030 | Italian | 5.0 |
| Leeds | R086 | Chinese | 4.9 |
| Liverpool | R020 | Indian | 5.0 |
| London | R093 | Mexican | 4.9 |
| Manchester | R041 | Italian | 4.9 |

The analysis used the `ROW_NUMBER()` window function with `PARTITION BY city` to identify the top-rated restaurant within each city.

---

### 12. Customer Spending

The highest-spending customer identified was:

**C1447 — 1,527.70**

The most frequent customer was:

**C1065 — 11 orders**

This demonstrates that the customer with the highest order frequency was not necessarily the highest spender.

---

### 13. Restaurant Average Order Value

The restaurant with the highest calculated average order value was:

**R004 — 144.48**

This KPI was calculated using total order-item value divided by the number of distinct orders for each restaurant.

---

## SQL Techniques Used

- SELECT and filtering
- GROUP BY and ORDER BY
- Aggregate functions: COUNT, SUM, AVG
- CASE WHEN
- INNER JOIN
- Subqueries
- Common Table Expressions (CTEs)
- Window functions
- ROW_NUMBER()
- PARTITION BY
- Percentage calculations
- KPI calculations
- TIMESTAMPDIFF()
- Data aggregation across multiple related tables

---

## Business Areas Analyzed

- Customer behavior
- Repeat customers
- Order volume
- Revenue by restaurant
- Revenue by cuisine
- Restaurant ratings
- Average order value
- Delivery performance
- Late-order rates
- Cancellation rates