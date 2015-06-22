<?php

if( $_GET['submitgrade'] == 'true' )
{
    
}

$codecademy_query = "SELECT title, text FROM codecademy_meta";
$codecademy_result = mysql_query( $codecademy_query );
$codecademy_row = mysql_fetch_assoc( $codecademy_result );
$codecademy_title = $codecademy_row['title'];
$codecademy_text = $codecademy_row['text'];

$site = str_replace( "{codecademytitle}", $codecademy_title, $site );
$site = str_replace( "{codecademytext}", $codecademy_text, $site );

?>