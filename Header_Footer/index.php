<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            // echo '<div class="adminPage">';
            // echo '<div class="fold-container shadow form-admin">';
             
            // echo "<H1 class='form-legend'>Bienvenue Administrateur</H1>";
                  
            // echo '</div>';
            // echo '</div>'; 
            echo '<div class="adminPage">';
            echo '<div  class="fold-container shadow form-admin">';   
            
            // On affiche chaque produit un à un
            foreach ($produits as $produit) {
             echo '<div class="_folderHotline">';
             echo $produit['PRD_DESCRIPTION'];
             echo '<img src='. $produit['PRD_PICTURE'].'>'.'<br/>';
            if ('PRD_PICTURE') IS_NULL (
                    echo :'<img src=img/defaut.png>'
            );
                echo 'Prix: '.$produit['PRD_PRICE'].'€'.'<br/>';
                echo '<br/><br/>';
            echo '</div>';
            }
           
        
            echo '</div>';
            echo '</div>';
            echo '</div>';
            ?>

   
   <?php

            echo "</main>";
    // FOOTER
     include "footer.php";
?>
</body>
</html>