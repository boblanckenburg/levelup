<?php

include "CsvImporter.php";

$site = show_content($site, $_GET['content']);

if(isset($_POST["upload"])) {
    $site = show_upload($site);
    
} else if(isset($_POST["import"])) {
    import_students();
    $site = show_import($site);
    
} else if(isset($_POST["query"])) {
    $site = show_stats_from_query($site);
} else {
    $site = show_empty_page($site);
}

function show_upload($site) {
    $target_dir = "uploads/";
    $target_file = $target_dir . basename($_FILES["studentscsv"]["name"]);
    $fileType = pathinfo($target_file,PATHINFO_EXTENSION);
    $file = $_FILES["studentscsv"]["tmp_name"];
    
    if($fileType != "csv") {
        $site = str_replace( "{error}", "Please upload a valid csv file", $site );
        $site = str_replace( "{studentrows}", "", $site );
        $site = str_replace( "{weeks}", "", $site );
        $site = str_replace( "{importenabled}", "disabled", $site );
        
    } else {
        $site = str_replace( "{error}", "", $site );
        $site = str_replace( "{importenabled}", "", $site );
        $site = str_replace( "{file}", $file, $site );
        
        $csv_data = process_csv($file);
        
        $studentnumbers = get_student_numbers($csv_data);
        $site = str_replace( "{studentnumbers}", $studentnumbers, $site );
        
        $studentrows = create_insert_header_weeks($csv_data);
        $site = str_replace( "{weeks}", $studentrows, $site );
        
        $studentrows = create_insert_student_rows($csv_data);
        $site = str_replace( "{studentrows}", $studentrows, $site );
    }
    
    return $site;
}

function show_import($site) {   
    $site = str_replace( "{error}", "Students imported", $site );
    $site = str_replace( "{studentrows}", "", $site );
    $site = str_replace( "{weeks}", "", $site );
    $site = str_replace( "{importenabled}", "disabled", $site );
    return $site;
}

function show_empty_page($site) {   
    $site = str_replace( "{error}", "", $site );
    $site = str_replace( "{studentrows}", "", $site );
    $site = str_replace( "{importenabled}", "disabled", $site );
    $site = str_replace( "{minpoints}", "", $site );
    $site = str_replace( "{maxpoints}", "", $site );
    $site = str_replace( "{mindelta}", "", $site );
    $site = str_replace( "{maxdelta}", "", $site );
    $site = str_replace( "{classes}", "", $site );
    $site = str_replace( "{weeks}", "", $site );
    $site = str_replace( "{download_content}", "", $site);
    return $site;
}

function show_stats_from_query($site) {
    $minpoints = $_POST["minpoints"];
    $maxpoints = $_POST["maxpoints"];
        
    $mindelta = $_POST["mindelta"];
    $maxdelta = $_POST["maxdelta"];
    
    $classes = $_POST["classes"];
    
    $studentdata = create_stats_student_data($minpoints, $maxpoints, $mindelta, $maxdelta, $classes);
    $studentrows = create_stats_student_rows($studentdata);
    $studentcsv = create_stats_student_csv($studentdata);
    
    $site = str_replace( "{studentrows}", $studentrows, $site );

    $site = str_replace( "{minpoints}", $minpoints, $site );
    $site = str_replace( "{maxpoints}", $maxpoints, $site );
    $site = str_replace( "{mindelta}", $mindelta, $site );
    $site = str_replace( "{maxdelta}", $maxdelta, $site );
    $site = str_replace( "{classes}", $classes, $site );
    $site = str_replace( "{weeks}", "", $site );
    $site = str_replace( "{error}", "", $site );
    $site = str_replace( "{download_content}", rawurlencode($studentcsv), $site);
    return $site;
}

function show_content($site, $content) {
    $site = preg_replace( "({".$content."-hidden})", "", $site );
    $site = preg_replace( "({.*?-hidden})", "hidden", $site );
    return $site;
}

