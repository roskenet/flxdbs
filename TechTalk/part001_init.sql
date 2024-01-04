--| Create and fill with data
CREATE DATABASE tech_talk;

CREATE TABLE customer (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL);

CREATE TABLE public.order (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customer,
    address TEXT NOT NULL ,
    status TEXT DEFAULT 'OPEN',
    created_at TIMESTAMPTZ);

CREATE TABLE item (
    id SERIAL PRIMARY KEY,
    sku TEXT NOT NULL,
    item TEXT,
    price NUMERIC);

CREATE TABLE order_item (
    order_id INTEGER REFERENCES public.order,
    item_id INTEGER REFERENCES item,
    quantity INTEGER);