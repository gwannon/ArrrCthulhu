#!/bin/bash
service mysql stop
chromium --headless --no-sandbox --no-pdf-header-footer --print-to-pdf=/root/ArrrCthulhu.pdf https://arrrcthulhu.com/
exiftool -overwrite_original -Title="¡Arrr! Cthulhu - Aventuras de piratas en el Caribe de los mitos de Cthulhu." -Author="@Gwannon" -Subject="¡Arrr! Cthulhu es una ambientación para SWADE con el que podrás jugar aventuras de piratas en el Caribe de los Mitos de Cthulhu. Versión 0.6.2" /root/ArrrCthulhu.pdf
cp /root/ArrrCthulhu.pdf /var/www/vhosts/arrrcthulhu.gwannon.com/ArrrCthulhu/ArrrCthulhu.pdf
service mysql start