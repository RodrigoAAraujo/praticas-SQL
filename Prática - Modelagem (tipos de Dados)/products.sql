CREATE TABLE products(
    id SERIAL PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    price INTEGER NOT NULL,
    main_photo_id INTEGER NOT NULL REFERENCES "photos"("id"),
    category_id INTEGER NOT NULL REFERENCES "categories"("id"),
    size_id INTEGER NOT NULL REFERENCES "sizes"("id")
)