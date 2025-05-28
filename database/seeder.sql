-- Insert store types
INSERT INTO store_type (name, description)
VALUES ('Fashion', 'Sustainable fashion and clothing stores'),
       ('Lifestyle', 'Eco-friendly lifestyle and home products');

-- Insert locations 
INSERT INTO locations (street, number, postal_code, city, country)
VALUES ('Kammenstraat', '81', '2000', 'Antwerp', 'Belgium'),
       ('Nationalestraat', '87', '2000', 'Antwerp', 'Belgium'),
       ('Groendalstraat', '17', '2000', 'Antwerp', 'Belgium'),
       ('Mechelsesteenweg', '35', '2018', 'Antwerp', 'Belgium'),
       ('Groenplaats', '17', '2000', 'Antwerp', 'Belgium'),
       ('Meir', '37', '2000', 'Antwerp', 'Belgium'),
       ('Hopland', '31', '2000', 'Antwerp', 'Belgium'),
       ('Schuttershofstraat', '39', '2000', 'Antwerp', 'Belgium'),
       ('Meir', '78', '2000', 'Antwerp', 'Belgium'),
       ('Wilde Zee', '9', '2000', 'Antwerp', 'Belgium');

-- Insert stores
INSERT INTO stores (name, description, location_id, store_type_id)
VALUES ('JUTTU', 'Sustainable fashion and lifestyle concept store', 1, 1),
       ('Harvest Club', 'Sustainable fashion boutique', 2, 1),
       ('Mandel Antwerp', 'Eco-friendly fashion store', 3, 1),
       ('Think Twice', 'Second-hand and vintage clothing', 4, 1),
       ('Labels Inc', 'Designer second-hand boutique', 5, 1),
       ('Episode', 'Vintage and second-hand fashion', 6, 1),
       ('Oxfam', 'Second-hand and fair trade store', 7, 1),
       ('Dries Van Noten', 'Luxury sustainable fashion', 8, 1),
       ('COS', 'Sustainable modern fashion', 9, 1),
       ('Your', 'Eco-friendly fashion and accessories', 10, 1);

-- Insert brands with cosh.eco labels
INSERT INTO brands (name, label)
VALUES ('JUTTU', 'A'),
       ('Harvest', 'A'),
       ('Mandel', 'B'),
       ('Think2', 'B'),
       ('Labels', 'A'),
       ('Episode', 'B'),
       ('Oxfam', 'A'),
       ('DVN', 'B'),
       ('COS', 'B'),
       ('Your', 'C');

-- Create store-brand relationships
INSERT INTO store_brands (store_id, brand_id)
SELECT s.id, b.id
FROM stores s
         CROSS JOIN brands b
WHERE s.name LIKE '%' || b.name || '%';

-- Insert opening hours for each day including closed days and split schedules
INSERT INTO opening_hours (day, openingAt, closingAt, openingAtAfterNoon, closingAtAfterNoon, store_id)
VALUES
-- JUTTU
('monday', '10:00', '13:00', '14:00', '18:00', 1),
('tuesday', '10:00', '18:00', null, null, 1),
('wednesday', '10:00', '18:00', null, null, 1),
('thursday', '10:00', '18:00', null, null, 1),
('friday', '10:00', '18:00', null, null, 1),
('saturday', '10:00', '18:00', null, null, 1),
('sunday', 'closed', 'closed', null, null, 1),

-- Harvest Club
('monday', 'closed', 'closed', null, null, 2),
('tuesday', '10:30', '13:00', '14:00', '18:00', 2),
('wednesday', '10:30', '18:00', null, null, 2),
('thursday', '10:30', '18:00', null, null, 2),
('friday', '10:30', '18:00', null, null, 2),
('saturday', '10:30', '18:00', null, null, 2),
('sunday', 'closed', 'closed', null, null, 2),

-- Mandel
('monday', '11:00', '18:00', null, null, 3),
('tuesday', '11:00', '13:00', '14:00', '18:00', 3),
('wednesday', '11:00', '18:00', null, null, 3),
('thursday', '11:00', '18:00', null, null, 3),
('friday', '11:00', '18:00', null, null, 3),
('saturday', '11:00', '18:00', null, null, 3),
('sunday', 'closed', 'closed', null, null, 3),

-- Think Twice
('monday', '10:00', '18:00', null, null, 4),
('tuesday', '10:00', '18:00', null, null, 4),
('wednesday', '10:00', '13:00', '14:00', '18:00', 4),
('thursday', '10:00', '20:00', null, null, 4),
('friday', '10:00', '18:00', null, null, 4),
('saturday', '10:00', '18:00', null, null, 4),
('sunday', 'closed', 'closed', null, null, 4),

-- Labels Inc
('monday', 'closed', 'closed', null, null, 5),
('tuesday', '10:30', '18:00', null, null, 5),
('wednesday', '10:30', '18:00', null, null, 5),
('thursday', '10:30', '13:00', '14:00', '18:00', 5),
('friday', '10:30', '18:00', null, null, 5),
('saturday', '10:30', '18:00', null, null, 5),
('sunday', 'closed', 'closed', null, null, 5),

-- Episode
('monday', '11:00', '18:00', null, null, 6),
('tuesday', '11:00', '18:00', null, null, 6),
('wednesday', '11:00', '18:00', null, null, 6),
('thursday', '11:00', '18:00', null, null, 6),
('friday', '11:00', '13:00', '14:00', '18:00', 6),
('saturday', '11:00', '18:00', null, null, 6),
('sunday', '12:00', '17:00', null, null, 6),

-- Oxfam
('monday', '10:00', '18:00', null, null, 7),
('tuesday', '10:00', '18:00', null, null, 7),
('wednesday', '10:00', '18:00', null, null, 7),
('thursday', '10:00', '18:00', null, null, 7),
('friday', '10:00', '18:00', null, null, 7),
('saturday', '10:00', '13:00', '14:00', '18:00', 7),
('sunday', 'closed', 'closed', null, null, 7),

-- Dries Van Noten
('monday', 'closed', 'closed', null, null, 8),
('tuesday', '10:00', '18:30', null, null, 8),
('wednesday', '10:00', '13:00', '14:00', '18:30', 8),
('thursday', '10:00', '18:30', null, null, 8),
('friday', '10:00', '18:30', null, null, 8),
('saturday', '10:00', '18:30', null, null, 8),
('sunday', 'closed', 'closed', null, null, 8),

-- COS
('monday', '10:00', '18:30', null, null, 9),
('tuesday', '10:00', '18:30', null, null, 9),
('wednesday', '10:00', '18:30', null, null, 9),
('thursday', '10:00', '20:00', null, null, 9),
('friday', '10:00', '13:00', '14:00', '18:30', 9),
('saturday', '10:00', '18:30', null, null, 9),
('sunday', '12:00', '17:00', null, null, 9),

-- Your
('monday', '10:30', '18:00', null, null, 10),
('tuesday', '10:30', '18:00', null, null, 10),
('wednesday', '10:30', '13:00', '14:00', '18:00', 10),
('thursday', '10:30', '18:00', null, null, 10),
('friday', '10:30', '18:00', null, null, 10),
('saturday', '10:30', '18:00', null, null, 10),
('sunday', 'closed', 'closed', null, null, 10);