<?php

include "CsvImporter.php";

$target_dir = "uploads/";
$target_file = $target_dir . basename($_FILES["studentscsv"]["name"]);
$uploadOk = 1;
$imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
// Check if image file is a actual image or fake image
if(isset($_POST["upload"])) {
    $file = $_FILES["studentscsv"]["tmp_name"];
    
    if($imageFileType != "csv") {
        $site = str_replace( "{error}", "Please upload a valid csv file", $site );
        $site = str_replace( "{studentrows}", "", $site );
        $site = str_replace( "{importenabled}", "disabled", $site );
        
    } else {
        $site = str_replace( "{error}", "", $site );
        $site = str_replace( "{importenabled}", "", $site );
        $site = str_replace( "{file}", $file, $site );
        
        $csv_data = process_csv($file);
        
        $studentnumbers = get_student_numbers($csv_data);
        $site = str_replace( "{studentnumbers}", $studentnumbers, $site );
        
        $studentrows = create_student_rows($csv_data);
        $site = str_replace( "{studentrows}", $studentrows, $site );
    }
    
} else if(isset($_POST["import"])) {
   import_students();
    
    $site = str_replace( "{error}", "Students imported", $site );
    $site = str_replace( "{studentrows}", "", $site );
    $site = str_replace( "{importenabled}", "disabled", $site );
} else {
    $site = str_replace( "{error}", "", $site );
    $site = str_replace( "{studentrows}", "", $site );
    $site = str_replace( "{importenabled}", "disabled", $site );
    
    $site = show_content($site, $_GET['content']);
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
            $name = $_POST['name-'.$studentnumber];
            $lastopened = $_POST['lastopened-'.$studentnumber];
            $dateobject = DateTime::createFromFormat('d-m-y H:i', $lastopened);
            $lastopened = $dateobject->format('Y-m-d H:i:s');
            update_student($studentnumber, $name, $lastopened);
        }
    }
}

function update_student($number, $name, $lastopened) {
        //check if student is present in students
        //if it is, remove it
        $result = mysql_query("SELECT * FROM students WHERE name=\"". $number."\" LIMIT 1");
    
        //delete old
        if(mysql_fetch_row($result)) {
            mysql_query( "DELETE FROM students WHERE name = '".$number."'" );
        }
        
        //insert new
        $points = "0";
        $class = "Bin1A";
        $higheststreak = "0";
        $password = "killerbunny";
        $inactive = "0";
        $query = "INSERT INTO students(name, nickname, points, class, lastlogin, highest_streak, password, inactive)
                VALUES (\"".$number."\",\"".$name."\",".$points.",\"".$class."\",\"".$lastopened."\",
                ".$higheststreak.",\"".$password."\",".$inactive.")";
        mysql_query( $query );
}

function process_csv($file) {
    $importer = new CsvImporter($file, true, ';');
    return $importer->get();
}

function get_student_numbers($csv_data) {
    $studentnumbers = "";
    foreach($csv_data as $row) {
        $studentnumber = $row['Gebruikersnaam'];
        $studentnumbers .= $studentnumber . ",";
    }
    return $studentnumbers;
}

function create_student_rows($csv_data) {
    $studentrows = "";
    foreach($csv_data as $row) {
        $studentrows .= "<tr>";
        
        $studentnumber = $row['Gebruikersnaam'];
        $studentname = $row['Voornaam'] . " " . $row['Achternaam'];
        $lastopened = $row['Laatst geopend']; 
        
        $studentrows .= "<td><input type='checkbox' name='check-".$studentnumber."'></td>";
        $studentrows .= "<td>" . $studentnumber . "</td>";
        $studentrows .= "<td>" . $studentname . "<input value='".$studentname."' name='name-".$studentnumber."' type='hidden'/></td>";
        $studentrows .= "<td><input type='text' size='4' value='Bin1A'></td>";
        $studentrows .= "<td>" . $lastopened . "<input value='".$lastopened."' name='lastopened-".$studentnumber."' type='hidden'/></td>";
        
        $studentrows .= "</tr>";
    }
    return $studentrows;
}

?>