function import_students() {
    $studentnumbers = split(",", $_POST['studentnumbers']);
    foreach($studentnumbers as $studentnumber) {
        $check = $_POST['check-'.$studentnumber];
        if($check == 'on') {
            $pattern = "/week-(\d+)-" . $studentnumber . "/";
            $weekpoints = Array();
            foreach( $_POST as $key => $value ) {
                if(preg_match($pattern, $key)) {
                    $points = $value;
                    $weeknumber = preg_replace($pattern, "$1", $key);
                    $weekpoints[$weeknumber] = $points;
                }
            }
            update_student_homework($studentnumber, $weekpoints);
        }
    }
}

function update_student_homework($number, $weekpoints) {
        //insert new
        foreach($weekpoints as $week => $point) {
            $query = "REPLACE INTO homework (weeknumber, grade, student_name)
                VALUES(\"" . $week . "\", \"" . $point . "\", \"".$number."\")";
            mysql_query( $query );
        }
        
        update_points($number);
}

function process_csv($file) {
    $importer = new CsvImporter($file, true, ';');
    $csv_data = $importer->get();
    
    return $csv_data;
}

function get_student_numbers($csv_data) {
    $studentnumbers = "";
    foreach($csv_data as $row) {
        $studentnumber = $row['Gebruikersnaam'];
        $studentnumbers .= $studentnumber . ",";
    }
    return $studentnumbers;
}

function create_stats_student_data($minpoints, $maxpoints, $mindelta, $maxdelta, $classes) {
    $studentdata = Array();
    $data = Array();
    $current_time = new DateTime($value['date']);
    
    $fullquery = "SELECT students.name, students.nickname, students.class, students.points, students.lastlogin
                    FROM students
                    GROUP BY students.name
                    ORDER BY students.class ASC, students.points DESC";
    $fullresult = mysql_query($fullquery);

    $classlist = explode(',',$classes);
    while( $row = mysql_fetch_assoc( $fullresult ) ) {
        if($classlist[0] == "" || in_array($row['class'], $classlist)) {
            $data['studentnumber'] = $row['name'];
            $data['studentname'] = $row['nickname'];
            $data['class'] = $row['class']; 
            $data['points'] = $row['points']; 
            $data['lastopened'] = $row['lastlogin']; 
            
            //calculate history delta
            $deltaquery = "SELECT points, date FROM points_history 
                            WHERE student_name = '" . $data['studentnumber'] . "'
                            ORDER BY 'date' ASC";
            $deltaresult = mysql_query($deltaquery);
            $history = Array();
            while( $row = mysql_fetch_assoc( $deltaresult ) ) {
                array_push($history, $row);
            }
            
            $old_points = 0;
            $delta = 0;
            $last_points = 0;
            foreach( $history as $key => $value ) {
                $date = new DateTime($value['date']);
                $daydiff = $current_time->diff($date)->days;
                if($daydiff >= 7) {
                    $old_points = $value['points'];
                } else {
                    $last_points = $value['points'];
                }
            }
            $data['delta'] = max(0, $last_points - $old_points);
            
            if((empty($minpoints) || $data['points'] >= $minpoints) && 
               (empty($maxpoints) || $data['points'] <= $maxpoints) &&
               (empty($mindelta) || $data['delta'] >= $mindelta) && 
               (empty($maxdelta) || $data['delta'] <= $maxdelta)) {
                   array_push($studentdata, $data);
            }
        }
    }
    
    return $studentdata;
}

function create_stats_student_csv($data) {
    $studentrow = "Studentnummer,Studentnaam,Klas,Punten,Laatste login,Stijging (laatste 7 dagen)\n";
    foreach($data as $row) {
        foreach($row as $value) {
            $studentrow .= $value . ",";
        }
        $studentrow .= "\n";
    }
    return $studentrow;
}

//create a stats student row
function create_stats_student_rows($data) {
    $studentrow = "";
    foreach($data as $row) {
        $studentrow .= "<tr>";
        foreach($row as $value) {
            $studentrow .= "<td>" . $value . "</td>";
        }
        $studentrow .= "</tr>";
    }
    return $studentrow;
}

//create the headers for the weeks data on top of the table
function create_insert_header_weeks($data) {
    $header_weeks = array_keys($data[0]);
    $header_weeks = preg_grep("/week (.*)/i", $header_weeks);
    usort($header_weeks, 'sort_by_week');
    $header = "";
    foreach($header_weeks as $week) {
        $header .= "<td style='white-space: nowrap;'>" . preg_replace("/(week \d+)(.*)/i", "$1", $week) . "</td>";
    }
    
    return $header;
}

//sorting helper
function sort_by_week($week_a, $week_b) {
    $week_a_num = intval(preg_replace("/.*?(\d+).*/", "$1", $week_a));
    $week_b_num = intval(preg_replace("/.*?(\d+).*/", "$1", $week_b));
    return ($week_a_num - $week_b_num);
}

//create all rows with on each row the student details
function create_insert_student_rows($data) {
    $studentrows = "";
    
    //get the table header texts for the weeks
    $header_weeks = array_keys($data[0]);
    $header_weeks = preg_grep("/week (.*)/i", $header_weeks);
    
    //sort the weeks in ascending order
    usort($header_weeks, 'sort_by_week');
    
    //iterate over the csv data
    foreach($data as $row) {
            
        //if this participant has a student number, continue. Otherwise, ignore.
        $studentnumber = $row['Gebruikersnaam'];
        if(preg_match("/s\d+/i", $studentnumber)) {
            
            //get the current points per week for this student
            $query = "SELECT weeknumber, grade FROM homework WHERE student_name = '" . $studentnumber . "'";
            $result = mysql_query($query);
            while( $currentpoints_row = mysql_fetch_assoc( $result ) ) {
                $currentpoints[$currentpoints_row["weeknumber"]] = $currentpoints_row["grade"]; 
            }
            
            //get the new points per week for this student, aligned with the table column name for each week
            foreach($header_weeks as $week_name) {
                $week_name_short = preg_replace("/(.*?\d+).*/i", "$1", $week_name);
                $weekpoints[$week_name_short] = preg_replace("/.*?(\d+).*/i", "$1", $row[$week_name]);
            }
            
            $studentrows .= create_insert_student_row($studentnumber, $currentpoints, $weekpoints);
        }
    }
    return $studentrows;
}

//create a row with student details
function create_insert_student_row($studentnumber, $currentpoints, $weekpoints) {
    $query = "SELECT * FROM students WHERE name = '" . $studentnumber . "'";
    $studentdata = mysql_fetch_assoc(mysql_query($query));
    $studentname = $studentdata['nickname'];
    $studentclass = $studentdata['class'];
    
    $studentrow = "<tr>";
    $studentrow .= "<td style='white-space: nowrap;'><input type='checkbox' class='studentcheck' name='check-".$studentnumber."' checked></td>";
    $studentrow .= "<td style='white-space: nowrap;'>" . $studentnumber . "</td>";
    $studentrow .= "<td style='white-space: nowrap;'>" . $studentname . "<input value='".$studentname."' name='name-".$studentnumber."' type='hidden'/></td>";
    $studentrow .= "<td style='text-align: center; white-space: nowrap;'>" . $studentclass . "<input value='".$studentclass."' name='class-".$studentnumber."' type='hidden'/></td>";
    
    //iterate over each points per week and add a table cell for each
    foreach($weekpoints as $weekname => $points) {
        $weeknumber = preg_replace("/.*?(\d+).*/i", "$1", $weekname);
        $currentpoint = $currentpoints[$weeknumber];
        
        //assign default values when variables are empty
        if(!isset($currentpoint) || $currentpoint == "" || empty($currentpoint)) {
            $currentpoint = 0;
        }
        
        //no change? colour differently and don´t include in the POST import
        if(($points == "" || !isset($points)) || (doubleval($points) == doubleval($currentpoint))) {
            $studentrow .= "<td style='text-align: center; white-space: nowrap;'><div style='color:#888888;'>" . intval($currentpoint) . "</div></td>";
        } else {
            $studentrow .= "<td style='text-align: center; white-space: nowrap;'>" . $points . "<input value='" . $points . "' name='week-" . $weeknumber . "-" . $studentnumber . "' type='hidden'/></td>";
        }
    }
    
    $studentrow .= "</tr>";
    return $studentrow;
}

?>