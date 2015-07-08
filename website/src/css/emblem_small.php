<?php

    //this is a php file disguised as a css file
    header('Content-Type: text/css');
    
    $emblem = "../img/emblems-small/level0";
    $emblemHover = $emblem."-MouseOver.png";
    $emblemImage = $emblem.".png";
?>

.levelcounter .levelcounter_image
{
    display:block;
    float: left;
    width: 94px;
    height: 80px;
    padding:10px;
    background-image: url('<?php echo $emblemImage; ?>');
    background-repeat: no-repeat;
    background-position: center;
    margin: 0px auto 0px auto;
}

.levelcounter .levelcounter_image:hover
{
    background-image: url('<?php echo $emblemHover; ?>');
}
