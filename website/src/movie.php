<?php

//default values
$movielink = "4FhL2-KatRE";
$moviedescription = "Gefeliciteerd met het bereiken van level 0 \"Een filmbezoeker\" in python programmeren. Een goed begin is het halve werk!
Hierbij vast een teaser van de avonturen die je gaat beleven. 

Al enthousiast geworden? Bij op de codecademy pagina kun je alvast oefenen voor de lessen!";


//get the movie and description for the student's current level
$name = mysql_escape_string( $_SESSION['name'] );
$student_query = mysql_query( "SELECT title, description, imageurl, videourl FROM level_meta WHERE points <= (SELECT points FROM students WHERE name = '" . $name . "') ORDER BY level DESC LIMIT 1");
while( $student_query_row = mysql_fetch_assoc( $student_query ) )
{
    $movielink = $student_query_row['videourl'];
    $moviedescription = $student_query_row['description'];
}

$site = str_replace( "{movielink}", "https://www.youtube.com/embed/" . $movielink, $site );
$site = str_replace( "{moviedescription}", $moviedescription . " ", $site );

?>