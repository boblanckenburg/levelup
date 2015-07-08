<?php // content="text/plain; charset=utf-8"

    include "levelcalculations.php";
    
    
    //get the logged in username and retrieve known values
    $name = mysql_escape_string( $_SESSION['name'] );
    
    $points_query = "SELECT points FROM students WHERE name = '" . $name . "'";
    $points_result = mysql_query( $points_query );
    $points_row = mysql_fetch_assoc( $points_result );
    $points = $points_row['points'];

    $level = get_level_from_points( $points );
    
    $points = get_student_point_array( $name );
    
    $site = str_replace( "{presence}", $points['presence'], $site );
    $site = str_replace( "{homework}", $points['homework'], $site );
    $site = str_replace( "{project}", $points['project'], $site );
    $site = str_replace( "{codecademy}", $points['codecademy'], $site );
    $site = str_replace( "{total}", $points['total'], $site );

    $levelcounters = "";
    for( $i = 0; $i <= $level ; $i++ )
    {
        $levelcounters .= '
        <section class="levelcounter">
            <a href="index.php?page=movie&level='.$i.'" class="levelcounter_image">
                <div class="levelcounter_imageurl" hidden>./img/emblems-small/level'.$i.'</div>
            </a>
        </section>';
    }
    
    $site = str_replace( "{levelcounters}", $levelcounters, $site );

?>
