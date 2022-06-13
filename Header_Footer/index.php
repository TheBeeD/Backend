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
 // HEADER
 include "header.php";
            echo "<main>";
            echo "<input type=\"text\" class=\"form-control\" name=\"\" id=\"search\" placeholder=\"Recherche\">";
            echo '<div id="admin-box" class="box-container">';
            echo '<div class="adminPage">';
            echo '<div class="fold-container shadow form-admin">';
             
            echo "<H1 class='form-legend'>Bienvenue Administrateur</H1>";
                  
            echo '</div>';
            echo '</div>'; 
            echo '<div class="adminPage">';
            echo '<div  class="fold-container shadow form-admin">';
            echo '<div class="_folderHotline">';
            echo '<img src="img/cloture1_1.png">';
            echo '<p>Clôture aluminium sur mesure Athene</p>';
            echo '<h2>202€04</h2>';

            echo '</div>';
            echo '<div class="_folderHotline">';
            echo '<img src="img/cloture2_2.png">';
            echo '<p>Clôture sur mesure Nauplie</p>';
            echo '<h2>218€35</h2>';
            echo '</div>';
            echo '</div>';
            echo '</div>';
            echo '</div>';
       

   
   

            echo "</main>";
    // FOOTER
     include "footer.php";
?>
</body>
</html>