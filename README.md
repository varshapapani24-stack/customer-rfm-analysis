# 🛒 Customer RFM Segmentation Analysis

## 📌 Project Overview
Analyzed 500,000+ real e-commerce transactions to segment
4,372 customers into behavioral groups using pure SQL.
Built to identify high-value customers, detect churn risk,
and quantify revenue impact per segment.

## 🛠 Tools Used
- SQL (SQLite)
- DB Browser for SQLite
- Dataset: UCI E-Commerce Dataset (Kaggle)

## 📊 Key Business Findings

| Segment  | Customers | Revenue    | Revenue % |
|----------|-----------|------------|-----------|
| Champion | 686       | £3,806,895 | 45.87%    |
| Loyal    | 1,915     | £3,320,646 | 40.01%    |
| At-Risk  | 794       | £721,190   | 8.69%     |
| Lost     | 977       | £451,333   | 5.44%     |

## 💡 Business Insights
- 686 Champions generate 45% of total revenue despite being
  only 15% of customers
- 794 At-Risk customers need immediate re-engagement campaign
- Loyal segment is largest group — prime target for upgrades
  to Champion category
- Lost customers contributed only 5.44% — low priority

## 📁 Project Structure
- rfm_analysis.sql → All queries from exploration to final report

## 🧠 SQL Concepts Used
- SELECT, WHERE, GROUP BY, ORDER BY
- Aggregate functions (SUM, COUNT, AVG, MAX)
- CASE WHEN for segmentation logic
- CTEs (Common Table Expressions)
- Window functions (RANK, PARTITION BY)
- Date parsing and string functions (SUBSTR, PRINTF, INSTR)
- Subqueries for percentage calculation

## 📈 RFM Methodology
| Letter | Meaning   | Logic Used                        |
|--------|-----------|-----------------------------------|
| R      | Recency   | Days since last purchase          |
| F      | Frequency | Count of unique orders            |
| M      | Monetary  | Total revenue (Quantity x Price)  |
