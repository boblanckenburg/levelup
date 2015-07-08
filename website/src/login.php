<?php

//we need to start session here too (as well as in index) because this page is loaded without index when the login form is submitted
session_start();

//if a logout query is given, we destroy the session and load the index site with default login page
if( isset($_GET['logout']))
{
    session_destroy();
    header("location: index.php");
}

//if a login query is submitted, add the login information to the session and reload index to studentview page
if (isset($_POST['submit']))
{
    $_SESSION['name'] = stripslashes($_POST['name']);
    $_SESSION['password'] = stripslashes($_POST['password']);
    
    header("location: index.php");
}
        

?>