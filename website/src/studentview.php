<?php

    //default values
    $class = 'A';
    $level = 1;
    $progress = 0;
    $nextlvl = $level + 1;
    $daystreak = 0;
    $classposition = 0;
    $yourposition = 0;
    $class_positions = Array();
    $student_positions = Array();

    //get the logged in username and retrieve known values
    $name = $_SESSION['name'];
    $level_query = mysql_query( "SELECT * FROM students" );
    while( $level_query_row = mysql_fetch_assoc( $level_query ) )
    {
        //get values from current iteration student
        $student_level = $level_query_row['level'];
        $student_progress = $level_query_row['progress'];
        $student_name = $level_query_row['name'];
        $student_class = $level_query_row['class'];
        
        //store the current iteration student's level and progress to the student array (in percent units)
        //if student is not apparent in the array yet, add it and reset it at 0
        if( in_array( $student_name, $student_positions ) == false )
        {
            $student_positions[ $student_name ] = 0;
        }
        
        $student_positions[ $student_name ] += ($student_level * 100) + $student_progress;
        
        //store the current iteration student's level and progress to the class array (in percent units)
        //if class is not apparent in the array yet, add it and reset it at 0
        if( in_array( $student_class, $class_positions ) == false )
        {
            $class_positions[ $student_class ] = 0;
        }
        
        $class_positions[ $student_class ] += ($student_level * 100) + $student_progress;
        
        //if the current iteration contains statistics from the logged in user, overwrite the default values level and progress
        if( $student_name == $name )
        {
            $level = $student_level;
            $nextlvl = $level + 1;
            $progress = $student_progress;
            $class = $student_class;
        }
    }
    
    //divide all class position values by the amount of students to get the average
    foreach( $class_positions as $class_key => $class_progress )
    {
        $class_positions[ $class_key ] /= count( array_keys( $class_positions, $class_progress ) );
    }
    
    //sort all the position arrays high to low
    arsort( $class_positions );
    arsort( $student_positions );
    
    //overwrite default data by calculated positions
    $classposition = array_search( $class, array_keys( $class_positions ) ) + 1;
    $yourposition = array_search( $name, array_keys( $student_positions ) ) + 1;
    
    $site = str_replace( "{level}", $level, $site );
    $site = str_replace( "{prevlvl}", $level, $site );
    $site = str_replace( "{nextlvl}", $nextlvl, $site );
    $site = str_replace( "{percent}", $progress, $site );
    $site = str_replace( "{daystreak}", $daystreak, $site );
    $site = str_replace( "{classposition}", $classposition, $site );
    $site = str_replace( "{yourposition}", $yourposition, $site );

?>
