# PostgreSQL_Assignment


### 1. What is PostgreSQL?

PostgreSQL is a powerful, open-source object-relational database management system (ORDBMS) known for its reliability, feature-rich architecture, and standards compliance. It enhances SQL with advanced capabilities like:

* Complex querying
* Foreign keys constraints
* Triggers
* Updatable views
* Full transactional support
* Multiversion concurrency control (MVCC)

It handles both structured data (using SQL) and semi-structured data (like JSON and XML), making it highly versatile. PostgreSQL is also highly extensible — you can create custom data types, functions, operators, and more.


### 2. What is the purpose of a database schema in PostgreSQL?

In PostgreSQL, a schema is a logical namespace that groups related database objects such as tables, views, functions, types, and indexes.

**Purpose of Schema:**

* Organizes data logically within a single database
* Avoid naming collisions (e.g., two tables with the same name in different schemas)
* Enables fine-grained permission and access control
* Supports modular design and is useful for multi-tenant applications


### 3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.
**Primary Key:**
A primary key is used to uniquely identify each row in a table. It enforces data integrity by ensuring:

* Must contain unique values
* Cannot be NULL
* Automatically creates a unique index

Example:
```
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    name TEXT
);
```

**Foreign Key:**
A foreign key defines a relationship between two tables by referencing the primary key of another table. It ensures referential integrity by allowing only valid references.

Example:
```
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date DATE
);
```
This means each `order` must be linked to a valid `customer`.



### 4. What is the difference between the `VARCHAR` and `CHAR` data types?

Both `VARCHAR` and `CHAR` are used to store character strings, but they behave differently:

| Feature       | `VARCHAR(n)`                | `CHAR(n)`                         |
| ------------- | --------------------------- | --------------------------------- |
| Meaning       | Variable-length string      | Fixed-length string               |
| Storage       | Stores only used characters | Pads unused space with spaces     |
| Efficiency    | More space-efficient        | Slightly faster for fixed lengths |
| Usage Example | `VARCHAR(50)` for names     | `CHAR(2)` for country codes       |

Example:
```
CREATE TABLE products (
    code CHAR(50),
    name VARCHAR(100)
);
```


In this table:

* `code` will always store exactly 50 characters, padded if needed.
* `name` can be up to 100 characters, with variable length.


### 5. Explain the purpose of the `WHERE` clause in a `SELECT` statement.

The `WHERE` clause filters records based on specific conditions. It ensures that only rows meeting the criteria are returned.

Syntax:
```
SELECT * FROM employees
WHERE department = 'HR';
```

This query retrieves all `employees` only from the HR department.

