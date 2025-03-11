#!/bin/bash

mv ./index.html ./temp.html
php ./tools/generateDocs.php
chromium --no-sandbox --headless --gpu --no-pdf-header-footer --print-to-pdf=./temp.pdf ./index.html
pdftk 'temp.pdf' update_info_utf8 'metas.txt' output 'ArrrCthulhu.pdf'
rm metas.txt
rm temp.pdf
cp ./index.html ./ArrrCthulhu.html
mv -f ./temp.html ./index.html