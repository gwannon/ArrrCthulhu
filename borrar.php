<?php
$step = rand (5, 10);
for ($i = 0; $i < $step; $i++) {
  if (!isset($url))$url = "https://itch.io/physical-games";
  $urls = [];
  $html = file_get_contents($url);
  preg_match_all('/https:\/\/([a-z]*).itch\.io\/([a-z\-]{3,240})/', $html, $matches);
  foreach ($matches[0] as $match) {
    if (!in_array($match, $urls) && !preg_match('/static/', $match)) {
      $urls[] = $match;
    }
  }
  if(count($urls) > 0) {
    $rand = rand(0, count($urls) - 1);
    $url = $urls[$rand];
  }
}

echo $url;
