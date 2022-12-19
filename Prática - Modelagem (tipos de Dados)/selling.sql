CREATE TABLE sells(
    id SERIAL PRIMARY KEY,
    address TEXT NOT NULL,
    buy_date DATE NOT NULL DEFAULT NOW(),
    user_id INTEGER NOT NULL REFERENCES "users"("id"),
    state_id INTEGER NOT NULL REFERENCES "states"("id")
)