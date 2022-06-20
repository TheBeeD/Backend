<?

include "info.php";

function readUser() {
    $this->connexion();
    $rus = $this->idu->prepare("SELECT * FROM T_D_user_usr");
    $rus->execute();  
    return $res;
}


?>    