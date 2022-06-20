<?


function readPayment() {
$this->connexion();
$rpm = $this->idp->prepare("SELECT * FROM T_D_paymenttype_pmt");
$rpm->execute();  
return $rpm;
};
?>