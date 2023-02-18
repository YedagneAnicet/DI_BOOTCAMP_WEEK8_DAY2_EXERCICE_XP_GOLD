-- Part I
CREATE TABLE purchases (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(id),
    item_id INTEGER REFERENCES items(id),
    quantity_purchased INTEGER NOT NULL
);
-- Scott Scott bought one fan
INSERT INTO purchases (customer_id, item_id, quantity_purchased)
VALUES (
        (
            SELECT customer_id
            FROM customers
            WHERE first_name = 'Scott'
                AND last_name = 'Scott'
        ),
        (
            SELECT item_id
            FROM items
            WHERE item_name = 'Fan'
        ),
        1
    );
-- Melanie Johnson bought ten large desks
INSERT INTO purchases (customer_id, item_id, quantity_purchased)
VALUES (
        (
            SELECT customer_id
            FROM customers
            WHERE first_name = 'Melanie'
                AND last_name = 'Johnson'
        ),
        (
            SELECT item_id
            FROM items
            WHERE item_name = 'Large Desk'
        ),
        10
    );
-- Greg Jones bought two small desks
INSERT INTO purchases (customer_id, item_id, quantity_purchased)
VALUES (
        (
            SELECT customer_id
            FROM customers
            WHERE first_name = 'Greg'
                AND last_name = 'Jones'
        ),
        (
            SELECT item_id
            FROM items
            WHERE item_name = 'Small Desk'
        ),
        2
    );
-- Part II
-- All purchases:
SELECT *
FROM purchases;
-- All purchases, joining with the customers table:
SELECT purchases.id,
    customers.first_name,
    customers.last_name,
    items.item_name,
    purchases.quantity_purchased
FROM purchases
    JOIN customers ON purchases.customer_id = customers.customer_id
    JOIN items ON purchases.item_id = items.item_id;
-- Purchases of the customer with the ID equal to 5:
SELECT purchases.id,
    customers.first_name,
    customers.last_name,
    items.item_name,
    purchases.quantity_purchased
FROM purchases
    JOIN customers ON purchases.customer_id = customers.customer_id
    JOIN items ON purchases.item_id = items.item_id
WHERE customers.customer_id = 5;
-- Purchases for a large desk AND a small desk:
SELECT purchases.id,
    customers.first_name,
    customers.last_name,
    items.item_name,
    purchases.quantity_purchased
FROM purchases
    JOIN customers ON purchases.customer_id = customers.customer_id
    JOIN items ON purchases.item_id = items.item_id
WHERE items.item_name IN ('Small Desk', 'Large Desk')
GROUP BY purchases.id,
    customers.first_name,
    customers.last_name,
    items.item_name,
    purchases.quantity_purchased;
-- Customers who have made a purchase:
SELECT customers.first_name,
    customers.last_name,
    items.item_name
FROM purchases
    JOIN customers ON purchases.customer_id = customers.customer_id
    JOIN items ON purchases.item_id = items.item_id
GROUP BY customers.first_name,
    customers.last_name,
    items.item_name;
-- Adding a row which references a customer by ID, but does not reference an item by ID (leave it blank):
INSERT INTO purchases (customer_id, item_id, quantity_purchased)
VALUES (1, NULL, 1);