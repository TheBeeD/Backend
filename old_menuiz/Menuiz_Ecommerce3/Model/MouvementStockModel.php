<?php
require_once __DIR__ . '/../include/init.php';
class ModeleMouvementStock{
    
    private $idc;
    private function connexion()
    {

        $this->idc = new PDO("mysql:host=localhost;  dbname=menuiz", 'root', '');
     
    }

    public function lireMouvement() {
        $this->connexion();
        $res = $this->idc->prepare("SELECT * FROM T_D_movestock_mvs");
        $res->execute();  
        return $res;
    }

    public function InsertMouvement($product, $countbuy, $countsell, $stock, $prdid, $prdprice, $ohr, $exp)
    {
        $this->connexion();
        $query = 'INSERT INTO T_D_movestock_mvs
        ( 
            mvs_product,
            mvs_countbuy,
            mvs_countSell,
            mvs_stock,
            prd_id,
            prd_price,
            ohr_id,
            exp_id
        )
         VALUES (
            :product,
            :countbuy,
            :countSell,
            :stock,
            :prd_id,
            :prd_price,
            :ohr_id,
            :exp_id

        )'; 

        $stmt = $this->idc->prepare($query);
        $stmt->execute([
            ':product' => $product,
            ':countbuy' => $countbuy,
            ':countSell' => $countsell,
            ':stock' => $stock,
            ':prd_id,' => $prdid,
            ':prd_price' => $prdprice,
            ':ohr_id' => $ohr,
            ':exp_id' => $exp

        ]);
    }
};

//par alexis le 28 juin
?>