<?php
require_once __DIR__ . '/../include/init.php';
class ModeleHistoriqueDossier{
    
    private $idc;
    private function connexion()
    {

        $this->idc = new PDO("mysql:host=localhost;  dbname=menuiz", 'root', '');
     
    }

    public function lireHistorique() {
        $this->connexion();
        $res = $this->idc->prepare("SELECT * FROM T_D_histFolder_hfo");
        $res->execute();  
        return $res;
    }

    public function InsertHistorique($interventiontime,$tsd)
    {
        $this->connexion();
        $query = 'INSERT INTO T_D_movestock_mvs
        ( 
            hfo_interventiontime,
            tsd_id
        )
         VALUES (
            :interventiontime,
            :tsd

        )'; 

        $stmt = $this->idc->prepare($query);
        $stmt->execute([
            ':interventiontime' => $interventiontime,
            ':tsd' => $tsd
        ]);
    }



};

//par alexis le 28 et 29 juin
?>