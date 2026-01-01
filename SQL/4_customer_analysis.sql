-- ============================
-- Top 10 Customers by Spending
-- ============================

SELECT c.FirstName || ' ' || c.LastName AS customer_name,
       ROUND(SUM(i.Total), 2) AS total_spent
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId
ORDER BY total_spent DESC
LIMIT 10;

-- ============================
-- Average Invoice per Customer
-- ============================

SELECT c.FirstName || ' ' || c.LastName AS customer_name,
       COUNT(i.InvoiceId) AS num_invoices,
       ROUND(AVG(i.Total), 2) AS avg_invoice
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId
ORDER BY num_invoices DESC
LIMIT 10;

-- ============================
-- Customers with Single Purchase
-- ============================

SELECT c.FirstName || ' ' || c.LastName AS customer_name,
       COUNT(i.InvoiceId) AS num_invoices
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId
HAVING num_invoices = 1;
