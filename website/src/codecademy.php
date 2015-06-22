<?php

include "levelcalculations.php";

$name = $_SESSION['name'];

if( $_GET['submitgrade'] == 'true' )
{
    $grade = max( 0, min( 100, $_GET['codecademygrade'] ) );
    
    //check if student and date are present in presences
    //if not, insert new
    $result = mysql_query(
        "SELECT * FROM codecademy WHERE student_name=\"". $name."\" LIMIT 1" );

    //insert new presence
    if(!mysql_fetch_row($result))
    {
        mysql_query( "INSERT INTO codecademy(student_name, grade) VALUES (\"".$name."\", ".$grade.")" );
    }
    
    //update existing presence
    else
    {
        echo 
        mysql_query( "UPDATE codecademy SET grade = ".$grade."
                                    WHERE student_name = \"".$name."\"" );
    }
    
    update_points( $name );
}

$codecademy_query = "SELECT title, text FROM codecademy_meta";
$codecademy_result = mysql_query( $codecademy_query );
$codecademy_row = mysql_fetch_assoc( $codecademy_result );
$codecademy_title = $codecademy_row['title'];
$codecademy_text = $codecademy_row['text'];

$result = mysql_query(
    "SELECT grade FROM codecademy WHERE student_name=\"". $name."\" LIMIT 1" );
$row = mysql_fetch_assoc($result);

if($row != false)
{
    $grade = $row['grade'];
}

else
{
    $grade = 0;
}

$site = str_replace( "{codecademygrade}", $grade, $site );
$site = str_replace( "{codecademytitle}", $codecademy_title, $site );
$site = str_replace( "{codecademytext}", $codecademy_text, $site );

?>