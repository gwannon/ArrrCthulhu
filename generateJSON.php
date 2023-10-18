<?php

$f = fopen("./index.csv", "r");
$page = 0;
$json = [];
while (($row = fgetcsv($f, 0, ",")) !== FALSE) {
  $page = $page + $row[2];
  $json[] = [
    "title" => $row[0],
    "page" => $page
  ];
}

fclose($f);
echo json_encode($json);