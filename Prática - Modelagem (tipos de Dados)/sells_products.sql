CREATE TABLE sells_products(
    id SERIAL PRIMARY KEY,
    sell_id INTEGER NOT NULL REFERENCES "sells"("id"),
    product_id INTEGER NOT NULL REFERENCES "products"("id"),
    qtd INTEGER NOT NULL
)