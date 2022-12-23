CREATE TABLE states(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
)

CREATE TABLE cities(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    state_id INTEGER NOT NULL REFERENCES "states"("id") 
)

CREATE TABLE addresses(
    id SERIAL PRIMARY KEY,
    street TEXT NOT NULL,
    number TEXT NOT NULL,
    square TEXT NOT NULL,
    complement TEXT NOT NULL,
    "postalCode" TEXT NOT NULL,
    city_id INTEGER NOT NULL REFERENCES "cities"("id") 
)

CREATE TABLE clients(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    address_id INTEGER NOT NULL REFERENCES "addresses"("id")
)

CREATE TABLE phones(
    id SERIAL PRIMARY KEY,
    phone TEXT NOT NULL
    client_id INTEGER NOT NULL REFERENCES "clients"("id")
)

CREATE TABLE categories(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
)

CREATE TABLE movies(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    category_id INTEGER NOT NULL REFERENCES "categories"("id")
)

CREATE TABLE countries(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
)

CREATE TABLE actors(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    country_from_id INTEGER NOT NULL REFERENCES "countries"("id"),
    birth_date DATE NOT NULL
)

CREATE TABLE movies_actors(
    id SERIAL PRIMARY KEY,
    movie_id INTEGER NOT NULL REFERENCES "movies"("id"),
    actor_id INTEGER NOT NULL REFERENCES "actors"("id")
)

CREATE TABLE discs(
    id SERIAL PRIMARY KEY,
    code VARCHAR(128) NOT NULL,
    number VARCHAR(28) NOT NULL,
    movie_id INTEGER NOT NULL REFERENCES "movies"("id")
)

CREATE TABLE locations(
    id SERIAL PRIMARY KEY,
    client_id INTEGER NOT NULL REFERENCES "clients"("id"),
    start_date DATE NOT NULL DEFAULT NOW(),
    end_date DATE NOT NULL,
    movie_rate INTEGER NOT NULL CHECK(movie_rate > -1 AND movie_rate < 11),
    attendence_rate INTEGER NOT NULL CHECK(attendence_rate > -1 AND attendence_rate < 11)
)

CREATE TABLE discs_locations(
    id SERIAL PRIMARY KEY,
    disc_id INTEGER NOT NULL REFERENCES "discs"("id"),
    location_id INTEGER NOT NULL REFERENCES "locations"("id")
)