<?php
require_once __DIR__ . '/../include/init.php';
class ModeleDossierSAV{
    
    private $idc;
    private function connexion()
    {

        $this->idc = new PDO("mysql:host=localhost;  dbname=menuiz", 'root', '');
     
    }

    public function lireDossier() {
        $this->connexion();
        $res = $this->idc->prepare("SELECT * FROM T_D_customerservicefolder_csf");
        $res->execute();  
        return $res;
    }

    public function lireDossierViaUser($USRPrenom, $USRNom) {
        $this->connexion();
        $res = $this->idc->prepare("SELECT csf.* FROM T_D_customerservicefolder_csf csf inner join t_d_user_usr usr on csf.USR_ID WHERE usr.USR_FIRSTNAME = ?, usr.USR_LASTNAME = ?");
        $res->execute($USRPrenom, $USRNom);  
        return $res;
    }

    public function lireDossierViaDate($date) {
        $this->connexion();
        $res = $this->idc->prepare("SELECT csf.* FROM T_D_customerservicefolder_csf csf inner join t_d_ticketSavDetail_tsd tsd on csf.TSD_ID WHERE tsd.tsd_interventiontime = ?");
        $res->execute($date);  
        return $res;
    }

    public function InsertDossier($csfStatus, $csfDescription, $ohr, $usr, $prd, $tsd)
    {
        $this->connexion();
        $query = 'INSERT INTO T_D_customerservicefolder_csf
        ( 
            CSF_STATUS,
            CSF_DESCRIPTION,
            OHR_ID,
            USR_ID,
            PRD_ID,
            TSD_ID
            
        )
         VALUES (
            :csfStatus,
            :csfDescription,
            :ohr,
            :usr,
            :prd,
            :tsd
        )'; 

        $stmt = $this->idc->prepare($query);
        $stmt->execute([
            ':csfStatus' => $csfStatus,
            ':csfDescription' => $csfDescription,
            ':ohr' => $ohr,
            ':usr' => $usr,
            ':prd' => $prd,
            ':tsd' => $tsd

        ]);
    }

};

//par alexis le 27 et 28 juin
?>