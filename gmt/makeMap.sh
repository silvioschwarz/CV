#!/bin/sh

ps=example_44.ps

# Determine size of insert map of Europe
gmt mapproject -R15W/35E/30N/48N -JM2i -W > tmp
read w h < tmp
gmt pscoast -R10W/5E/35N/44N -JM6i -Baf -BWSne -EES+gbisque -Gbrown -Wfaint -N1/1p -Sazure1 -Df -O -K -Y4.5i --FORMAT_GEO_MAP=dddF >> $ps
gmt psbasemap -R -J -O -K -DjTR+w$w/$h+o0.15i/0.1i+stmp -F+gwhite+p1p+c0.1c+s >> $ps
read x0 y0 w h < tmp
gmt pscoast -R15W/35E/30N/48N -JM$w -Da -Gbrown -B0 -EES+gbisque -O -K -X$x0 -Y$y0 --MAP_FRAME_TYPE=plain >> $ps
gmt psxy -R -J -O -T -X-${x0} -Y-${y0} >> $ps
rm -f tmp

#ps2pdf $post globalExp.pdf
#pdfcrop globalExp.pdf ../img/globalExp.pdf
