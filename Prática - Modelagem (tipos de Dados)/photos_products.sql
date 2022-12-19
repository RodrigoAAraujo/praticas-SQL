CREATE TABLE photos_products(
    id SERIAL PRIMARY KEY,
    product_id INTEGER NOT NULL REFERENCES "products"("id"),
    photo_id INTEGER NOT NULL REFERENCES "photos"("id")
)