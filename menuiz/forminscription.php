<?php
session_start();

include("header.php");
include("infos.php");

@$valider = $_POST["inscrire"];
$erreur = "";
if (isset($valider)) {

    if (empty($nom)) $erreur = "Le champs nom est obligatoire !";
    elseif (empty($prenom)) $erreur = "Le champs prénom est obligatoire !";
    elseif (empty($pseudo)) $erreur = "Le champs Pseudo est obligatoire !";
    elseif (empty($password)) $erreur = "Le champs mot de passe est obligatoire !";
    elseif ($password != $passwordConf) $erreur = "Mots de passe differents !";
    else {
    
        include("connexion.php");
        $verify_pseudo = $pdo->prepare("select USR_ID from t_d_user_usr where USR_USERNAME = ? limit 1");
        $verify_pseudo -> execute(array($pseudo));
        $user_pseudo = $verify_pseudo->fetchAll();
        if (count ($user_pseudo)>0)
        $erreur = "Ce Pseudo éxiste déjà ! ";
        else {
            $ins = $pdo->prepare("insert into t_d_user_usr(USR_CIVILITE, USR_LASTNAME, USR_FIRSTNAME, USR_USERNAME, USR_PASSWORD, USR_MAIL) value(?,?,?,?,?,?)");
            if($ins->execute(array($genre, $nom, $prenom, $pseudo, sha1($password), $email )))
            header("location:pdo_login.php");
        }
    }
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inscription</title>
    <style>
* {
font-family: arial;
}
body {
margin: 20px;
}
form {
position: absolute;
top: 50%;
left: 50%;
margin-left: -150px;
margin-top: -80px;
}
h1 {
text-align: center;
color: #FFFAFA;
background: #5292e6cb;
}
select, input[type=submit] {
border: 1px solid black;
margin-bottom: 10px;
float: right;
padding: 15px;
outline: none;
border-radius: 3px;
width: 120px;
}
input[type=text],
[type=password],[type=email] {
border: 1px solid black;
margin-bottom: 10px;
padding: 16px;
outline: none;
border-radius: 3px;
width: 300px;
}
.erreur {
text-align: center;
color: red;
margin-top: 11px;
 
}
a {
font-size: 12pt;
color: darkblue;
text-decoration: none;
font-weight: normal;
}
a:hover {
text-decoration: underline;
}
</style>
<link rel="stylesheet" href="CSS/style.css">
</head>
<body>
    <h1>Inscription</h1>  
    <div class="erreur"><?= $erreur ?></div>
    <form name= "fo" method= "post" action="">
    <select name="genre" id="genre" value="<?=  $genre  ?>" >
    <option value="">--Civilité--</option><br/><br/>
    <option value="Mr">Monsieur</option>
    <option value="Mme">Madame</option>    
    <input  type="text"  name="nom"  placeholder="Nom"  value="<?=  $nom  ?>"  /><br  />
    <input  type="text"  name="prenom"  placeholder="Prénom"  value="<?=  $prenom  ?>"  /><br  />
    <input  type="text"  name="pseudo"  placeholder="Votre Pseudo"  value="<?=  $pseudo  ?>"  /><br  />
    <input  type="email" name="email" placeholder="Votre adresse mail"/> <br>
    <input  type="password"  name="password"  placeholder="Mot de passe"  /><br  />
    <input  type="password"  name="passconf"  placeholder="Confirmation du Mot de passe"  /><br  />
    <input  type="submit"  name="inscrire"  value="S'inscrire"  />
    <a  href="pdo_login.php">Déjà un compte ?</a>
    </form>


</body>
</html>

  