CREATE TABLE categories
(
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL,
  type VARCHAR NOT NULL,
  tenant_id INT NOT NULL
);

CREATE TABLE accounts
(
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL,
  tenant_id INT NOT NULL
);

CREATE TABLE planned_income_operations
(
  id SERIAL PRIMARY KEY,
  description VARCHAR NOT NULL,
  tenant_id INT NOT NULL,
  category_id INT NOT NULL,
  amount MONEY NOT NULL
);

CREATE TABLE income_operations
(
  id SERIAL PRIMARY KEY,
  description VARCHAR NOT NULL,
  tenant_id INT NOT NULL,
  category_id INT NOT NULL,
  account_id INT NOT NULL,
  planned_operation_id INT NOT NULL,
  amount MONEY NOT NULL
);

CREATE TABLE tenants
(
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL
);

CREATE TABLE users
(
  id SERIAL PRIMARY KEY,
  username VARCHAR NOT NULL,
  password VARCHAR NOT NULL,
  tenant_id INT NOT NULL
);