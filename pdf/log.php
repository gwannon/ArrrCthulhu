<?php

$bots = json_decode(file_get_contents("https://1001ghules.gwannon.com/pdf/log.php?bots=yes"));

$ips = [];
$json["total"] = 0;
$lines = explode("\n", file_get_contents (__DIR__."/log.txt"));
foreach ($lines as $line) {
  if($line != '') {
    $fields =  explode("|", $line);
    $last_key = array_key_last($fields);
    if ( !preg_match('('.implode('|',$bots['bots']).')', $fields[$last_key]) && !preg_match('('.implode('|',$bots['ips']).')', $fields[1])) {
      $json["descargas"][] = $fields;
      if(!in_array($fields[1], $ips)) {
        $ips[] = $fields[1];
        $json['total'] ++;
      }
    }
  }
}
header('Content-Type: application/json; charset=utf-8');
$json["descargas"] = array_reverse($json["descargas"]);
echo json_encode($json);