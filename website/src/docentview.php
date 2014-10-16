<?php

	$studentlist = "";
	$studentlist .= "<div class=\"studentfield\">Jan Janssen</div>";
	$studentlist .= "<div class=\"studentfield light\">Karel Korthaar</div>";
	$studentlist .= "<div class=\"studentfield\">Piet Paulusma</div>";
	$studentlist .= "<div class=\"studentfield light\">Fred Fopneus</div>";
	
	$site = str_replace( "{students}", $studentlist, $site );
	
	
	$checkboxlist = "";
	$checkboxlist .= "<div class=\"checkfield\"><input type=\"checkbox\"></input></div>";
	$checkboxlist .= "<div class=\"checkfield light\"><input type=\"checkbox\"></input></div>";
	$checkboxlist .= "<div class=\"checkfield\"><input type=\"checkbox\"></input></div>";
	$checkboxlist .= "<div class=\"checkfield light\"><input type=\"checkbox\"></input></div>";
	
	$site = str_replace( "{checks}", $checkboxlist, $site );


?>
