<?
	echo "test";
	
	$index_file = "index.html";
	$content_file = "studentview.html";

	$index = file_get_contents( $index_file );
	$content = file_get_contents( $content_file );
	
	$content = str_replace( "{content}", $content, $index );
	
	echo $content;
?>