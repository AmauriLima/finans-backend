CREATE DATABASE pilabfinans;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS users (
  id UUID NOT NULL UNIQUE DEFAULT uuid_generate_v4(),
  name VARCHAR NOT NULL,
  email VARCHAR UNIQUE NOT NULL,
  password VARCHAR NOT NULL,

  PRIMARY KEY(id)
);

CREATE TYPE type AS ENUM('1', '2');

CREATE TABLE IF NOT EXISTS incomes_and_expenses (
  id UUID NOT NULL UNIQUE DEFAULT uuid_generate_v4(),
  description VARCHAR,
  VALUE NUMERIC(15, 6) NOT NULL,
  owner UUID NOT NULL,
  type type NOT NULL,

  PRIMARY KEY(id),
  FOREIGN KEY(owner) REFERENCES users(id)
);
