DROP DATABASE IF EXISTS craigslist_db;
CREATE DATABASE craigslist_db;
\c craigslist_db;



CREATE TABLE regions
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE categories 
(
    id SERIAL PRIMARY KEY,
    name TEXT   NOT NULL
    
);

CREATE TABLE users 
(
    id SERIAL PRIMARY KEY,
    username VARCHAR(15) UNIQUE NOT NULL,
    password VARCHAR(20) NOT NULL,
    prefered_region_id INTEGER REFERENCES regions
);

CREATE TABLE posts 
(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    price FLOAT CHECK (price >= 0),
    user_id INTEGER REFERENCES users,
    region_id INTEGER REFERENCES regions,
    category_id INTEGER REFERENCES categories
);




INSERT INTO regions (name)
VALUES 
 ('San Francisco'),
('Atlanta'),
('Seattle');

INSERT INTO users (username, password, prefered_region_id)
VALUES
('MabelPines', 'MabelPinesfalls', 1),
('DipperPines', 'DipperPinesfalls', 2),
('GrunkleStan', 'GrunkleStanfalls', 3);

INSERT INTO categories (name)
VALUES
('Clothing'),
('Electronics'),
('Automotive');

INSERT INTO posts (title, description, price, user_id, region_id, category_id)
VALUES
('Large White Shirts', 'Selling pack of 10 large white shirts', 10, 1, 1, 1),
('Iphone 14', 'Selling used iphone 14', 150, 2,2,2),
('2014 Toyota Camry', 'Selling car. 150,000 miles', 6000, 3,3,3);



