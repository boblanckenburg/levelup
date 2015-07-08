<?php

include "levelcalculations.php";


//default values
$movielink = "4FhL2-KatRE";
$moviedescription = "Gefeliciteerd met het bereiken van level 0 \"Een filmbezoeker\" in python programmeren. Een goed begin is het halve werk!
Hierbij vast een teaser van de avonturen die je gaat beleven. 

Al enthousiast geworden? Bij op de codecademy pagina kun je alvast oefenen voor de lessen!";

//get the movie and description for the student's current level
$name = mysql_escape_string( $_SESSION['name'] );

$student_points = get_student_next_level_points( $name );

if( isset( $_GET['level'] ) )
{
    $requested_points = get_points_from_level( $_GET['level'] );
    if( $requested_points < $student_points )
    {
        $student_points = $requested_points;
    }
}

$student_query = "SELECT title, description, videourl FROM level_meta WHERE points <= ".$student_points." ORDER BY level DESC LIMIT 1";
$student_result = mysql_query( $student_query );

while( $student_query_row = mysql_fetch_assoc( $student_result ) )
{
    $movielink = $student_query_row['videourl'];
    $moviedescription = htmlentities( $student_query_row['description'], ENT_QUOTES, "ISO8859-1" );
}

$site = str_replace( "{movielink}", "https://www.youtube.com/embed/" . $movielink, $site );
$site = str_replace( "{moviedescription}", $moviedescription . " ", $site );

?>