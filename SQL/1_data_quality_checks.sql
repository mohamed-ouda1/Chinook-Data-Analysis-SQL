-- Check NULLs in important tables
SELECT 
    'Customer' AS table_name,
    COUNT(*) AS total_rows,
    SUM(CASE WHEN FirstName IS NULL OR LastName IS NULL THEN 1 ELSE 0 END) AS null_names
FROM Customer;


-- Duplicate customers (should be zero)
SELECT FirstName, LastName, Email, COUNT(*) AS cnt
FROM Customer
GROUP BY FirstName, LastName, Email
HAVING cnt > 1;


-- Negative or zero prices
SELECT *
FROM InvoiceLine
WHERE UnitPrice <= 0 OR Quantity <= 0;


-- Invoices without customers (should return zero rows)
SELECT i.InvoiceId
FROM Invoice i
LEFT JOIN Customer c ON i.CustomerId = c.CustomerId
WHERE c.CustomerId IS NULL;


SELECT
    COUNT(*) AS total_invoices,
    SUM(CASE WHEN Total <= 0 THEN 1 ELSE 0 END) AS invalid_totals
FROM Invoice;
