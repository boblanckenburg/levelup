<?php


    $level = 5;
    $percent = 62;
   
    $nextlvl = 6;
    
    $daystreak = 2;
    $classposition = 5;
    $yourposition = 1;
    
    $site = str_replace( "{level}", $level, $site );
    $site = str_replace( "{prevlvl}", $level, $site );
    $site = str_replace( "{nextlvl}", $nextlvl, $site );
    $site = str_replace( "{percent}", $percent, $site );
    $site = str_replace( "{daystreak}", $daystreak, $site );
    $site = str_replace( "{classposition}", $classposition, $site );
    $site = str_replace( "{yourposition}", $yourposition, $site );

?>
