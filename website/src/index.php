<?php

	global $site;

	$index_file = "index.html";
	$content_file = $_GET["page"];
	$name = "Jos van Egmond";
	
	$site = file_get_contents( $index_file );
	$content = file_get_contents( $content_file . ".html" );
	
	$site = str_replace( "{name}", $name, $site );
	$site = str_replace( "{content}", $content, $site );
	
	$site = str_replace( "{css}", $content_file . ".css", $site );
	$site = str_replace( "{javascript}", $content_file . ".js", $site );
	
	include $content_file . ".php";
	
	echo $site;
?>