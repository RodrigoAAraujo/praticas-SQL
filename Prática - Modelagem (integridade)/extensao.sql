CREATE TABLE states(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
)

CREATE TABLE cities(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    state_id INTEGER NOT NULL REFERENCES "states"("id") 
)

CREATE TABLE customerAddresses(
    id SERIAL PRIMARY KEY,
    street TEXT NOT NULL,
    number TEXT NOT NULL,
    complement TEXT NOT NULL,
    "postalCode" TEXT NOT NULL,
    city_id INTEGER NOT NULL REFERENCES "cities"("id")
)

CREATE TABLE customers(
    id SERIAL PRIMARY KEY,
    full_name TEXT NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    address_id INTEGER NOT NULL REFERENCES "customerAddresses"("id")
)

CREATE TYPE "phone" AS ENUM ('landline', 'mobile');

CREATE TABLE customerPhones(
    id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL REFERENCES "customers"("id"),
    number INTEGER(11) NOT NULL,
    type NOT NULL ENUM('landline', 'modile')
)

CREATE TABLE bankAccounts(
    id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL REFERENCES "customers"("id"),
    "accountNumber" TEXT NOT NULL UNIQUE,
    agency TEXT NOT NULL,
    "openDate" DATE NOT NULL DEFAULT NOW(),
    "closeDate" DATE
)

CREATE TYPE "transactions" AS ENUM ('deposit', 'withdraw');

CREATE TABLE transactions(
    id SERIAL PRIMARY KEY,
    bank_id INTEGER NOT NULL REFERENCES "bankAccounts"("id"),
    amount BIGINT NOT NULL,
    type ENUM('deposit', 'withdraw'),
    time DATETIME NOT NULL DEFAULT NOW(),
    description TEXT NOT NULL,
    cancelled BOOLEAN NOT NULL DEFAULT 'FALSE'
)

CREATE TABLE creditCards(
    id SERIAL PRIMARY KEY,
    bank_id INTEGER NOT NULL REFERENCES "bankAccounts"("id"),
    name TEXT NOT NULL,
    number INTEGER NOT NULL UNIQUE,
    "securityNumber" VARCHAR(3) NOT NULL,
    "expirationMonth" INTEGER NOT NULL CHECK("expirationMonth" > 0 AND "expirationMonth" < 13),
    "expirationYear" INTEGER NOT NULL CHECK("expirationYear" >= YEAR(NOW())),
    password TEXT NOT NULL,
    limit INTEGER NOT NULL
)