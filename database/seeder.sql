-- First, add description column to stores table
ALTER TABLE stores
    ADD COLUMN description TEXT;

-- Insert locations (Belgian fashion retail locations)
INSERT INTO locations (street, number, postal_code, city, country)
VALUES ('Avenue Louise', '71A', '1050', 'Brussels', 'Belgium'),
       ('Meir', '67', '2000', 'Antwerp', 'Belgium'),
       ('Veldstraat', '23', '9000', 'Ghent', 'Belgium'),
       ('Rue de l''Ange', '45', '5000', 'Namur', 'Belgium'),
       ('Hoogstraat', '27', '8000', 'Bruges', 'Belgium'),
       ('Korte Gasthuisstraat', '32', '2000', 'Antwerp', 'Belgium'),
       ('Kapelstraat', '17', '2540', 'Hove', 'Belgium'),
       ('Korenmarkt', '55', '9000', 'Ghent', 'Belgium'),
       ('Rue Neuve', '123', '1000', 'Brussels', 'Belgium'),
       ('Chaussée de Louvain', '300', '1030', 'Brussels', 'Belgium'),
       ('Sint-Pietersnieuwstraat', '152', '9000', 'Ghent', 'Belgium'),
       ('Warandeberg', '3', '1000', 'Brussels', 'Belgium'),
       ('Bondgenotenlaan', '45', '3000', 'Leuven', 'Belgium'),
       ('Groenplaats', '21', '2000', 'Antwerp', 'Belgium'),
       ('Kortrijksesteenweg', '1042', '9000', 'Ghent', 'Belgium'),
       ('Zuidlaan', '25', '9200', 'Dendermonde', 'Belgium'),
       ('Kustlaan', '269', '8300', 'Knokke-Heist', 'Belgium'),
       ('Lippenslaan', '96', '8300', 'Knokke-Heist', 'Belgium'),
       ('Nieuwstraat', '41', '2000', 'Antwerp', 'Belgium'),
       ('Anspach Center', '2', '1000', 'Brussels', 'Belgium');

-- Insert stores (Belgian sustainable fashion retailers) with descriptions
INSERT INTO stores (name, location_id, description)
VALUES ('COSH! Antwerp', 1,
        'Premier sustainable fashion destination in Antwerp showcasing carefully curated eco-friendly brands.'),
       ('Harvest Club', 2,
        'Ethical fashion collective featuring local Belgian designers and sustainable international brands.'),
       ('Tales of Mystery', 3,
        'Boutique specializing in sustainable luxury fashion and accessories with transparent supply chains.'),
       ('Green Fashion Hub', 4,
        'Multi-brand store dedicated to environmentally conscious fashion and circular economy principles.'),
       ('Conscious Collective', 5,
        'Collaborative retail space for sustainable fashion brands and eco-friendly accessories.'),
       ('Pure by Nature', 6,
        'Organic and natural fashion boutique focusing on sustainable materials and ethical production.'),
       ('EcoChic', 7, 'Trendy sustainable fashion store offering affordable eco-friendly clothing options.'),
       ('Sustainable Style Studio', 8, 'Fashion boutique dedicated to sustainable and ethical fashion choices.'),
       ('Green Wardrobe', 9, 'Curated collection of sustainable fashion brands and vintage pieces.'),
       ('Bio Boutique', 10, 'Specializing in organic cotton and sustainably produced fashion items.'),
       ('Eco Elegance', 11, 'High-end sustainable fashion destination featuring premium eco-friendly brands.'),
       ('Future Fashion', 12, 'Innovative sustainable fashion concept store with focus on circular fashion.'),
       ('The Green Room', 13, 'Sustainable fashion boutique with emphasis on local designers and ethical production.'),
       ('Conscious Couture', 14, 'Luxury sustainable fashion store featuring high-end eco-conscious brands.'),
       ('Earth Fashion', 15, 'Affordable sustainable fashion retailer with strong environmental commitment.'),
       ('Eco Essence', 16, 'Boutique specializing in sustainable basics and essential wear.'),
       ('Natural Threads', 17, 'Fashion store dedicated to natural and organic textile products.'),
       ('Sustainable Squad', 18, 'Young and trendy sustainable fashion collective.'),
       ('Green Glamour', 19, 'Premium sustainable fashion boutique with focus on occasion wear.'),
       ('Eco Evolution', 20, 'Contemporary sustainable fashion store with innovative eco-materials.');

-- Insert brands with sustainability ratings
INSERT INTO brands (name, label)
VALUES ('Organic Basics', 'A'),
       ('LN Knits', 'A'),
       ('Jules & Juliette', 'A'),
       ('Stanley/Stella', 'A'),
       ('HNST Jeans', 'A'),
       ('La Fille d''O', 'B'),
       ('Mayerline', 'B'),
       ('Atelier Content', 'B'),
       ('HUMANA', 'B'),
       ('BONJOUR MAURICE', 'B'),
       ('Bellerose', 'C'),
       ('Xandres', 'C'),
       ('Brooklyn', 'C'),
       ('CKS', 'C'),
       ('JBC', 'C'),
       ('Terre Bleue', 'D'),
       ('Caroline Biss', 'D'),
       ('River Woods', 'D'),
       ('Les Deux', 'D'),
       ('Lily & Lou', 'D');

-- Insert store-brand relationships (simplified for demo)
INSERT INTO store_brands (store_id, brand_id)
SELECT s.id, b.id
FROM stores s
         CROSS JOIN brands b
WHERE (s.id + b.id) % 4 = 0
   OR (s.id + b.id) % 3 = 0
LIMIT 60;

-- Insert opening hours
INSERT INTO opening_hours (store_id, details)
VALUES (1, 'Mon-Sat: 10:00-18:00, Sun: Closed'),
       (2, 'Mon-Sat: 09:30-18:30, Sun: Closed'),
       (3, 'Tue-Sat: 10:00-18:00, Sun-Mon: Closed'),
       (4, 'Mon-Sat: 10:00-19:00, Sun: 13:00-17:00'),
       (5, 'Mon-Sat: 09:00-18:00, Sun: Closed'),
       (6, 'Mon-Sat: 10:00-18:00, Sun: Closed'),
       (7, 'Tue-Sat: 10:00-18:00, Sun-Mon: Closed'),
       (8, 'Mon-Sat: 09:30-18:30, Sun: Closed'),
       (9, 'Mon-Sun: 10:00-19:00'),
       (10, 'Mon-Sat: 10:00-18:00, Sun: Closed'),
       (11, 'Mon-Sat: 09:00-18:00, Sun: Closed'),
       (12, 'Mon-Sat: 10:00-19:00, Sun: 13:00-17:00'),
       (13, 'Mon-Sat: 09:30-18:30, Sun: Closed'),
       (14, 'Mon-Sat: 10:00-18:00, Sun: Closed'),
       (15, 'Mon-Sun: 10:00-20:00'),
       (16, 'Tue-Sat: 10:00-18:00, Sun-Mon: Closed'),
       (17, 'Mon-Sat: 10:00-18:30, Sun: 13:00-18:00'),
       (18, 'Mon-Sat: 10:00-18:00, Sun: Closed'),
       (19, 'Mon-Sat: 09:30-18:30, Sun: Closed'),
       (20, 'Mon-Sun: 10:00-19:00');