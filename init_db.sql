-- QueryCraft Database Initialization
-- This creates sample tables for testing

USE querycraft_db;

-- Drop tables if they exist
DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS orders;

-- Create products table
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    category VARCHAR(100),
    price DECIMAL(10, 2),
    stock_quantity INT,
    supplier VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create customers table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    phone VARCHAR(20),
    region VARCHAR(50),
    city VARCHAR(100),
    country VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create sales table
CREATE TABLE sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    sales_person VARCHAR(100),
    region VARCHAR(50),
    quantity INT,
    unit_price DECIMAL(10, 2),
    total_amount DECIMAL(10, 2),
    sale_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create orders table
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    status VARCHAR(50),
    shipping_address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insert sample products
INSERT INTO products (product_name, category, price, stock_quantity, supplier) VALUES
('Laptop Pro', 'Electronics', 1299.99, 50, 'Tech Suppliers Inc'),
('Wireless Mouse', 'Electronics', 29.99, 200, 'Tech Suppliers Inc'),
('Office Desk', 'Furniture', 349.99, 30, 'Furniture World'),
('Ergonomic Chair', 'Furniture', 249.99, 45, 'Furniture World'),
('LED Monitor', 'Electronics', 299.99, 75, 'Tech Suppliers Inc'),
('Keyboard', 'Electronics', 79.99, 150, 'Tech Suppliers Inc'),
('Desk Lamp', 'Furniture', 39.99, 100, 'Home Depot'),
('Notebook Set', 'Stationery', 12.99, 500, 'Office Supplies Co'),
('Pen Pack', 'Stationery', 5.99, 800, 'Office Supplies Co'),
('Water Bottle', 'Accessories', 19.99, 250, 'Lifestyle Products');

-- Insert sample customers
INSERT INTO customers (customer_name, email, phone, region, city, country) VALUES
('John Smith', 'john.smith@email.com', '555-0101', 'East', 'New York', 'USA'),
('Jane Doe', 'jane.doe@email.com', '555-0102', 'West', 'San Francisco', 'USA'),
('Bob Johnson', 'bob.johnson@email.com', '555-0103', 'North', 'Chicago', 'USA'),
('Alice Williams', 'alice.w@email.com', '555-0104', 'South', 'Houston', 'USA'),
('Charlie Brown', 'charlie.b@email.com', '555-0105', 'East', 'Boston', 'USA'),
('Diana Prince', 'diana.p@email.com', '555-0106', 'West', 'Los Angeles', 'USA'),
('Eve Davis', 'eve.davis@email.com', '555-0107', 'North', 'Seattle', 'USA'),
('Frank Miller', 'frank.m@email.com', '555-0108', 'South', 'Miami', 'USA'),
('Grace Lee', 'grace.lee@email.com', '555-0109', 'East', 'Philadelphia', 'USA'),
('Henry Wilson', 'henry.w@email.com', '555-0110', 'West', 'Phoenix', 'USA');

-- Insert sample sales (last 3 months)
INSERT INTO sales (customer_id, product_id, sales_person, region, quantity, unit_price, total_amount, sale_date) VALUES
(1, 1, 'John Smith', 'East', 2, 1299.99, 2599.98, DATE_SUB(CURDATE(), INTERVAL 10 DAY)),
(2, 3, 'Jane Doe', 'West', 1, 349.99, 349.99, DATE_SUB(CURDATE(), INTERVAL 15 DAY)),
(3, 5, 'Bob Johnson', 'North', 3, 299.99, 899.97, DATE_SUB(CURDATE(), INTERVAL 20 DAY)),
(4, 2, 'Alice Williams', 'South', 5, 29.99, 149.95, DATE_SUB(CURDATE(), INTERVAL 25 DAY)),
(5, 4, 'Charlie Brown', 'East', 2, 249.99, 499.98, DATE_SUB(CURDATE(), INTERVAL 30 DAY)),
(6, 1, 'Diana Prince', 'West', 1, 1299.99, 1299.99, DATE_SUB(CURDATE(), INTERVAL 35 DAY)),
(7, 6, 'Eve Davis', 'North', 4, 79.99, 319.96, DATE_SUB(CURDATE(), INTERVAL 40 DAY)),
(8, 8, 'Frank Miller', 'South', 10, 12.99, 129.90, DATE_SUB(CURDATE(), INTERVAL 45 DAY)),
(9, 7, 'Grace Lee', 'East', 3, 39.99, 119.97, DATE_SUB(CURDATE(), INTERVAL 50 DAY)),
(10, 9, 'Henry Wilson', 'West', 20, 5.99, 119.80, DATE_SUB(CURDATE(), INTERVAL 55 DAY)),
(1, 5, 'John Smith', 'East', 2, 299.99, 599.98, DATE_SUB(CURDATE(), INTERVAL 5 DAY)),
(2, 2, 'Jane Doe', 'West', 3, 29.99, 89.97, DATE_SUB(CURDATE(), INTERVAL 7 DAY)),
(3, 1, 'Bob Johnson', 'North', 1, 1299.99, 1299.99, DATE_SUB(CURDATE(), INTERVAL 12 DAY)),
(4, 4, 'Alice Williams', 'South', 1, 249.99, 249.99, DATE_SUB(CURDATE(), INTERVAL 18 DAY)),
(5, 10, 'Charlie Brown', 'East', 5, 19.99, 99.95, DATE_SUB(CURDATE(), INTERVAL 22 DAY));

-- Insert sample orders
INSERT INTO orders (customer_id, order_date, total_amount, status, shipping_address) VALUES
(1, DATE_SUB(CURDATE(), INTERVAL 5 DAY), 2599.98, 'Delivered', '123 Main St, New York, NY'),
(2, DATE_SUB(CURDATE(), INTERVAL 10 DAY), 349.99, 'Shipped', '456 Oak Ave, San Francisco, CA'),
(3, DATE_SUB(CURDATE(), INTERVAL 15 DAY), 899.97, 'Processing', '789 Pine Rd, Chicago, IL'),
(4, DATE_SUB(CURDATE(), INTERVAL 20 DAY), 149.95, 'Delivered', '321 Elm St, Houston, TX'),
(5, DATE_SUB(CURDATE(), INTERVAL 25 DAY), 499.98, 'Shipped', '654 Maple Dr, Boston, MA');

-- Create indexes for better query performance
CREATE INDEX idx_sales_date ON sales(sale_date);
CREATE INDEX idx_sales_region ON sales(region);
CREATE INDEX idx_customers_region ON customers(region);
CREATE INDEX idx_products_category ON products(category);
CREATE INDEX idx_orders_status ON orders(status);

-- Display summary
SELECT 'Database initialized successfully!' as status;
SELECT COUNT(*) as product_count FROM products;
SELECT COUNT(*) as customer_count FROM customers;
SELECT COUNT(*) as sales_count FROM sales;
SELECT COUNT(*) as order_count FROM orders;