<?php

if( isset($_POST['logout']))
{
    session_destroy();
}

if (isset($_POST['submit']))
{
    $_SESSION['name'] = stripslashes($_POST['name']);
    $_SESSION['password'] = stripslashes($_POST['password']);
    header("location: index.php");
}

?>