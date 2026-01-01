-- ============================
-- Most Popular Tracks
-- ============================

SELECT t.Name AS track_name,
       COUNT(il.InvoiceLineId) AS times_sold,
       ROUND(SUM(il.UnitPrice * il.Quantity), 2) AS revenue
FROM Track t
JOIN InvoiceLine il ON t.TrackId = il.TrackId
GROUP BY t.TrackId
ORDER BY times_sold DESC
LIMIT 10;

-- ============================
-- Revenue Concentration: Top 20% Customers
-- ============================

WITH customer_totals AS (
    SELECT c.CustomerId,
           SUM(i.Total) AS total_spent
    FROM Customer c
    JOIN Invoice i ON c.CustomerId = i.CustomerId
    GROUP BY c.CustomerId
)
SELECT SUM(total_spent) AS top_20_percent_revenue
FROM customer_totals
WHERE CustomerId IN (
    SELECT CustomerId
    FROM customer_totals
    ORDER BY total_spent DESC
    LIMIT (SELECT ROUND(COUNT(*) * 0.2) FROM customer_totals)
);

-- ============================
-- Average Invoice per Country
-- ============================

SELECT BillingCountry,
       COUNT(InvoiceId) AS num_invoices,
       ROUND(SUM(Total)/COUNT(InvoiceId), 2) AS avg_invoice
FROM Invoice
GROUP BY BillingCountry
ORDER BY avg_invoice DESC;
