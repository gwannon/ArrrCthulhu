#!/bin/bash

chromium --no-sandbox --headless --disable-gpu --no-pdf-header-footer --disable-back-forward-cache-for-cache-control-no-store-page --print-to-pdf=./temp.pdf ./index.html

exiftool -overwrite_original -Title="¡Arrr! Cthulhu - Aventuras de piratas en el Caribe de los mitos de Cthulhu. Versión 1.0.1" -Author="@Gwannon" -Subject="¡Arrr! Cthulhu es una ambientación para SWADE con el que podrás jugar aventuras de piratas en el Caribe de los Mitos de Cthulhu. Versión 1.0.1" ./temp.pdf

php generateIndex.php > pdf.info

pdftk 'temp.pdf' update_info_utf8 'pdf.info' output 'temp2.pdf'

./pagination.sh temp2.pdf ArrrCthulhu.pdf

rm temp.pdf
rm temp2.pdf
rm pdf.info