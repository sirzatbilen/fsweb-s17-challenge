-- Tasarımını yaptığınız tabloları oluşturan sql ifadeleri buraya yazınız.
-- veri tiplerine, nullable olma durumuna, default değerine ve tablolar arası foreign key kullanımına dikkat.
CREATE TABLE customers(
customer_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
customer_name TEXT NOT NULL,
customer_surname TEXT NOT NULL,
customer_email TEXT NOT NULL,
customer_address TEXT NOT NULL,
PRIMARY KEY (customer_id)
);

CREATE TABLE orders(
order_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
customer_id BIGINT UNSIGNED NOT NULL,
PRIMARY KEY (order_id),
FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE categories(
category_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
category_name TEXT NOT NULL,
PRIMARY KEY (category_id)
);

CREATE TABLE products(
product_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
product_name TEXT NOT NULL,
product_description TEXT NOT NULL,
product_price DECIMAL(10, 2) NOT NULL,
product_img_url TEXT NOT NULL,
category_id BIGINT UNSIGNED NOT NULL,
PRIMARY KEY (product_id),
FOREIGN KEY(category_id) REFERENCES categories(category_id)
);

CREATE TABLE employees(
employee_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
employee_name TEXT NOT NULL,
employee_surname TEXT NOT NULL,
employee_email TEXT NOT NULL,
employee_hire_date DATE NOT NULL,
salary DECIMAL(10, 2) NOT NULL,
PRIMARY KEY (employee_id)
);

CREATE TABLE order_items(
item_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
order_id BIGINT UNSIGNED NOT NULL,
product_id BIGINT UNSIGNED NOT NULL,
quantity INT NOT NULL,
price DECIMAL(10, 2) NOT NULL,
PRIMARY KEY (item_id),
FOREIGN KEY(product_id) REFERENCES products(product_id),
FOREIGN KEY(order_id) REFERENCES orders(order_id)
);

CREATE TABLE payments(
payment_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
order_id BIGINT UNSIGNED NOT NULL,
payment_date DATETIME NOT NULL,
amount DECIMAL(10, 2) NOT NULL,
payment_method TEXT NOT NULL,
PRIMARY KEY (payment_id),
FOREIGN KEY(order_id) REFERENCES orders(order_id)
);

CREATE TABLE reviews(
review_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
product_id BIGINT UNSIGNED NOT NULL,
customer_id BIGINT UNSIGNED NOT NULL,
rating INT NOT NULL,
comment TEXT NULL,
created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (review_id),
FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
FOREIGN KEY(product_id) REFERENCES products(product_id)
);

CREATE TABLE addresses(
    address_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    customer_id BIGINT UNSIGNED NOT NULL,
    address_type TEXT NOT NULL,
    address_line TEXT NOT NULL,
    city TEXT NOT NULL,
    state TEXT NOT NULL,
    zip_code TEXT NOT NULL,
    country TEXT NOT NULL,
    PRIMARY KEY (address_id),
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);