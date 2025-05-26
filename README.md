# PostgreSQL_Assignment

### 1. PostgreSQL কী?
PostgreSQL হলো একটি ওপেন-সোর্স, শক্তিশালী এবং অবজেক্ট-রিলেশনাল ডাটাবেজ ম্যানেজমেন্ট সিস্টেম (ORDBMS)। এটি SQL ভাষাকে উন্নত করে বিভিন্ন আধুনিক ফিচার যেমন: কমপ্লেক্স কুয়েরি, ফরেন কী, ট্রিগার, ট্রানজেকশন ইন্টিগ্রিটি এবং মাল্টিভার্শন কনকারেন্সি কন্ট্রোল (MVCC) সাপোর্ট করে। PostgreSQL স্ট্রাকচার্ড (SQL) এবং সেমি-স্ট্রাকচার্ড (JSON/XML) ডেটা উভয়ই ম্যানেজ করতে সক্ষম।

### 2. PostgreSQL-এ ডাটাবেজ স্কিমার উদ্দেশ্য কী?
একটি স্কিমা হলো PostgreSQL-এর মধ্যে একটি লজিক্যাল কনটেইনার, যেখানে টেবিল, ভিউ, ফাংশন, টাইপ, ইনডেক্স ইত্যাদি রাখা হয়।

**স্কিমার উদ্দেশ্য:**

* একই ডাটাবেজে ডেটাকে সংগঠিতভাবে রাখা
* একই নামের অবজেক্ট তৈরি হলেও কনফ্লিক্ট না হওয়া
* পারমিশন ও অ্যাক্সেস নিয়ন্ত্রণে সহায়তা
* মডুলার ডিজাইন এবং মাল্টি-টেন্যান্ট অ্যাপ্লিকেশনে সহায়তা করা


### 3. PostgreSQL এ Primary Key এবং Foreign Key এর ধারণা ব্যাখ্যা 
**Primary Key:**
প্রতিটি রো বা ডেটা ইউনিকভাবে শনাক্ত করার জন্য ব্যবহৃত হয়। এটি অবশ্যই ইউনিক এবং NOT NULL হতে হবে। এটি স্বয়ংক্রিয়ভাবে একটি ইউনিক ইনডেক্স তৈরি করে।

উদাহরণ:
```
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    name TEXT
);
```

**Foreign Key:**
ফরেন কি মূলত একটি টেবিলের কলামকে অন্য একটি টেবিলের প্রাইমারি কির সাথে যুক্ত করে সম্পর্ক তৈরি করে।

উদাহরণ:
```
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date DATE
);
```
এখানে প্রতিটি অর্ডার অবশ্যই একটি কাস্টোমারের সাথে যুক্ত থাকবে


### 4. VARCHAR এবং CHAR ডেটা টাইপের মধ্যে পার্থক্য কী?
* `CHAR(n)`: ফিক্সড-লেংথ স্ট্রিং, সবসময় ঠিক n সংখ্যক ক্যারেক্টার রাখবে। যদি কম হয়, বাকিটা স্পেস দিয়ে পূরণ করবে।
* `CHAR(n)`: ভ্যারিয়েবল-লেংথ স্ট্রিং, ক্যারেক্টারের সংখ্যা n এর মধ্যে থাকলে যতটুকু দরকার ততটুকুই জায়গা নেবে।

উদাহরণ:
`CHAR(10)`-  এ যদি 'Cat' রাখা হয়, তাহলে এটি 'Cat ' হিসেবে সংরক্ষিত হবে।
`CHAR(10)`- এ 'Cat' রাখলে শুধু 'Cat'-ই থাকবে, অতিরিক্ত স্পেস থাকবে না।


### 5. SELECT স্টেটমেন্টে WHERE ক্লজের উদ্দেশ্য কী?

`WHERE` ক্লজের মাধ্যমে ডেটা ফিল্টার করা হয়। এটি নির্দিষ্ট শর্ত অনুযায়ী রেকর্ড নির্বাচন করতে ব্যবহৃত হয়।

উদাহরণ:
```
SELECT * FROM customers
WHERE region = 'Dhaka';

```

উপরের কুয়েরিটি শুধুমাত্র `Dhaka` অঞ্চলের কাস্টোমারদের তথ্য রিটার্ন করবে।



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

