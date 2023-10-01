<?php

$f = fopen("./index.csv", "r");
$page = 0;
while (($row = fgetcsv($f, 0, ",")) !== FALSE) {
  $page = $page + $row[2];
  echo "BookmarkBegin\nBookmarkTitle: {$row[0]}\nBookmarkLevel: {$row[1]}\nBookmarkPageNumber: {$page}\n";
}

fclose($f);
/*
BookmarkBegin
BookmarkTitle: Portada
BookmarkLevel: 1
BookmarkPageNumber: 1
*/