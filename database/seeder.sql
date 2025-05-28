-- Insert store types
INSERT INTO "types" (name, description)
VALUES ('Fashion', 'Sustainable fashion and clothing stores'),
       ('Lifestyle', 'Eco-friendly lifestyle and home products');

-- Insert statements
INSERT INTO statements ("statement")
VALUES ('Getting necessary data from the website...'),
       ('Cosh eco is a platform for sustainable fashion and lifestyle brands.'),
       ('Thank you for using cosh! :)'),
       ('Loading...'),
       ('Adding the final touches...');


-- Insert locations from cosh.eco
INSERT INTO locations (street, number, postal_code, city, country)
VALUES ('Huidevettersstraat', '46', '2000', 'Antwerp', 'Belgium'),
       ('Everdijstraat', '35', '2000', 'Antwerp', 'Belgium'),
       ('Sint-Jorispoort', '21-23', '2000', 'Antwerp', 'Belgium'),
       ('Nationalestraat', '81', '2000', 'Antwerp', 'Belgium'),
       ('Schuttershofstraat', '9', '2000', 'Antwerp', 'Belgium'),
       ('Vestingstraat', '10', '2018', 'Antwerp', 'Belgium'),
       ('Groendalstraat', '15', '2000', 'Antwerp', 'Belgium'),
       ('Kammenstraat', '27', '2000', 'Antwerp', 'Belgium'),
       ('Kloosterstraat', '27', '2000', 'Antwerp', 'Belgium'),
       ('Leopoldstraat', '3', '2000', 'Antwerp', 'Belgium');

-- Insert stores from cosh.eco
INSERT INTO stores (name, description, location_id)
VALUES ('STAY', 'Sustainable fashion and lifestyle store', 1),
       ('Lisa Ray', 'Conscious fashion boutique', 2),
       ('Atelier Beau', 'Sustainable fashion concept store', 3),
       ('Supergoods', 'Eco-friendly fashion and lifestyle', 4),
       ('Het Strand', 'Conscious fashion and swimwear', 5),
       ('Rewind Antwerp', 'Second-hand luxury fashion', 6),
       ('Clinic by CG', 'Sustainable designer fashion', 7),
       ('ENES', 'Ethical fashion and accessories', 8),
       ('UNIKOO', 'Fair fashion boutique', 9),
       ('Just Hazel', 'Sustainable fashion and gifts', 10);

-- Insert brands with cosh.eco labels  
INSERT INTO brands (name, label)
VALUES ('STAY', 'A'),
       ('LRAY', 'B'),
       ('BEAU', 'A'),
       ('SGOOD', 'A'),
       ('STRAN', 'B'),
       ('REWIN', 'B'),
       ('CLINC', 'A'),
       ('ENES', 'B'),
       ('UNIKO', 'A'),
       ('HAZL', 'B');

-- Create store-brand relationships
INSERT INTO store_brands (store_id, brand_id)
SELECT s.id, b.id
FROM stores s
         CROSS JOIN brands b
WHERE s.name LIKE '%' || substring(b.name from 1 for 3) || '%';

-- Insert store types relationships
INSERT INTO store_types (store_id, "type_id")
SELECT s.id, t.id
FROM stores s
         CROSS JOIN "types" t;

-- Insert opening hours for each day including closed days and split schedules
INSERT INTO opening_hours (day, openingAt, closingAt, openingAtAfterNoon, closingAtAfterNoon, store_id)
VALUES
-- STAY
('monday', 'closed', 'closed', null, null, 1),
('tuesday', '11:00', '18:00', null, null, 1),
('wednesday', '11:00', '18:00', null, null, 1),
('thursday', '11:00', '18:00', null, null, 1),
('friday', '11:00', '18:00', null, null, 1),
('saturday', '11:00', '18:00', null, null, 1),
('sunday', 'closed', 'closed', null, null, 1);

-- Lisa Ray
('monday', 'closed', 'closed', null, null, 2),
('tuesday', '10:00', '13:00', '14:00', '18:00', 2),
('wednesday', '10:00', '18:00', null, null, 2),
('thursday', '10:00', '18:00', null, null, 2),
('friday', '10:00', '18:00', null, null, 2),
('saturday', '10:00', '18:00', null, null, 2),
('sunday', 'closed', 'closed', null, null, 2);

-- Atelier Beau
('monday', '11:00', '18:00', null, null, 3),
('tuesday', '11:00', '18:00', null, null, 3),
('wednesday', '11:00', '18:00', null, null, 3),
('thursday', '11:00', '18:00', null, null, 3),
('friday', '11:00', '18:00', null, null, 3),
('saturday', '11:00', '18:00', null, null, 3),
('sunday', 'closed', 'closed', null, null, 3),

-- Supergoods
('monday', '10:30', '18:00', null, null, 4),
('tuesday', '10:30', '18:00', null, null, 4),
('wednesday', '10:30', '18:00', null, null, 4),
('thursday', '10:30', '18:00', null, null, 4),
('friday', '10:30', '18:00', null, null, 4),
('saturday', '10:30', '18:00', null, null, 4),
('sunday', 'closed', 'closed', null, null, 4),

-- Het Strand
('monday', 'closed', 'closed', null, null, 5),
('tuesday', '10:00', '18:00', null, null, 5),
('wednesday', '10:00', '18:00', null, null, 5),
('thursday', '10:00', '18:00', null, null, 5),
('friday', '10:00', '18:00', null, null, 5),
('saturday', '10:00', '18:00', null, null, 5),
('sunday', 'closed', 'closed', null, null, 5),

-- Rewind Antwerp
('monday', 'closed', 'closed', null, null, 6),
('tuesday', '11:00', '18:00', null, null, 6),
('wednesday', '11:00', '18:00', null, null, 6),
('thursday', '11:00', '18:00', null, null, 6),
('friday', '11:00', '18:00', null, null, 6),
('saturday', '11:00', '17:00', null, null, 6),
('sunday', 'closed', 'closed', null, null, 6),

-- Clinic by CG
('monday', '10:00', '18:00', null, null, 7),
('tuesday', '10:00', '18:00', null, null, 7),
('wednesday', '10:00', '18:00', null, null, 7),
('thursday', '10:00', '18:00', null, null, 7),
('friday', '10:00', '18:00', null, null, 7),
('saturday', '10:00', '18:00', null, null, 7),
('sunday', 'closed', 'closed', null, null, 7),

-- ENES
('monday', 'closed', 'closed', null, null, 8),
('tuesday', '11:00', '18:00', null, null, 8),
('wednesday', '11:00', '18:00', null, null, 8),
('thursday', '11:00', '18:00', null, null, 8),
('friday', '11:00', '18:00', null, null, 8),
('saturday', '11:00', '18:00', null, null, 8),
('sunday', 'closed', 'closed', null, null, 8),

-- UNIKOO
('monday', 'closed', 'closed', null, null, 9),
('tuesday', '10:30', '18:00', null, null, 9),
('wednesday', '10:30', '18:00', null, null, 9),
('thursday', '10:30', '18:00', null, null, 9),
('friday', '10:30', '18:00', null, null, 9),
('saturday', '10:30', '18:00', null, null, 9),
('sunday', 'closed', 'closed', null, null, 9),

-- Just Hazel
('monday', 'closed', 'closed', null, null, 10),
('tuesday', '11:00', '18:00', null, null, 10),
('wednesday', '11:00', '18:00', null, null, 10),
('thursday', '11:00', '18:00', null, null, 10),
('friday', '11:00', '18:00', null, null, 10),
('saturday', '11:00', '18:00', null, null, 10),
('sunday', 'closed', 'closed', null, null, 10);