<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>boucle for grossissement du texte à chaque ligne</title>
</head>
<body>
    <?php for ($i = 3; $i <= 7; $i++) {
        echo '<font size="'. $i . "\">Hello World !</font><br/>\n";
        }
        print ("<hr />\n");
    ?>
</body>
</html>