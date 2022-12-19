CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    name VARCHAR(70) NOT NULL,
    email TEXT NOT NULL,
    password TEXT NOT NULL,
)