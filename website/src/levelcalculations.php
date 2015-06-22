<?php

function update_points( $studentname ) 
{
    $studentname = mysql_escape_string( $studentname );
    
    $points_meta_query = "SELECT presence FROM points_meta";
    $presences_query = "SELECT COUNT(present) AS totalpresent FROM presences WHERE student_name = '" . $studentname . "' AND present = '1'";
    $homework_query = "SELECT SUM(grade) AS totalgrade FROM homework WHERE student_name = '" . $studentname . "'";
    $project_query = "SELECT SUM(grade) AS totalgrade FROM project WHERE student_name = '" . $studentname . "'";  
    
    $points_meta_result = mysql_fetch_assoc( mysql_query( $points_meta_query ) );
    $points_per_presence = $points_meta_result['presence'];
    
    $presences_result = mysql_fetch_array( mysql_query( $presences_query ) );
    $presences = $presences_result['totalpresent'];
    
    $homework_result = mysql_fetch_array( mysql_query( $homework_query ) );
    $homework = $homework_result['totalgrade'];
    
    $project_result = mysql_fetch_array( mysql_query( $project_query ) );
    $project = $project_result['totalgrade'];
    
    $points = $presences * $points_per_presence + $homework + $project;
    
    $update_query = "UPDATE students SET points = " . $points . " WHERE name = '" . $studentname . "'";
    
    mysql_query( $update_query );
}

function get_student_points( $studentname )
{
    $studentname = mysql_escape_string( $studentname );
    
    $points_query = "SELECT points FROM students WHERE name = '" . $studentname . "'";
    $points_result = mysql_query( $points_query );
    $points_row = mysql_fetch_assoc( $points_result );
    
    $points = $points_row['points'];
    return $points;
}

function get_point_totals()
{
    $point_totals = Array();
    $point_totals_student = Array();
    $point_totals_class = Array();
    $class_size = Array();
    
    $student_query = "SELECT name, class, points, inactive FROM students";
    
    $student_query_result = mysql_query( $student_query );
    while( $student_query_row = mysql_fetch_assoc( $student_query_result ) )
    {
        $student_name = $student_query_row['name'];
        $student_class = $student_query_row['class'];
        $student_points = $student_query_row['points'];
        $student_inactive = $student_query_row['inactive'];
        
        $point_totals_student[$student_name] = $student_points;
        
        //only add student results to the class results if the student is active
        if( $student_inactive == '0' )
        {
            //add student points and add one to students in class, we'll divide the two after this while
            $point_totals_class[$student_class] += $student_points;
            $class_size[$student_class] += 1;
        }
    }
    
    //normalize the class points by dividing by the amount of students in the class
    $class_keys = array_keys( $point_totals_class );
    foreach( $class_keys as $key )
    {
        $point_totals_class[$key] /= $class_size[$key];
    }
    
    arsort( $point_totals_student );
    arsort( $point_totals_class );
    
    $point_totals['student'] = $point_totals_student;
    $point_totals['class'] = $point_totals_class;
    
    return $point_totals;
}

function get_level_from_points( $points )
{
    $level_query = "SELECT level FROM level_meta WHERE points <= " . $points . " ORDER BY level DESC LIMIT 1";
    $level_result = mysql_query( $level_query );
    $level_row = mysql_fetch_assoc( $level_result );
    
    return $level_row['level'];
}

function get_percentage_from_points( $points )
{
    $level_query = "SELECT points FROM level_meta WHERE points >= " . $points . " ORDER BY level ASC LIMIT 1";
    $level_result = mysql_query( $level_query );
    $level_row = mysql_fetch_assoc( $level_result );
    
    return (int)($points / $level_row['points']);
}

function get_points_from_level( $level )
{
    $level_query = "SELECT points FROM level_meta WHERE level = " . $level;
    $level_result = mysql_query( $level_query );
    $level_row = mysql_fetch_assoc( $level_result );
    
    return $level_row['points'];
}

function get_class_points( $studentname )
{
    $studentname = mysql_escape_string( $studentname );
    
    $student_query = "SELECT name, class, SUM( points ) AS classposition FROM students WHERE inactive = '0' AND class = 
                        (SELECT class FROM students WHERE name = '" . $studentname . "')";
    
    $student_result = mysql_fetch_array( mysql_query( $student_query ) );
    
    return $student_result;
}

function get_class_position( $studentname )
{
    
}



?>
