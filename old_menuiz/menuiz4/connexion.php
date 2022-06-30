<?php
   try{
      $pdo=new PDO("mysql:host=localhost;dbname=menuiz2","root","");
   }
   catch(PDOException $e){
      echo $e->getMessage();
   }
?>