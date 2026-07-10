WITH customer_metrics AS (
    SELECT
        CustomerID,
        MAX(
            SUBSTR(InvoiceDate, INSTR(InvoiceDate,'/')+INSTR(SUBSTR(InvoiceDate,INSTR(InvoiceDate,'/')+1),'/')+1, 4)
            || PRINTF('%02d', CAST(SUBSTR(InvoiceDate,1,INSTR(InvoiceDate,'/')-1) AS INT))
            || PRINTF('%02d', CAST(SUBSTR(InvoiceDate,INSTR(InvoiceDate,'/')+1,
               INSTR(SUBSTR(InvoiceDate,INSTR(InvoiceDate,'/')+1),'/')-1) AS INT))
        ) AS last_yyyymmdd,
        COUNT(DISTINCT InvoiceNo) AS total_orders,
        ROUND(SUM(Quantity * UnitPrice), 2) AS total_revenue
    FROM data
    WHERE CustomerID != ''
    GROUP BY CustomerID
),
customer_segments AS (
    SELECT
        CustomerID,
        last_yyyymmdd,
        total_orders,
        total_revenue,
        CASE
            WHEN last_yyyymmdd >= '20111201' THEN 'Champion'
            WHEN last_yyyymmdd >= '20111001' THEN 'Loyal'
            WHEN last_yyyymmdd >= '20110701' THEN 'At-Risk'
            ELSE 'Lost'
        END AS customer_segment
    FROM customer_metrics
)
SELECT
    customer_segment,
    COUNT(CustomerID) AS total_customers,
    ROUND(SUM(total_revenue), 2) AS segment_revenue,
    ROUND(AVG(total_revenue), 2) AS avg_revenue_per_customer,
    ROUND(AVG(total_orders), 1) AS avg_orders_per_customer,
    ROUND(
        SUM(total_revenue) * 100.0 /
        (SELECT SUM(total_revenue) FROM customer_segments)
    , 2) AS revenue_percentage
FROM customer_segments
GROUP BY customer_segment
ORDER BY segment_revenue DESC;