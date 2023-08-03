<?php

$bots = [
  "facebookexternalhit/1.1",
  "Semanticbot/1.0",
  "serpstatbot/2.1",
  "Twitterbot/1.0",
  "SemrushBot/7~bl",
  "bingbot/2.0",
  "WhatsApp/2",
  "BW/1.1"
];
$json = [];
$lines = explode("\n", file_get_contents (__DIR__."/log-".date("W").".txt"));
foreach ($lines as $line) {
  if($line != '') {
    $fields =  explode("|", $line);
    $last_key = array_key_last($fields);
    if ( !preg_match('('.implode('|',$bots).')', $fields[$last_key])) $json[] = $fields;
  }
}
header('Content-Type: application/json; charset=utf-8');
echo json_encode(array_reverse($json));