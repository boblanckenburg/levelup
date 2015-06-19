<?php

    include "levelcalculations.php";
    
    
    //default values
    $class = 'A';
    $level = 1;
    $point = 0;
    $daystreak = 0;
    $classposition = 0;
    $yourposition = 0;
    $class_positions = Array();
    $student_positions = Array();

    //get the logged in username and retrieve known values
    $name = mysql_escape_string( $_SESSION['name'] );
    
    $point_totals = get_point_totals();
    $points = $point_totals['student'][$name];
    $level = get_level_from_points( $points );
    $classposition = array_search( $class, array_keys( $point_totals['class'] ) ) + 1;
    $yourposition = array_search( $name, array_keys( $point_totals['student'] ) ) + 1;
    
    $current_level_points = get_points_from_level( $level );
    $next_level_points = get_points_from_level( $level + 1 );
    if( $next_level_points == "" ) { $next_level_points = $points; }
    
    $points_visible = $points . " / " . $next_level_points; 
    $percentage = abs((($points - $current_level_points) / ($next_level_points - $current_level_points)) * 100);
    $backgroundurl = "./img/emblems/level" . $level;
    
    $nextlvl = $level + 1;
    
    $site = str_replace( "{level}", $level, $site );
    $site = str_replace( "{prevlvl}", $level, $site );
    $site = str_replace( "{nextlvl}", $nextlvl, $site );
    $site = str_replace( "{levelpoints}", $points_visible, $site );
    $site = str_replace( "{percent}", $percentage, $site );
    $site = str_replace( "{daystreak}", $daystreak, $site );
    $site = str_replace( "{classposition}", $classposition, $site );
    $site = str_replace( "{yourposition}", $yourposition, $site );
    $site = str_replace( "{classletter}", $class, $site );
    $site = str_replace( "{backgroundurl}", $backgroundurl, $site );
?>

