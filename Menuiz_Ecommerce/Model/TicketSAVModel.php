<?php
require_once __DIR__ . '/../include/init.php';
class ModeleTicketDetail{
    
    private $idc;
    private function connexion()
    {

        $this->idc = new PDO("mysql:host=localhost;  dbname=menuiz", 'root', '');
     
    }

    public function lireTicket() {
        $this->connexion();
        $res = $this->idc->prepare("SELECT * FROM T_D_ticketSavDetail_tsd");
        $res->execute();  
        return $res;
    }

    public function InsertTicket($tsdIP, $interventionTime, $tsdDescription, $usr)
    {
        $this->connexion();
        $query = 'INSERT INTO T_D_ticketSavDetail_tsd
        ( 
            tsd_IP,
            tsd_INTERVENTIONTIME
            tsd_DESCRIPTION
            USR_ID
            
        )
         VALUES (
            :tsdIp,
            :interventiontime,
            :tsdDescription,
            :usr
        )'; 

        $stmt = $this->idc->prepare($query);
        $stmt->execute([
            ':tsdIp' => $tsdIP,
            ':interventiontime' => $interventionTime,
            ':tsdDescription' => $tsdDescription,
            ':usr' => $usr

        ]);
    }

};
//par alexis
?>
