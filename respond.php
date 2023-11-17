<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Receto | Choix de recette</title>
    <link rel="stylesheet" href="./css/style.css">
</head>
<body>
    <?php
        include("recipe.html");
        $recipe_name = $_POST['nameRecipe'];
        $recipe_quantity = $_POST['quantity'];

        $servername = "10.187.52.4";
        $username = "renaudm";
        $password = "renaudm";
        $dbname = "renaudm_b";
    
        $bdd = new mysqli("$servername", "$username", "$password", "$dbname");
        if ($bdd->connect_errno) {
            die("Connection failed: " . $bdd->connect_error);
        }
        echo "<div class='container-main'>";
        $requete = "SELECT * FROM `Recette` WHERE nom='$recipe_name'";
        $result = $bdd->query($requete);
        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $recipe_type = $row["type"];
            $recipe_nPerson = $row["nbpersonne"];
            $recipe_id = $row["id"];

            $requete = "SELECT SUM(CASE WHEN Ingredient.type = 'UNITE' THEN Ingredient.prix * Quantite.quantite WHEN Ingredient.type = 'KILO' THEN Ingredient.prix * Quantite.quantite / 1000 END) AS prix_total FROM Recette
            JOIN Quantite ON Recette.id = Quantite.id_recette
            JOIN Ingredient ON Quantite.id_ingredient = Ingredient.id
            WHERE Recette.id = $recipe_id AND (Ingredient.type = 'UNITE' OR Ingredient.type = 'KILO');";
        
            $result = $bdd->query($requete);
            if ($result->num_rows > 0) {
                $row = $result->fetch_assoc();
                if ($row["prix_total"] == 0) {
                    echo "<p>Aucun résultat trouvé.</p>";
                } 
                else{
                    echo "<h1 class='title-medium'>$recipe_name </h1>";
                    echo "<p>Prix : " . round($row["prix_total"]*$recipe_quantity, 2) . " euros pour " . $recipe_nPerson ." personne(s)</p>";
                    echo "<p>Quantitée : ". $recipe_quantity;
                    echo "<p>Type : ". $recipe_type ."</p>";
                    // echo "<h1 class='title-medium'>Composition</h1>";
                }
            } else {
                echo "<p>Aucun résultat trouvé.</p>";
            }

        } else {
            echo "<p>Aucune recette $recipe_name trouvé.</p>";
        }
        echo "</div>";
    ?>
</body>
</html>