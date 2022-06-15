<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="CSS/style.css">

    <title>Accueil </title>
</head>
<body>   
<?php 
session_start();
Try {
$db = new PDO('mysql:host=localhost;dbname=menuiz;charset=utf8', 'root', '');
}
catch (Exception $e) {
die('Erreur : ' . $e->getMessage());
}
?> 
<?php
$produitStatement = $db->prepare('SELECT * FROM t_d_product_prd');
?>
<?php
$produitStatement -> execute();
$produits = $produitStatement->fetchAll();
?>
  
 <?php
 // HEADER
 include "header.php";
            
            echo "<main>"; 
            echo "<input type=\"text\" class=\"form-control\" name=\"\" id=\"search\" placeholder=\"Recherche\">";
            echo '<div id="admin-box" class="box-container">';
            if (isset($_SESSION["name"])) {
                echo '<H2 class="form-legend">Bienvenue ' . $_SESSION['name'] . ' !</H2>'.'<br/>';
                echo '<br /><br /><a href="logout.php">Se déconnecter</a>';
            } else {
                header("location:pdo_login.php");
            }
         
           
        
            echo '</div>';
            echo '</div>';
            echo '</div>';
            ?>

   
   <?php

            echo "</main>";
            echo '<div  id ="adminpaage" class="adminPage">';
             
            
            // On affiche chaque produit un à un
            foreach ($produits as $produit) {
             echo '<div class="_folderHotline"';
             echo 'Produit:'.$produit['PRD_DESCRIPTION'].'<br/><br/>';
            //  echo '<img src='. $produit['PRD_PICTURE'].'>';
             if (empty($produit['PRD_PICTURE'])) {
                echo '<img src="img/defaut.png"/><br/>';
        } else {
                echo 'Produit:'.$produit['PRD_DESCRIPTION'].'<br/><br/>';
                echo '<img src="' . $produit['PRD_PICTURE'] . '"/>'.'<br/>';
        };
                echo 'Prix: '.$produit['PRD_PRICE'].'€'.'<br/>';
                echo '<br/><br/>';
            echo '</div>';
            
            
            }
    // FOOTER
     include "footer.php";
?>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

</body>
</html>