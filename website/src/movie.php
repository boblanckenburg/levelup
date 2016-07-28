<?php

//default values
$movielink = "";
$moviedescription = "";

//get the movie and description for the student's current level
$name = mysql_escape_string( $_SESSION['name'] );

$student_next_level_points = get_student_next_level_points( $name );
$student_points = 0;

if( isset( $_GET['level'] ) )
{
    $requested_points = get_points_from_level( $_GET['level'] );
    if( $requested_points < $student_next_level_points )
    {
        $student_points = $requested_points;
    }
}

$student_query = "SELECT title, description, videourl FROM level_meta WHERE points <= ".$student_points." ORDER BY level DESC LIMIT 1";
$student_result = mysql_query( $student_query );

while( $student_query_row = mysql_fetch_assoc( $student_result ) )
{
    $movielink = $student_query_row['videourl'];
    $moviedescription = $student_query_row['description'];
    $movietitle = $student_query_row['title'];
}

$site = str_replace( "{movielink}", "https://www.youtube.com/embed/" . $movielink, $site );
$site = str_replace( "{moviedescription}", $moviedescription . " ", $site );
$site = str_replace( "{movietitle}", $movietitle . " ", $site );

?>