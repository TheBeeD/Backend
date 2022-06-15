<?php
require_once __DIR__ .'pdo_login.php';




$errors = [];
$civilite= $nom = $prenom = $email = $username='';

if(!empty($_POST)){
    sanitizePost();
    extract($_POST);
    

    
    if (empty($_POST['nom'])){
        $errors[] = 'Le nom est obligatoire';
    }
    
    if (empty($_POST['prenom'])){
        $errors[] = 'Le prenom est obligatoire';
    }
    
    // test de la validité de l'adresse email
    if (empty($_POST['email'])){
        $errors[] = "L\'email est obligatoire";
    } elseif(!filter_var($email, FILTER_VALIDATE_EMAIL)){
       $errors[] = "L\'email n\'est pas valide";
    } else { // test de l'unicité de l'adresse en bdd
        $query = 'SELECT count(*) FROM td_user_usr WHERE USR_MAIL = :email';
        $stmt = $pdo->prepare($query);
        
        $stmt ->execute([':email' => $_POST['email']]);
        $nb = $stmt->fetchColumn();
        
        if($nb != 0){
            $errors[] = "Cet email est deja utilisé";
        }
    }
    
    

    if (empty($_POST['email'])){
        $errors[] = 'Un email est obligatoire';
    } 
    
    if (empty($_POST['mdp'])){
        $errors[] = 'Le mot de passe est obligatoire';
}else if(!preg_match('/^[a-zA-Z0-9_-]{6,20}$/', $_POST['mdp'])){
        $errors[] = 'Le mot de passe doit faire entre 6 et 20 caractères'
                . 'et ne contenir que des chiffres ou des lettres'
                . 'ou les caractères _ et -';
    }
    
     if ($_POST['mdp'] != $_POST['mdp_confirm'] ){
        $errors[] = 'Le mot de passe et sa confirmation ne sont pas identiques ';
    }
    
if (empty($error)){

   
      $stmt = $pdo->prepare($query);
      $stmt ->execute([
       ':nom' => $_POST['USR_FIRSTNAME'],
       ':prenom' => $_POST['USR_LASTNAME'],
       ':email' => $_POST['USR_MAIL'],
       // enregistrement du mot de passe a l'enregistrement
       ':mdp' =>password_hash($_POST['USR_PASSWORD'], PASSWORD_BCRYPT),
       ':civilite' => $_POST['USR_CIVILITE'],
   
      ]);
      
      setFlashMessage('Votre compte est crée');
      header('Location: index.php');
      die;
   }
}

require __DIR__ .'/layout/top.php';

if (!empty($errors)) :
?>
<div class="alert alert-danger">
    <h5 class="alert-heading">Le formulaire contient des erreurs</h5>
    <?= implode('<br>', $errors);  ?>
</div>
<?php
endif;
?>

<h1>Inscription</h1>
<form method="post" class="inscrip_form">
    <div class="form-group">
        <label>Civilité</label>
        <select name="civilite" class="form-control">
            <option value=""></option>
            <option value="Mme" <?php if ($civilite == 'Mme'){echo 'selected';}?>>Mme</option>
            <option value="M." <?php if ($civilite == 'M.'){echo 'selected';}?>>M.</option>
        </select>
    </div>
    <div class="form-group">
        <label>Nom</label>
        <input type="text" name="nom" class="form-control" value="<?= $nom; ?>">
    </div>
    <div class="form-group">
        <label>Prenom</label>
        <input type="text" name="prenom" class="form-control" value="<?= $prenom ?>">
    </div>
    <div class="form-group">
        <label>Email</label>
        <input type="text" name="email" class="form-control" value="<?= $email; ?>">
    </div>
    <div class="form-group">
        <label>Ville</label>
        <input type="text" name="ville" class="form-control" value="<?= $ville; ?>">
    </div>
    <div class="form-group">
        <label>Code postal</label>
        <input type="text" name="cp" class="form-control" value="<?= $cp; ?>">
    </div>
    <div class="form-group">
        <label>Adresse</label>
        <textarea name="adresse" class="form-control"><?= $adresse; ?></textarea>
    </div>
    <div class="form-group">
        <label>Mot de passe</label>
        <input type="password" name="mdp" class="form-control">
    </div>
    <div class="form-group">
        <label>Confirmation du mot de passe</label>
        <input type="password" name="mdp_confirm" class="form-control">
    </div>
    <div class="form-btn-group text-right">
        <button type="submit" class="btn btn-primary">Valider</button>
    </div>
</form>
<script>
var test = '<?= 'test' ?>;
</script>        
<?php
require __DIR__ .'/layout/bottom.php';
?>