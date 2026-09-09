# Brazilian E-Commerce Sales Analysis

Sales data analysis of Brazilian e-commerce using the public Olist dataset (2017–2018).

## Dataset

* Source: [Olist Dataset — Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
* 112,650 orders across 74 product categories
* Period: January 2017 to September 2018

## Tools

* Excel (Power Query, Pivot Tables, Dashboard)
* SQL (SQLite via DB Browser for SQLite)
* Power BI *(in progress)*

## Business Questions

### Sales Analysis

* Which product categories generate the most revenue?
* What is the average ticket by category?
* How do sales evolve over time? Is there a seasonal pattern?
* Which Brazilian states generate the highest sales volume?

### Customer Behavior

* What is the average delivery time by region?
* Is there a correlation between delivery delays and negative reviews?
* Which product categories receive the most negative reviews?

### Anomaly Detection

* Are there orders with unusually high values combined with very low review scores?
* Are there sellers with unusually high cancellation rates?
* Are there unusual concentrations of orders associated with the same address and different payment methods?

## Key Findings

* **Top category by revenue:** Beleza Saude — approximately R$ 1.25M in total revenue
* **Highest average ticket:** PCs — approximately R$ 1,098 per item
* **Revenue trend:** Revenue increased throughout most of 2017, reaching a strong peak in November 2017, followed by continued high revenue levels in early 2018 and a decline toward the end of the dataset period
* **Anomaly detection:** Identified orders with unusually high values as potential anomalies requiring further investigation

## Dashboard

### Excel Dashboard

The Excel dashboard includes:

* KPI cards
* Top 10 categories by revenue
* Monthly revenue trend
* Category performance analysis

* The dashboard preview is available in PDF format in the `excel/` folder.

The complete Excel workbook can be downloaded from the https://github.com/skamzz/olist-ecommerce-analysis/releases/tag/v1.0.

### Power BI Dashboard *(in progress)*

The Power BI dashboard includes four main visuals:

* **Sales volume by state:** Brazil map showing the distribution of sales across Brazilian states
* **Top 10 categories:** Bar chart ranking the highest-revenue product categories
* **Average ticket:** KPI card showing the overall average ticket
* **Delivery delay vs. review score:** Scatter plot analyzing the relationship between delivery delays and customer reviews

## SQL Analysis

The project includes five analytical SQL queries:

1. **Top 10 categories by total revenue**
2. **Average ticket by category**
3. **Monthly revenue trend**
4. **Revenue growth — 2017 vs 2018 by category**
5. **Anomaly detection**

The query results are exported as CSV files and available in `sql/results/`.

## Project Structure

```text
olist-ecommerce-analysis/
├── README.md
├── excel/
│   └── olist_ecommerce_dashboard.pdf
├── sql/
│   ├── queries.sql
│   └── results/
│       ├── top_10_categories_by_revenue.csv
│       ├── avg_ticket_by_category.csv
│       ├── monthly_revenue_trend.csv
│       ├── revenue_growth_2017_vs_2018.csv
│       └── anomaly_detection.csv
└── powerbi/
    └── olist_ecommerce_dashboard.pbix
```

## Skills Demonstrated

SQL · Excel · Power Query · Pivot Tables · Data Analysis · Data Visualization · Anomaly Detection · Business Intelligence
