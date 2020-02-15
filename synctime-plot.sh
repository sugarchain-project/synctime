#!/bin/bash

## INIT
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

# FILE_NAME_1="uncached_IBD.log.csv"
# FILE_NAME_2="cached_IBD.log.csv"
# FILE_NAME_3="cached_IBD_1_p2000.log.csv"
# FILE_NAME_4="cached_IBD_2_p2000_w2048.log.csv"
# FILE_NAME_5="cached_IBD_3_p2000_w4096.log.csv"
# FILE_NAME_6="cached_IBD_4_p16_w1024.log.csv"

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
"$FILE_NAME_1" using 2:3 axis x1y1 w l title "$FILE_NAME_1" lc rgb "blue" lw 1.0, \
"$FILE_NAME_2" using 2:3 axis x1y1 w l title "$FILE_NAME_2" lc rgb "red" lw 1.0, \
"$FILE_NAME_3" using 2:3 axis x1y1 w l title "$FILE_NAME_3" lc rgb "purple" lw 1.0, \
"$FILE_NAME_4" using 2:3 axis x1y1 w l title "$FILE_NAME_4" lc rgb "orange" lw 1.0, \
"$FILE_NAME_5" using 2:3 axis x1y1 w l title "$FILE_NAME_5" lc rgb "#ccffff" lw 1.0, \
"$FILE_NAME_6" using 2:3 axis x1y1 w l title "$FILE_NAME_6" lc rgb "#ffccff" lw 1.0, \
"$FILE_NAME_7" using 2:3 axis x1y1 w l title "$FILE_NAME_7(cee8630)" lc rgb "#00ffcc" lw 1.0, \
"$FILE_NAME_8" using 2:3 axis x1y1 w l title "$FILE_NAME_8(7dd2e3e)" lc rgb "#ccff00" lw 1.0, \
"$FILE_NAME_9" using 2:3 axis x1y1 w l title "$FILE_NAME_9(8683428)" lc rgb "#cc00cc" lw 1.0, \
"$FILE_NAME_10" using 2:3 axis x1y1 w l title "$FILE_NAME_10(f9d0998)" lc rgb "#00aabb" lw 1.0,
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
