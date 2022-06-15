
<header>
        <nav>
            <?php
            if (isset($_SESSION['name'])){
               echo "<h3> Utilisateur : " .$_SESSION['name']."</h3>";
                echo '<a href="index.php">Accueil</a>';
            }
            ?>
            
         

            <img class="logo headLogo" src="img\MenuizMan_logo.png" alt="logo">
        </nav>
        </header>