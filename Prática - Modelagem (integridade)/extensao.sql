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
    cpf VARCHAR(11) NOT NULL,
    email TEXT NOT NULL,
    password TEXT NOT NULL,
    address_id INTEGER NOT NULL REFERENCES "customerAddresses"("id")
)

CREATE TABLE customerPhones(
    id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL REFERENCES "customers"("id"),
    number INTEGER(11) NOT NULL,
    type NOT NULL ENUM('landline', 'modile')
)

CREATE TABLE bankAccounts(
    id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL REFERENCES "customers"("id"),
    "accountNumber" TEXT NOT NULL,
    agency TEXT NOT NULL,
    "openDate" DATE NOT NULL,
    "closeDate" DATE DEFAULT NULL
)

CREATE TABLE transactions(
    id SERIAL PRIMARY KEY,
    bank_id INTEGER NOT NULL REFERENCES "bankAccounts"("id"),
    amount INTEGER NOT NULL,
    type ENUM('deposit', 'withdraw'),
    time DATETIME NOT NULL DEFAULT NOW(),
    description TEXT NOT NULL,
    cancelled BOOLEAN NOT NULL DEFAULT 0
)

CREATE TABLE creditCards(
    id SERIAL PRIMARY KEY,
    bank_id INTEGER NOT NULL REFERENCES "bankAccounts"("id"),
    name TEXT NOT NULL,
    number INTEGER NOT NULL,
    "securityNumber" VARCHAR(3) NOT NULL,
    "expirationMonth" INTEGER NOT NULL CHECK("expirationMonth" > 0 AND "expirationMonth" < 13),
    "expirationYear" INTEGER NOT NULL CHECK("expirationYear" >= YEAR(NOW())),
    password TEXT NOT NULL,
    limit INTEGER NOT NULL
)