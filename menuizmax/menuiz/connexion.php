<?php
   try{
      $pdo=new PDO("mysql:host=localhost;dbname=menuiz-jo","root","");
   }
   catch(PDOException $e){
      echo $e->getMessage();
   }
?>