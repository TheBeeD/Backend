<?php
require __DIR__ .'/../include/init.php';
require __DIR__ .'/../layout/top2.php';
hotlineSecurity();

if (isUserAdmin()){
?>
<a href="#" class="btn btn-primary">
  <div class="card-body">
    <h3 class="card-title">Créer Utilisateur</h3>
  </div>
</a>
<?php
}
?>
<a href="#" class="btn btn-primary">
  <div class="card-body">
    <h3 class="card-title">Liste Dossier SAV</h3>
    </div>
</a>
