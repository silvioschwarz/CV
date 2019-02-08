#!/bin/sh

gmt set FORMAT_GEO_MAP ddd:mm:ssF
gmt set FONT_ANNOT_PRIMARY 11p
gmt set FONT_LABEL 14p


ps="globalEXPENG.ps"

gmt pscoast -R27W/30E/36N/68N  -JM6i -P -B0 -G252/245/227 -W1/0.5p,0/0/0 -N1/0.5p,0/0/0 -N2/0.25p,120/120/120,2_1:0p -S255/255/255  -Dl -K -Xc --FORMAT_GEO_MAP=dddF --MAP_FRAME_TYPE=plain > $ps
cat citiesENG.txt | gmt pstext -R -J -O -K >> $ps
cat points.txt | gmt psxy -R -J -O -Sc0.4c -Gred -X-0.25  -K>> $ps

gmt mapproject -R-129/-63/23/51 -JM2i -W > tmp
read w h < tmp
gmt psbasemap -X-10 -Y-3.5 -R -J -O -K -DjTR+w$w/$h+o0.15i -F+gwhite+p1p+c0.1c+s >> $ps
read x0 y0 w h < tmp
gmt pscoast -R-129/-63/23/51 -JM4i -Da -G252/245/227 -W1/0.5p,0/0/0 -N1/0.5p,0/0/0 -N2/0.25p,120/120/120,2_1:0p -S255/255/255  -B0 -EES+gbisque -O -K -X10.25 -Y12.75 --MAP_FRAME_TYPE=plain >> $ps

cat citiesENG.txt | gmt pstext -R -J -O -K >> $ps
cat points.txt | gmt psxy -R -J -O -Sc0.4c -Gred -X-0.25 >> $ps


ps2pdf globalEXPENG.ps globalEXPENG.pdf
pdfcrop globalEXPENG.pdf ../img/globalEXPENG.pdf
