#!/bin/bash

## INIT
FILE_NAME_0="uncached.log.csv"
FILE_NAME_1="debug.log.csv"
FILE_NAME_2="debug2.log.csv"
FILE_NAME_3="debug3.log.csv"
FILE_NAME_4="debug4.log.csv"
FILE_NAME_5="debug5.log.csv"
FILE_NAME_6="debug6.log.csv"
FILE_NAME_7="debug7.log.csv"
FILE_NAME_8="debug8.log.csv"
FILE_NAME_9="debug9.log.csv"
FILE_NAME_10="debug10.log.csv"
# bad failure
FILE_NAME_11="debug11-9b5c0cb.log.csv"
FILE_NAME_12="debug12-827b0bd.log.csv"
FILE_NAME_13="debug13-cee8630.log.csv"
# retest
FILE_NAME_14="debug14-9b5c0cb.log.csv"
FILE_NAME_15="debug15-827b0bd.log.csv"
FILE_NAME_16="debug16-cee8630.log.csv"
# moonlight(v30) vs bloomy(v24)
FILE_NAME_17="debug17-moonlight.log.csv"
FILE_NAME_18="debug18-bloomy.log.csv"

# FILE_NAME_1="uncached_IBD.log.csv"
# FILE_NAME_2="cached_IBD.log.csv"
# FILE_NAME_3="cached_IBD_1_p2000.log.csv"
# FILE_NAME_4="cached_IBD_2_p2000_w2048.log.csv"
# FILE_NAME_5="cached_IBD_3_p2000_w4096.log.csv"
# FILE_NAME_6="cached_IBD_4_p16_w1024.log.csv"

# barrystyle IBD faster
FILE_NAME_20="debug20-moonlight.log.csv"
FILE_NAME_21="debug21-barry-4x.log.csv"
FILE_NAME_22="debug22-barry-4x_2nd.log.csv"
FILE_NAME_23="debug23-barry-8x.log.csv"
FILE_NAME_24="debug24-barry-2x.log.csv"

## DRAW PLOT
OUTPUT_PNG="./png/synctime.png"
gnuplot -persist <<-EOFMarker
set terminal pngcairo size 1500,1000 enhanced font "Ubuntu,12";
set output "$OUTPUT_PNG";

set title "Synchronization Time of Sugarchain Yumekawa";
set xlabel "Elapsed Time";
set ylabel "Block Height";

set datafile separator ","

set xrange [0:*];
set xtics 0, 3600 rotate by 45 right;

set xdata time
set timefmt "%s"
set format x "%H:%M:%S"

set yrange [0:*];
set ytics 0, 100000;
set format y '%.0f'

set grid xtics;

set key top left invert;
# set key center right invert;
set key box opaque;
set key noenhanced;

plot \
"$FILE_NAME_20" using 2:3 axis x1y1 w l title "$FILE_NAME_20" lc rgb "#af0000" lw 1.0, \
"$FILE_NAME_21" using 2:3 axis x1y1 w l title "$FILE_NAME_21" lc rgb "#af00af" lw 1.0, \
"$FILE_NAME_22" using 2:3 axis x1y1 w l title "$FILE_NAME_22" lc rgb "#afaf00" lw 1.0, \
"$FILE_NAME_23" using 2:3 axis x1y1 w l title "$FILE_NAME_23" lc rgb "#00afaf" lw 1.0, \
"$FILE_NAME_24" using 2:3 axis x1y1 w l title "$FILE_NAME_24" lc rgb "#00af00" lw 1.0,
# caution at the end: no "\"
EOFMarker

## ECHO
echo ""
echo -e "  \e[32m..PRINTING TO FILE $OUTPUT_PNG\e[39m"
echo ""

## COPY TO CLIPBOARD
xclip -selection clipboard -t image/png -i $OUTPUT_PNG

## OPEN PNG
feh --scale-down $OUTPUT_PNG
