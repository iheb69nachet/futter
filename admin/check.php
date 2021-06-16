<?php
session_start();
if(isset($_POST['email']) && isset($_POST['password']))
{
 // connexion à la base de données
 $db_username = 'root';
 $db_password = '';
 $db_name     = 'flutter';
 $db_host     = 'localhost';
 $db = mysqli_connect($db_host, $db_username, $db_password,$db_name)
        or die('could not connect to database');
        $name = mysqli_real_escape_string($db,htmlspecialchars($_POST['name'])); 
        $email = mysqli_real_escape_string($db,htmlspecialchars($_POST['email'])); 
        $password = mysqli_real_escape_string($db,htmlspecialchars($_POST['password']));
        $phone = mysqli_real_escape_string($db,htmlspecialchars($_POST['phone']));


        // var_dump($email);
        // var_dump($password);
        // die();
        if($username !== "" && $password !== "")
    {
        $requete = "SELECT *,count(*) FROM admin where 
              email = '".$email."' and password = '".$password."' ";
        $exec_requete = mysqli_query($db,$requete);
        $reponse      = mysqli_fetch_array($exec_requete);
      //   var_dump($reponse["name"]);
        
      //   die();
        $count = $reponse['count(*)'];
        if($count!=0) // nom d'utilisateur et mot de passe correctes
        {
           $_SESSION['id'] = $reponse["id"];

           $_SESSION['email'] = $reponse["email"];
           $_SESSION['name'] = $reponse["name"];

           
           header('Location: index.php');
        }
        else
        {
           header('Location: login.php?erreur=1'); // utilisateur ou mot de passe incorrect
        }
    }
    else
    {
       header('Location: login.php?erreur=2'); // utilisateur ou mot de passe vide
    }
}


else
{
   header('Location: login.php');
}
mysqli_close($db); 
?>