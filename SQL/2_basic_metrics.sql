-- ============================
-- Basic Business Metrics
-- ============================

-- عدد العملاء
SELECT COUNT(*) AS total_customers
FROM Customer;

-- عدد الفواتير
SELECT COUNT(*) AS total_invoices
FROM Invoice;

-- إجمالي الإيرادات
SELECT ROUND(SUM(Total), 2) AS total_revenue
FROM Invoice;

-- متوسط قيمة الفاتورة
SELECT ROUND(AVG(Total), 2) AS avg_invoice_value
FROM Invoice;
