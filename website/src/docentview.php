<?php

    include 'levelcalculations.php';

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
            if ( !empty( $parts['path'] ) )
            {
                $parts['path']     = preg_replace( '!%2F!ui', '/',
                rawurlencode( $parts['path'] ) );
            }
            // if ( isset( $parts['query'] ) ){
            // $parts['query']    = rawurlencode( $parts['query'] );}
            if ( isset( $parts['fragment'] ) )
            {
                $parts['fragment'] = rawurlencode( $parts['fragment'] );
            }
        }
            
        $url = '';
        if ( !empty( $parts['scheme'] ) )
        {
            $url .= $parts['scheme'] . ':';
        }
        if ( isset( $parts['host'] ) )
        {
            $url .= '//';
            if ( isset( $parts['user'] ) )
            {
                $url .= $parts['user'];
                if ( isset( $parts['pass'] ) )
                {
                    $url .= ':' . $parts['pass'];
                }
                $url .= '@';
            }
            if ( preg_match( '!^[\da-f]*:[\da-f.:]+$!ui', $parts['host'] ) )
            {
                $url .= '[' . $parts['host'] . ']';
            } // IPv6
            else
            {
                $url .= $parts['host'];
            }             // IPv4 or name
            if ( isset( $parts['port'] ) )
            {
                $url .= ':' . $parts['port'];
            }
            if ( !empty( $parts['path'] ) && $parts['path'][0] != '/' )
            {
                $url .= '/';
            }
        }
        if ( !empty( $parts['path'] ) )
        {
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
            $button_style = 'button';
            if( $row['class'] == $_GET['class'] ) { $button_style = 'button_selected'; }
            
            $class .= "<a href='" . mod_url_query('class',$row['class']) . "'><div class='".$button_style."'>" . $row['class'] . "</div></a>";
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
            $button_style = 'button';
            if( $row['weeknumber'] == $_GET['weeknumber'] ) { $button_style = 'button_selected'; }
            
            $weeks .= "<a href='" . mod_url_query('weeknumber',$row['weeknumber']) . "'><div class='".$button_style."'>" . $row['weeknumber'] . "</div></a>";
        }
        
        return $weeks;
    }

    function create_student_rows()
    {
        $weeknumber = mysql_real_escape_string( $_GET['weeknumber'] );
        $class = mysql_real_escape_string( $_GET['class'] );
        
        $student_rows = "";
        $student_query = mysql_query('SELECT DISTINCT(name), inactive FROM students WHERE class REGEXP "[' . $class . ']" ORDER BY name ASC');
        while( $student_query_row = mysql_fetch_assoc( $student_query ) )
        {
            $student_name = $student_query_row['name'];
            $student_inactive = $student_query_row['inactive'];
            
            $student_rows .= "<tr><td>" . $student_name . "</td>";
            $student_rows .= "<td>";
        
            //grab all presences from students and join the presences from the meta info table to get meta info coupled to each record
            $presence_query = 
            mysql_query( '
            SELECT presences_meta.date AS meta_date, 
               presences.date,
               presences.student_name,
               presences_meta.weeknumber,
               presences.present
                FROM presences_meta
                LEFT JOIN presences ON presences_meta.date = presences.date
                    AND presences.student_name = "' . $student_name . '"
                    WHERE weeknumber = ' . $weeknumber );
            
            while( $presence_query_row = mysql_fetch_assoc( $presence_query ) )
            {
                //get date, check if it exists, otherwise get meta date
                $date = strtotime( $presence_query_row['date'] );
                if( $date == false )
                {
                    $date = strtotime($presence_query_row['meta_date']);
                }
                
                //generate unique checkboxname from student name and date of presence
                $checkboxname = "presence_".$student_name."_".$date;
                
                //generate checkbox, link to javascript function to dynamically alter database without the need for reloading/saving
                $student_rows .= "<input title=".$presence_query_row['meta_date']." id=".$checkboxname."
                                         onclick='updateStudentPresence(\"".$student_name."\",\"".$checkboxname."\",\"".$date."\")'
                                         type='checkbox' " . (($presence_query_row['present'] == 1) ? "checked" : "") . ">";
            }
            
            $student_rows .= "</td>";
            
            //homework input field
            $student_rows .= "<td>";
            
            $homework_query = "SELECT grade FROM homework WHERE student_name = \"".$student_name."\" AND weeknumber = \"" . $weeknumber . "\"";
            $homework_query_result = mysql_query( $homework_query );

            $homework_grade = "";
            if( $homework_query_row = mysql_fetch_assoc( $homework_query_result ) )
            {
                $homework_grade = (float)$homework_query_row['grade'];
            }
            
            //generate unique textinputname from student name and weeknumber for homework
            $textinputname = "homework_".$student_name."_".$weeknumber;
            $student_rows .= "<input type='text' size='3' style='margin-top:4px'
                                    id=".$textinputname." value='".$homework_grade."' name='".$textinputname."'
                                    onkeyup='updateStudentHomework(\"".$student_name."\",\"".$textinputname."\")'>";
            
            $student_rows .= "</td>";


            //own project input field
            $student_rows .= "<td>";
            
            $project_query = "SELECT grade FROM project WHERE student_name = \"".$student_name."\" AND weeknumber = \"" . $weeknumber . "\"";
            $project_query_result = mysql_query( $project_query );

            $project_grade = "";
            if( $project_query_row = mysql_fetch_assoc( $project_query_result ) )
            {
                $project_grade = (float)$project_query_row['grade'];
            }
            
            //generate unique textinputname from student name and weeknumber for project
            $textinputname = "project_".$student_name."_".$weeknumber;
            $student_rows .= "<input type='text' size='3' style='margin-top:4px'
                                    id=".$textinputname." value='".$project_grade."' name='".$textinputname."'
                                    onkeyup='updateStudentProject(\"".$student_name."\",\"".$textinputname."\")'>";
                                    
            $student_rows .= "</td>";
            
            
            //generate unique checkboxname from student name for inactivity
            $student_rows .= "<td>";
            $checkboxname = "inactive_".$student_name;

            //generate checkbox, link to javascript function to dynamically alter database without the need for reloading/saving
            $student_rows .= "<input title='Resultaten van deze student worden niet meegenomen in de statistieken.' id=".$checkboxname."
                                     onclick='updateStudentInactivity(\"".$student_name."\",\"".$checkboxname."\")'
                                     type='checkbox' " . (($student_inactive == 1) ? "checked" : "") . ">";
            $student_rows .= "</td>";
            
            
            //display total points for student
            $student_rows .= "<td>";
            
            $student_rows .= "<div id='".$student_name."_total'>" . get_student_points( $student_name ) . "</div>";
            
            $student_rows .= "</td>";
        }

        return $student_rows;
    }
    
    function update_presence()
    {
        $presence = ($_GET['presence'] == "true") ? "1" : "0";
        $name = mysql_real_escape_string( $_GET['name'] );
        $date = date( "Y-m-d H:i:s", mysql_real_escape_string( $_GET['date'] ) );
                                      
        //check if student and date are present in presences
        //if not, insert new
        $result = mysql_query(
            "SELECT * FROM presences WHERE student_name=\"". $name."\" 
                                     AND date=\"".$date."\" 
                                     LIMIT 1" );
    
        //insert new presence
        if(!mysql_fetch_row($result))
        {
            mysql_query( "INSERT INTO presences(date, present, student_name) VALUES (\"".$date."\",\"".$presence."\",\"".$name."\")" );
        }
        
        //update existing presence
        else
        {
            mysql_query( "UPDATE presences SET present = \"".$presence."\"
                                        WHERE student_name = \"".$name."\"
                                          AND date = \"".$date."\"" );
        }
    }

    function update_homework()
    {
        $homework = mysql_real_escape_string( $_GET['homework'] );
        $name = mysql_real_escape_string( $_GET['name'] );
        $weeknumber = mysql_real_escape_string( isset($_GET['weeknumber'])?$_GET['weeknumber']:1 );
                                      
        //check if student and date are present in homework
        //if not, insert new
        $result = mysql_query(
            "SELECT * FROM homework WHERE student_name=\"". $name."\" 
                                     AND weeknumber=\"".$weeknumber."\" 
                                     LIMIT 1" );
    
        //insert new presence
        if(!mysql_fetch_row($result))
        {
            mysql_query( "INSERT INTO homework(student_name, weeknumber, grade) VALUES (\"".$name."\",\"".$weeknumber."\",\"".$homework."\")" );
        }
        
        //update existing presence
        else
        {
            mysql_query( "UPDATE homework SET grade = \"".$homework."\"
                                        WHERE student_name = \"".$name."\"
                                          AND weeknumber = \"".$weeknumber."\"" );
        }
    }

    function update_project()
    {
        $project = mysql_real_escape_string( $_GET['project'] );
        $name = mysql_real_escape_string( $_GET['name'] );
        $weeknumber = mysql_real_escape_string( isset($_GET['weeknumber'])?$_GET['weeknumber']:1 );
                                      
        //check if student and date are present in project
        //if not, insert new
        $result = mysql_query(
            "SELECT * FROM project WHERE student_name=\"". $name."\" 
                                     AND weeknumber=\"".$weeknumber."\" 
                                     LIMIT 1" );
    
        //insert new presence
        if(!mysql_fetch_row($result))
        {
            mysql_query( "INSERT INTO project(student_name, weeknumber, grade) VALUES (\"".$name."\",\"".$weeknumber."\",\"".$project."\")" );
        }
        
        //update existing presence
        else
        {
            mysql_query( "UPDATE project SET grade = \"".$project."\"
                                        WHERE student_name = \"".$name."\"
                                          AND weeknumber = \"".$weeknumber."\"" );
        }
    }

    function update_inactivity()
    {
        $name = mysql_real_escape_string( $_GET['name'] );
        $inactive = ($_GET['inactive'] == "true") ? "1" : "0";
        $query = "UPDATE students SET inactive = \"".$inactive."\"
                                        WHERE name = \"".$name."\"";
        mysql_query( $query );
    }
    
    function loadPage( $site )
    {
        update_points( $_GET['name'] );
        //if we receive ajax...
        //update the presence data for student
        if( isset($_GET['name']) && isset($_GET['date']) && isset($_GET['presence']) )
        {
            update_presence();
            update_points( $_GET['name'] );
        }
        
        //update the inactivity
        else if( isset($_GET['name']) && isset($_GET['inactive']) )
        {
            update_inactivity();
            update_points( $_GET['name'] );
        }

        //update the homework field
        else if( isset($_GET['name']) && isset($_GET['homework']) )
        {
            update_homework();
            update_points( $_GET['name'] );
        }
        

        //update the project field
        else if( isset($_GET['name']) && isset($_GET['project']) )
        {
            update_project();
            update_points( $_GET['name'] );
        }
        
        //otherwise, load site
        else
        {
            if( isset( $_GET['class'] ) == false ) { $_GET['class'] = 'A'; }
            if( isset( $_GET['weeknumber'] ) == false ) { $_GET['weeknumber'] = '1'; }
            
            $classes = create_classes();
            $weeks = create_weeks();
            $studentrows = create_student_rows();

            //inject dynamically generated content
            $site = str_replace( "{classes}", $classes, $site );
            $site = str_replace( "{weeks}", $weeks, $site );
            $site = str_replace( "{studentrows}", $studentrows, $site );
        }
        
        return $site;
    }
    
    $site = loadPage( $site );
    mysql_close( $database_connection ); 
?>
