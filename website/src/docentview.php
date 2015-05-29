<?php

//disgusting helper function because php lacks a reverse parse_url function
function join_url( $parts, $encode=TRUE )
{
if ( $encode )
{
if ( isset( $parts['user'] ) ){
$parts['user']     = rawurlencode( $parts['user'] );}
if ( isset( $parts['pass'] ) ){
$parts['pass']     = rawurlencode( $parts['pass'] );}
if ( isset( $parts['host'] ) &&
!preg_match( '!^(\[[\da-f.:]+\]])|([\da-f.:]+)$!ui', $parts['host'] ) ){
$parts['host']     = rawurlencode( $parts['host'] );}
if ( !empty( $parts['path'] ) ){
$parts['path']     = preg_replace( '!%2F!ui', '/',
rawurlencode( $parts['path'] ) );}
// if ( isset( $parts['query'] ) ){
// $parts['query']    = rawurlencode( $parts['query'] );}
if ( isset( $parts['fragment'] ) ){
$parts['fragment'] = rawurlencode( $parts['fragment'] );}
}

$url = '';
if ( !empty( $parts['scheme'] ) ){
$url .= $parts['scheme'] . ':';}
if ( isset( $parts['host'] ) )
{
$url .= '//';
if ( isset( $parts['user'] ) )
{
$url .= $parts['user'];
if ( isset( $parts['pass'] ) ){
$url .= ':' . $parts['pass'];}
$url .= '@';
}
if ( preg_match( '!^[\da-f]*:[\da-f.:]+$!ui', $parts['host'] ) ){
$url .= '[' . $parts['host'] . ']';} // IPv6
else{
$url .= $parts['host'];}             // IPv4 or name
if ( isset( $parts['port'] ) ){
$url .= ':' . $parts['port'];}
if ( !empty( $parts['path'] ) && $parts['path'][0] != '/' ){
$url .= '/';}
}
if ( !empty( $parts['path'] ) ){
$url .= $parts['path'];}
if ( isset( $parts['query'] ) )
{
$url .= '?';
foreach( $parts['query'] as $key => $value )
{
$url .= $key . "=" . $value . "&";
}
}
if ( isset( $parts['fragment'] ) ){
$url .= '#' . $parts['fragment'];}
return $url;
}

    function mod_url_query( $parameter, $value )
    {
        $actual_link = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
        $components = parse_url( $actual_link );
        $query = $components['query'];
        $get_array = array();
        parse_str( $query, $get_array );
        $get_array[$parameter] = $value;
        $components['query'] = $get_array;
        $url = join_url( $components );
        return $url;
    }   
   
   
    function create_classes()
    {
        $class_query = mysql_query('SELECT DISTINCT(class) FROM students ORDER BY class ASC');
        $class = "";
        
        while( $row = mysql_fetch_assoc( $class_query ) )
        {
            $class .= "<a href='" . mod_url_query('class',$row['class']) . "'><div class='button'>" . $row['class'] . "</div></a>";
        }
        
        return $class;
    }

    function create_weeks()
    {
        $year = 0;
        $weeks_query = mysql_query('SELECT DISTINCT(weeknumber) FROM presences_meta');// WHERE YEAR(timestamp) = \"' . $year . '\";');
        $weeks = "";
        
        while( $row = mysql_fetch_assoc( $weeks_query ) )
        {
            $weeks .= "<a href='" . mod_url_query('weeknumber',$row['weeknumber']) . "'><div class='button'>" . $row['weeknumber'] . "</div></a>";
        }
        
        return $weeks;
    }

    function create_student_row()
    {   
        $student_rows = "";
        $student_query = mysql_query('SELECT DISTINCT(name) FROM students WHERE class REGEXP "[' . $_GET['class'] . ']" ORDER BY name ASC');
        while( $student_query_row = mysql_fetch_assoc( $student_query ) )
        {
            $student_name = $student_query_row['name'];
            $student_rows .= "<tr><td>" . $student_name . "</td>";
            $student_rows .= "<td>";
        
            $presence_query = mysql_query( 'SELECT * FROM presences_meta
                                                LEFT JOIN presences ON presences_meta.date = presences.date
                                                AND presences.student_name = "' . $student_name . '"
                                                WHERE weeknumber = ' . $_GET['weeknumber'] );
                                                    
            while( $presence_query_row = mysql_fetch_assoc( $presence_query ) )
            {
                $student_rows .= "<input type='checkbox' " . (($presence_query_row['present'] == 1) ? "checked" : "") . ">";
            }
            
            $student_rows .= "</td>";
//             
            // $student_query = mysql_query('SELECT DISTINCT(name) FROM students ORDER BY name ASC');
            // while( $row = mysql_fetch_assoc( $student_query ) )
            // {
                // $student_rows .= "<td>" . $row['name'] . "</td>";
            // }
//             
            // $student_query = mysql_query('SELECT DISTINCT(name) FROM students ORDER BY name ASC');
            // while( $row = mysql_fetch_assoc( $student_query ) )
            // {
                // $student_rows .= "<td>" . $row['name'] . "</td></tr>";
            // }
        }

        return $student_rows;
    }
    
    function create_student_rows()
    {
        return create_student_row();
    }

    function loadPage( $site )
    {
        //if we receive ajax, update the presence data for student
        if( isset($_GET['name']) && isset($_GET['date']) && isset($_GET['presence']) )
        {
            $presence = ($_GET['presence'] == "true") ? "1" : "0";
            $name = mysql_real_escape_string( $_GET['name'] );
            $date = mysql_real_escape_string( $_GET['date'] );
            
            //check if student and date are present in presences
            //if not, insert new
            $result = mysql_query(
                "SELECT * FROM presences WHERE student_name=\"". $name."\" 
                                         AND date=\"".$date."\" 
                                         LIMIT 1");
        
            if(!mysql_fetch_row($result))
            {
                mysql_query( "INSERT INTO presences(date, present, student_name) VALUES (\"".$date."\",\"".$presence."\",\"".$name."\")" );
            }
            
            else
            {
                // UPDATE presences SET present="1" WHERE student_name = "Jos" AND date = "2014-11-11 09:30:00";
                mysql_query( "UPDATE presences SET present = \"".$presence."\"
                                            WHERE student_name = \"".$name."\"
                                              AND date = \"".$date."\"" );
    
                mysql_close( $connection ); 
            }
        }
        
        //otherwise, load site
        else
        {
            $classes = create_classes();
            $weeks = create_weeks();
            $studentrows = create_student_rows();

            $site = str_replace( "{classes}", $classes, $site );
            $site = str_replace( "{weeks}", $weeks, $site );
            $site = str_replace( "{studentrows}", $studentrows, $site );
        }
        
        return $site;
    }


    $connection = mysql_connect( "localhost:3307", "levelup", "veiligw8woord" );
    mysql_select_db( "levelup", $connection );
    
    
    $site = loadPage( $site );
?>
