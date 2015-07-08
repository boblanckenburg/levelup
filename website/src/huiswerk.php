<?php

$project_query = "SELECT title, text FROM homework_meta";
$project_result = mysql_query( $project_query );
$project_row = mysql_fetch_assoc( $project_result );
$project_title = $project_row['title'];
$project_text = $project_row['text'];

$site = str_replace( "{huiswerktitle}", $project_title, $site );
$site = str_replace( "{huiswerktext}", $project_text, $site );
?>