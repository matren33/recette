-- Création de la table Recette
CREATE TABLE Recette (
    id INT PRIMARY KEY,
    nom VARCHAR(255),
    type VARCHAR(255),
    nbpersonne INT
);

-- Insertion des données dans la table Recette
INSERT INTO Recette (id, nom, type, nbpersonne)
VALUES (1, 'crepe', 'DESSERT', 2),
             (2, 'cake_chocolat', 'DESSERT', 6),
             (3, 'tarte_pomme', 'DESSERT', 8),
             (4, 'tarte_citron', 'DESSERT', 8);

-- Création de la table Ingrédient
CREATE TABLE Ingredient (
    id INT PRIMARY KEY,
    nom VARCHAR(255),
    type VARCHAR(255),
    prix DECIMAL(10, 2)
);

-- Insertion des données dans la table Ingrédient
INSERT INTO Ingredient (id, nom, type, prix)
VALUES (4, 'sucre', 'KILO', 0.75),
             (5, 'beurre', 'KILO', 1.79),
             (6, 'farine', 'KILO', 3.05),
             (7, 'chocolat', 'KILO', 9.25),
             (8, 'lait', 'KILO', 3.05),
             (9, 'oeuf', 'UNITE', 0.55),
             (10, 'sel', 'KILO', 0.45),
             (11, 'citron', 'UNITE', 0.5),
             (12, 'pomme', 'KILO', 4.5),
             (13, 'poire', 'KILO', 4.5);

-- Création de la table Quantité
CREATE TABLE Quantite (
    id INT PRIMARY KEY,
    id_recette INT,
    id_ingredient INT,
    quantite DECIMAL(10, 2),
    FOREIGN KEY (id_recette) REFERENCES Recette(id),
    FOREIGN KEY (id_ingredient) REFERENCES Ingredient(id)
);

-- Insertion des données dans la table Quantité
INSERT INTO Quantite (id, id_recette, id_ingredient, quantite)
VALUES (1, 1, 9, 2),
             (2, 1, 6, 200),
             (3, 1, 4, 30),
             (4, 1, 8, 40),
             (5, 1, 5, 40),
             (6, 2, 9, 3),
             (7, 2, 6, 100),
             (8, 2, 4, 100),
             (9, 2, 7, 200),
             (10, 2, 5, 80);

            -- Ajout des ingrédients pour la tarte aux pommes
            INSERT INTO Ingredient (id, nom, type, prix)
            VALUES (14, 'pâte brisée', 'KILO', 2.50),
                   (15, 'sucre vanillé', 'KILO', 1.20),
                   (16, 'cannelle', 'KILO', 3.50);

            -- Ajout des quantités pour la tarte aux pommes
            INSERT INTO Quantite (id, id_recette, id_ingredient, quantite)
            VALUES (11, 3, 14, 1),
                   (12, 3, 15, 0.5),
                   (13, 3, 16, 0.1),
                   (14, 3, 12, 1.5);

            -- Ajout des ingrédients pour la tarte au citron
            INSERT INTO Ingredient (id, nom, type, prix)
            VALUES (17, 'pâte sablée', 'KILO', 3.00),
                   (18, 'sucre', 'KILO', 0.75),
                   (19, 'beurre', 'KILO', 1.79);

            -- Ajout des quantités pour la tarte au citron
            INSERT INTO Quantite (id, id_recette, id_ingredient, quantite)
            VALUES (15, 4, 17, 1),
                   (16, 4, 11, 0.5),
                   (17, 4, 18, 0.25),
                   (18, 4, 19, 0.2),
                   (19, 4, 9, 2);
