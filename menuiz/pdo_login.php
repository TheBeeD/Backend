<?php  
 session_start();  
 $host = "localhost";  
 $username = "root";  
 $password = "";  
 $database = "menuiz2";  
 $message = ""; 
  // HEADER
  include "header.php"; 
 try
   
 {  
      $connect = new PDO("mysql:host=$host; dbname=$database", $username, $password);  
      $connect->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);  
      if(isset($_POST["login"]))  
      {  
           if(empty($_POST["username"]) || empty($_POST["password"]))  
           {  
                $message = '<label>All fields are required</label>';  
           }  
           else  
           {  
                $query = "SELECT * FROM t_d_user_usr WHERE USR_MAIL = :username AND USR_PASSWORD = sha1(:password)";  
                $statement = $connect->prepare($query);  
                $statement->execute(  
                     array(  
                          'username'     =>     $_POST["username"],  
                          'password'     =>     $_POST["password"]  
                     )  
                );  
                $users = $statement->fetchAll();
                $count = count($users);  
                if($count > 0)  
                {  
                    foreach($users as $user) {
                     $_SESSION["name"] = $user["USR_USERNAME"];  
                    }
                     header("location:index.php");  
                }  
                else  
                {  
                     $message = '<label>Wrong Data</label>';  
                }  
           }  
      }  
 }  
 catch(PDOException $error)  
 {  
      $message = $error->getMessage();  
 }  
 ?>  
 <!DOCTYPE html>  
 <html>  
      <head>  
           <title> PHP Login Script using PDO</title>  
           <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

           <link rel="stylesheet" href="CSS/style.css"> 
      </head>  
      <body>  
           <br />  
           <div class="container" style="width:500px;">  
                <?php  
                if(isset($message))  
                {  
                     echo '<label class="text-danger">'.$message.'</label>';  
                }  
                ?>  

                <form method="post">  
                     <label>Email</label>  
                     <input type="text" name="username" class="form-control" />  
                     <br/>  
                     <label>Password</label>  
                     <input type="password" name="password" class="form-control" />  
                     <br/>  
                     <input type="submit" name="login" class="btn btn-info" value="Login" /> 
                     <br/>
                     <a href="forminscription.php">Toujours pas inscrit?, c'est ici</a> 
                </form>  
           </div>  
           <br /> 

          <?php 
               // FOOTER
                include "footer.php";
          ?>
          <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

      </body>  
 </html>  