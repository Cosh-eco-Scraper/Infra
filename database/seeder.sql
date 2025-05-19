-- Insert locations
INSERT INTO locations (street, number, postal_code, city, country)
VALUES ('Meir', '2', '2000', 'Antwerp', 'Belgium'),
       ('Rue Neuve', '123', '1000', 'Brussels', 'Belgium'),
       ('Kalverstraat', '45', '1012', 'Amsterdam', 'Netherlands'),
       ('Oxford Street', '100', 'W1D 1LL', 'London', 'United Kingdom');

-- Insert stores
INSERT INTO stores (name, description, location_id)
VALUES ('EcoFashion Store', 'Sustainable fashion boutique featuring eco-friendly brands', 1),
       ('Green Wardrobe', 'Premium sustainable clothing and accessories', 2),
       ('Conscious Fashion Hub', 'Your destination for ethical fashion', 3),
       ('Sustainable Style Center', 'Making sustainable fashion accessible', 4);

-- Insert brands with cosh.eco labels
INSERT INTO brands (name, label)
VALUES ('Patagonia', 'A'),
       ('Veja', 'A'),
       ('Mud Jeans', 'A'),
       ('Armed Angels', 'B'),
       ('People Tree', 'B'),
       ('Thought Clothing', 'B'),
       ('Knowledge Cotton', 'C'),
       ('Stanley/Stella', 'C');

-- Create store-brand relationships
INSERT INTO store_brands (store_id, brand_id)
VALUES (1, 1),
       (1, 2),
       (1, 3), -- EcoFashion Store carries A-label brands
       (2, 1),
       (2, 4),
       (2, 5), -- Green Wardrobe carries mix of A and B
       (3, 6),
       (3, 7),
       (3, 8), -- Conscious Fashion Hub carries B and C
       (4, 2),
       (4, 5),
       (4, 8);
-- Sustainable Style Center carries mix of all

-- Insert opening hours
INSERT INTO opening_hours (day, openingAt, closingAt, store_id)
VALUES
-- EcoFashion Store
('monday', '09:00', '18:00', 1),
('tuesday', '09:00', '18:00', 1),
('wednesday', '09:00', '18:00', 1),
('thursday', '09:00', '20:00', 1),
('friday', '09:00', '20:00', 1),
('saturday', '10:00', '18:00', 1),
('sunday', 'closed', 'closed', 1),

-- Green Wardrobe
('monday', '10:00', '18:00', 2),
('tuesday', '10:00', '18:00', 2),
('wednesday', '10:00', '18:00', 2),
('thursday', '10:00', '21:00', 2),
('friday', '10:00', '21:00', 2),
('saturday', '10:00', '18:00', 2),
('sunday', '12:00', '17:00', 2),

-- Conscious Fashion Hub
('monday', '11:00', '19:00', 3),
('tuesday', '11:00', '19:00', 3),
('wednesday', '11:00', '19:00', 3),
('thursday', '11:00', '19:00', 3),
('friday', '11:00', '21:00', 3),
('saturday', '10:00', '18:00', 3),
('sunday', 'closed', 'closed', 3),

-- Sustainable Style Center
('monday', '10:00', '19:00', 4),
('tuesday', '10:00', '19:00', 4),
('wednesday', '10:00', '19:00', 4),
('thursday', '10:00', '21:00', 4),
('friday', '10:00', '21:00', 4),
('saturday', '09:00', '18:00', 4),
('sunday', '11:00', '17:00', 4);