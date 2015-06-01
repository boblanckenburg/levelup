<?php

ini_set('display_errors',1);
ini_set('display_startup_errors',1);
error_reporting(1);

session_start();

global $site;
global $database_connection;

$database_connection = mysql_connect( "localhost:3307", "levelup", "veiligw8woord" );
mysql_select_db( "levelup", $database_connection );

$index_file = "index.html";
$content_file = "login";
$name = $_SESSION['name'];
$password = $_SESSION['key'];
$admin = false;

//check if name is admin
$admin_query = mysql_query(
    "SELECT name, password FROM admin_meta WHERE name=\"". $name."\" 
         AND password=\"".$password."\"" );
           
if(mysql_fetch_row($result))
{
    $admin = true;
    $content_file = $_GET["page"];
}

//check if name is valid user
else
{
    $admin_query = mysql_query(
        "SELECT name, password FROM students WHERE name=\"". $name."\" 
             AND password=\"".$password."\"" );
               
    if(mysql_fetch_row($result))
    {
        $user = true;
        $content_file = $_GET["page"];
    }
}

$site = file_get_contents($index_file);
$content = file_get_contents($content_file . ".html");

$login = "<p>Welkom, ".$name."</p> <a href=\"index.php?page=login&logout=true\">UITLOGGEN</a>";
                    
$site = str_replace("{login}", $login, $site);
$site = str_replace("{content}", $content, $site);

$site = str_replace("{css}", $content_file . ".css", $site);
$site = str_replace("{javascript}", $content_file . ".js", $site);

include $content_file . ".php";

echo $site;

?>

