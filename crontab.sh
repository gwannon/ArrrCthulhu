#!/bin/bash
git -C /var/www/vhosts/arrrcthulhu.gwannon.com/ArrrCthulhu pull
chromium --no-sandbox --disable-gpu --no-pdf-header-footer --disable-back-forward-cache-for-cache-control-no-store-page --print-to-pdf=/var/www/vhosts/arrrcthulhu.gwannon.com/ArrrCthulhu/ArrrCthulhu.pdf /var/www/vhosts/arrrcthulhu.gwannon.com/ArrrCthulhu/index.html
exiftool -overwrite_original -Title="¡Arrr! Cthulhu - Aventuras de piratas en el Caribe de los mitos de Cthulhu." -Author="@Gwannon" -Subject="¡Arrr! Cthulhu es una ambientación para SWADE con el que podrás jugar aventuras de piratas en el Caribe de los Mitos de Cthulhu. Versión 0.6" /var/www/vhosts/arrrcthulhu.gwannon.com/ArrrCthulhu/ArrrCthulhu.pdf
