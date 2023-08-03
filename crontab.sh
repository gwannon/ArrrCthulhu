#!/bin/bash

exiftool -overwrite_original -Title="¡Arrr! Cthulhu - Aventuras de piratas en el Caribe de los mitos de Cthulhu." -Author="@Gwannon" -Subject="¡Arrr! Cthulhu es una ambientación para SWADE con el que podrás jugar aventuras de piratas en el Caribe de los Mitos de Cthulhu. Versión 0.6" /var/www/vhosts/arrrcthulhu.gwannon.com/ArrrCthulhu/ArrrCthulhu.pdf
git -C /var/www/vhosts/arrrcthulhu.gwannon.com/ArrrCthulhu pull