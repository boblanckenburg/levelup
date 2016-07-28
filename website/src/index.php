<?php

include "levelcalculations.php";

ini_set('display_errors',1);
ini_set('display_startup_errors',1);
error_reporting(1);

//start session
session_start();

//two variables accessible everywhere: the site content in $site and the database connection in $database_connection
global $site;
global $database_connection;

//database connection
$database_connection = mysql_connect( "localhost:3307", "levelup", "greenmushroom" );
mysql_select_db( "levelup_clean", $database_connection );

//array with all admin pages, not accessible to non-admin users
$admin_pages_array = Array(
    "docentview", "administration"
);

//array with all pages to be added to the titlebar.
//Keys are the titlebar names.
//If this includes admin pages, they are only visible to admin users
$titlebar_pages_array = Array(
    "Student View" => "studentview", "Teacher View" => "docentview", "Administration" => "administration"
);

//always accessible, even when the user is marked inactive
$inactive_pages_array = Array(
    "login", "studentview"
);

//default values
$index_file = "index.html";
$content_file = "login";
$name = mysql_escape_string( $_SESSION['name'] );
$nick = $name;
$password = mysql_escape_string( $_SESSION['password'] );
$admin = false;
$user = false;
$inactive = true;

//check if name is admin
$admin_query = mysql_query(
    "SELECT name, password FROM admin_meta WHERE name=\"". $name."\" 
         AND password=\"".$password."\"" );
           
if(mysql_fetch_row($admin_query))
{
    $admin = true;
}

//check if name is valid user
$student_query = mysql_query(
    "SELECT name, nickname, password, lastlogin, inactive FROM students WHERE name=\"". $name."\" 
         AND password=\"".$password."\"" );
           
if($student_query_row = mysql_fetch_assoc($student_query))
{
    $nick = $student_query_row['nickname'];
    $user = true;
    $inactive = ($student_query_row['inactive'] == '1') ? true : false;
    $lastlogin = $student_query_row['lastlogin'];
    
    $current_date = date("Y-m-d G:i:s");
    $diff = (abs(strtotime($current_date) - strtotime($lastlogin)));

    if( $diff > 60*60*12 && $diff <= 60*60*24 )
    {
        //strike! Push to database
        $streak_query = "INSERT INTO streak ( student_name ) VALUES( '".$name."' )";
        mysql_query( $streak_query );
        
        //get student's highest streak
        $highest_streak_query = "SELECT highest_streak FROM students WHERE name = '".$name."'";
        $highest_streak_result = mysql_query( $highest_streak_query );
        $highest_streak_row = mysql_fetch_assoc( $highest_streak_result );
        $highest_streak = $highest_streak_row['highest_streak'];
        
        //get student's current streak, plus 1
        $streak_query = "SELECT COUNT(student_name) AS totalstreaks FROM streak WHERE student_name = '" . $name . "'";
        $streak_result = mysql_query( $streak_query );
        $streak_row = mysql_fetch_assoc( $streak_result );
        $streak = $streak_row['totalstreaks'];
        $streak += 1;
        
        //update with highest of the two
        $highest_streak = max( $streak, $highest_streak );
        
        //update student lastlogin timestamp
        $update_lastlogin_query = "UPDATE students SET lastlogin = '".$current_date."', highest_streak = ".$highest_streak." WHERE name = '".$name."'";
        mysql_query( $update_lastlogin_query );
                
        //update points
        update_points( $name );
    }
    
    else if( $diff > 60*60*24 )
    {
        $reset_streak_query = "DELETE FROM streak WHERE student_name = '".$name."'";
        mysql_query( $reset_streak_query );
        
        //update student lastlogin timestamp
        $update_lastlogin_query = "UPDATE students SET lastlogin = '".$current_date."' WHERE name = '".$name."'";
        mysql_query( $update_lastlogin_query );
    }
}

//if the logged in user is a student or admin
if( $user == true || $admin == true )
{
    //default page for valid logged in user
    $content_file = "studentview";
        
    //if page is given
    if( isset( $_GET['page'] ) )
    {
        //if user is admin, load given page (otherwise keep default page from above)
        if( $admin == true )
        {
            $content_file = $_GET["page"];
        }
        
        //if page is not an admin page
        else if( in_array( $_GET['page'], $admin_pages_array ) == false )
        {
            //if user is active or page is accessible for inactive user,
            //load given page (otherwise keep default page from above)
            if( $inactive == false || in_array( $_GET['page'], $inactive_pages_array ) )
            {
                $content_file = $_GET["page"];
            }
        }
    }
    
    $welcome = "Welkom " . $nick;
}

//otherwise, show error text above logout button
else
{
    $welcome = "<span style='color:#ff0000;'>Onbekende login gegevens!</span>";
}

//grab content of index template html file and the given content html file
$site = file_get_contents($index_file);
$content = file_get_contents($content_file . ".html");

//Show login information right top
$login = "<p>".$welcome."</p> <a href=\"index.php?page=login&logout=true\">UITLOGGEN</a>";

//generate menu buttons based on the configuration arrays
$menu = "";
foreach( $titlebar_pages_array as $titlebar_button_name => $titlebar_button_page )
{
    if( in_array( $titlebar_button_page, $admin_pages_array ) == false || $admin == true )
    {
        $menu .= "<a href='index.php?page=".$titlebar_button_page."'>".$titlebar_button_name."</a>";
    }
}
                
//substitude template keywords by dynamically loaded content/user information
$site = str_replace("{login}", $login, $site);
$site = str_replace("{menu}", $menu, $site );
$site = str_replace("{content}", $content, $site);

//also load css and javascript files belonging to content file if they exist
$site = str_replace("{css}", $content_file . ".css", $site);
$site = str_replace("{javascript}", $content_file . ".js", $site);

//include the content php file and let it do its job
include $content_file . ".php";

//display the generated site
echo $site;

?>

