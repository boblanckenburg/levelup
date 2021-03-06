<?php

function update_points( $studentname ) 
{
    $studentname = mysql_escape_string( $studentname );
    
    $points = get_student_point_array( $studentname );
    
    //update student table
    $update_query = "UPDATE students SET points = " . $points["total"] . " WHERE name = '" . $studentname . "'";
    mysql_query( $update_query );
    
    //update points history
    //if last update was fewer than a day ago, overwrite that entry
    //otherwise, insert new entry
    $timecheck_query = "SELECT * FROM points_history 
        WHERE student_name = \"" . $studentname . "\" 
            AND (TIMESTAMPDIFF(DAY,points_history.date,NOW())) < 1";
    $result = mysql_query($timecheck_query);
    $last_history = mysql_fetch_array($result);
    
    if(count($last_history) > 1) {
        $update_query = "UPDATE points_history SET points=" . $points["total"] . " WHERE student_name='" . $last_history['student_name'] . "' AND date='" . $last_history['date'] . "'";    
    } else {
        $update_query = "INSERT INTO points_history (student_name, points, date) VALUES('" . $studentname . "', " . $points["total"] . ", NOW())";
    }
    mysql_query( $update_query );
}

function get_student_point_array( $studentname )
{
    $points = Array();
    
    $points_meta_query = "SELECT presence, codecademy FROM points_meta";
    $presences_query = "SELECT COUNT(present) AS totalpresent FROM presences WHERE student_name = '" . $studentname . "' AND present = '1'";
    $highest_streak_query = "SELECT highest_streak FROM students WHERE name = '" . $studentname . "'";
    $streak_query = "SELECT COUNT(student_name) AS totalstreaks FROM streak WHERE student_name = '" . $studentname . "'";
    $homework_query = "SELECT SUM(grade) AS totalgrade FROM homework WHERE student_name = '" . $studentname . "'";
    $project_query = "SELECT SUM(grade) AS totalgrade FROM project WHERE student_name = '" . $studentname . "'";  
    $codecademy_query = "SELECT grade FROM codecademy WHERE student_name = '" . $studentname . "'";  
    
    $points_meta_result = mysql_fetch_assoc( mysql_query( $points_meta_query ) );
    $points_per_presence = $points_meta_result['presence'];
    $points_codecademy = $points_meta_result['codecademy'];
    
    $presences_result = mysql_fetch_array( mysql_query( $presences_query ) );
    $points['presence'] = (int)$presences_result['totalpresent'] * $points_per_presence;
    
    $streak_result = mysql_fetch_array( mysql_query( $streak_query ) );
    $points['streaks'] = (int)$streak_result['totalstreaks'];
    
    $highest_streak_result = mysql_fetch_array( mysql_query( $highest_streak_query ) );
    $points['highest_streak'] = (int)$highest_streak_result['highest_streak'];
    
    $homework_result = mysql_fetch_array( mysql_query( $homework_query ) );
    $points['homework'] = (int)$homework_result['totalgrade'];
    
    $project_result = mysql_fetch_array( mysql_query( $project_query ) );
    $points['project'] = (int)$project_result['totalgrade'];
    
    $codecademy_result = mysql_fetch_array( mysql_query( $codecademy_query ) );
    $points['codecademy'] = (int)$codecademy_result['grade'] * $points_codecademy;
    
    $points['total'] = (int)$points['presence'] + $points['homework'] + $points['project'] + $points['codecademy'] + $points['highest_streak'];
    
    return $points;
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

function get_student_next_level_points( $studentname )
{
    //TODO: write one query for this
    $student_points = get_student_points( $studentname );
    $next_level = get_level_from_points( $student_points ) + 1;
    $next_level_points = get_points_from_level( $next_level );
    
    return $next_level_points;
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
    $last_level_query = "SELECT level FROM level_meta ORDER BY level DESC LIMIT 1";
    $last_level_result = mysql_query( $last_level_query );
    $last_level_row = mysql_fetch_assoc($last_level_result);
    $last_level = $last_level_row['level'];

    $level_query = "SELECT points, level FROM level_meta ORDER BY level ASC";
    $level_result = mysql_query( $level_query );
    $total_levels = mysql_num_rows($result);
    
    $level = 0;
    while( $level_row = mysql_fetch_assoc( $level_result ) )
    {
        if( $level < $last_level && $points >= $level_row['points'] ) 
        {
            $level = $level_row['level'] + 1;
        }
    }

    return $level;
}

function get_points_from_level( $level )
{
    $level = mysql_escape_string( $level );
    $level_query = "SELECT points FROM level_meta WHERE level <= " . $level . " ORDER BY level DESC LIMIT 1";
    $level_result = mysql_query( $level_query );
    $level_row = mysql_fetch_assoc( $level_result );
    
    return $level_row['points'];
}

function get_percentage_from_points( $points )
{
    $level = get_level_from_points( $points );
    $points_low = get_points_from_level( $level-1 );
    $points_high = get_points_from_level( $level );
    
    if( $points_low == '' ) { $points_low = 0; }
    if( $points > $points_high ) { $points = $points_high; }
    
    return (($points - $points_low) / ($points_high - $points_low)) * 100;
}

function get_class_points( $studentname )
{
    $studentname = mysql_escape_string( $studentname );
    
    $student_query = "SELECT name, class, SUM( points ) AS classposition FROM students WHERE inactive = '0' AND class = 
                        (SELECT class FROM students WHERE name = '" . $studentname . "')";
    
    $student_result = mysql_fetch_array( mysql_query( $student_query ) );
    
    return $student_result;
}



?>
