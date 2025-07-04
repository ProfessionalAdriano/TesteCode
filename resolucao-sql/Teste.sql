SELECT c.*
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
--
--
SELECT p.*
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.order_id IS NULL;
--
--
SELECT *
FROM products p
WHERE NOT EXISTS (
  SELECT 1
  FROM order_items oi
  WHERE oi.product_id = p.product_id
);
--
--
SELECT 
  p.brand,
  s.store_name,
  SUM(oi.quantity) AS total_vendido
FROM 
  products p
JOIN 
  order_items oi ON p.product_id = oi.product_id
JOIN 
  orders o ON oi.order_id = o.order_id
JOIN 
  stores s ON o.store_id = s.store_id
GROUP BY 
  p.brand, s.store_name
ORDER BY 
  p.brand, s.store_name;
--
--
SELECT s.*
FROM staffs s
LEFT JOIN orders o ON s.staff_id = o.staff_id
WHERE o.order_id IS NULL;