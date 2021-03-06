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

# okfast
FILE_NAME_25="debug25-okfast2x.log.csv"
FILE_NAME_26="debug26-okfast8x.log.csv"
FILE_NAME_27="debug27-okfast2x_2nd.log.csv"
FILE_NAME_28="debug28-okfast2x_3rd.log.csv"
FILE_NAME_29="debug29-okfast2x_4th.log.csv"

# only skip
FILE_NAME_30="debug30-skip.log.csv"
FILE_NAME_31="debug31-skip_2nd.log.csv"
FILE_NAME_32="debug32-skip_3rd.log.csv"
FILE_NAME_33="debug33-move.log.csv"
FILE_NAME_34="debug34-split.log.csv"
FILE_NAME_35="debug35-moonlight.log.csv"
FILE_NAME_36="debug36-skip_4th.log.csv"

# move
FILE_NAME_37="debug37-temp.log.csv"
FILE_NAME_38="debug38-move.log.csv"
FILE_NAME_39="debug39-move_2nd.log.csv"

# temp
FILE_NAME_40="debug40-moreHeaders.log.csv"
FILE_NAME_41="debug41-nolog.log.csv"
FILE_NAME_42="debug42-reindexC.log.csv"

# skip
FILE_NAME_43="debug43-skip.log.csv"
FILE_NAME_44="debug44-skip-RC.log.csv"
FILE_NAME_45="debug45-skip2.log.csv"
FILE_NAME_46="debug46-moonlight.log.csv"
FILE_NAME_47="debug47-skip-R.log.csv"

# last
FILE_NAME_50="debug50-moonlight.log.csv"
FILE_NAME_51="debug51-skip.log.csv"
FILE_NAME_52="debug52-reindex.log.csv"
FILE_NAME_53="debug53-reindex-chainstate.log.csv"
FILE_NAME_54="debug54-skip2.log.csv"

# revert#80
FILE_NAME_60="debug60-1d5a8c.log.csv"
FILE_NAME_61="debug61-revert80.log.csv"

# revert78
FILE_NAME_63="debug63-mb.log.csv"
FILE_NAME_64="debug64-MHR_2.log.csv"
FILE_NAME_65="debug65-MHR_4.log.csv"
FILE_NAME_66="debug66_MHR_2_2nd.log.csv"

# temp
# FILE_NAME_0="debug.log.csv"

# v32
FILE_NAME_70="debug70-moveCB.log.csv"
FILE_NAME_71="debug71-b2000.log.csv"
FILE_NAME_72="debug72-move2000.log.csv"
FILE_NAME_73="debug73-v31.log.csv"
FILE_NAME_74="debug74-v32.log.csv"
FILE_NAME_75="debug75-v32-w64.log.csv"
FILE_NAME_76="debug76-v32-osx.log.csv"

# VPS
FILE_NAME_80="debug80-vps1-vtest-swap3gb.log.csv"
FILE_NAME_81="debug81-vps2-vtest-swap4gb.log.csv"

# vtest
FILE_NAME_90="debug90-vtest.log.csv"
FILE_NAME_91="debug91-nopow.log.csv"
FILE_NAME_92="debug92-dbcache50_maxmempool10.log.csv"
FILE_NAME_93="debug93-bootstrap.log.csv"
FILE_NAME_94="debug94-8be.log.csv"

# [PR] fastsync
FILE_NAME_95="debug95-fastsync.log.csv"
FILE_NAME_96="debug96-fastsync-vps-3gb.log.csv"
FILE_NAME_97="debug97-fastsync-vps-4gb.log.csv"
FILE_NAME_98="debug98-fastsync-vps-4gb_2nd.log.csv"
FILE_NAME_99="debug99-fastsync-vps-3gb_2nd.log.csv"
FILE_NAME_100="debug100-no-fastsync.log.csv"
FILE_NAME_101="debug101-fastsync.log.csv"

# v33
FILE_NAME_102="debug102-v33.log.csv"
FILE_NAME_103="debug103-vps3gb.log.csv"
FILE_NAME_104="debug104-vps4gb.log.csv"
FILE_NAME_105="debug105-aarch64.log.csv"

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
"$FILE_NAME_73" using 2:3 axis x1y1 w l title "Ryzen1700+64GB+HDD" lc rgb "#00aabb" lw 1.0, \
"$FILE_NAME_74" using 2:3 axis x1y1 w l title "Ryzen1700+64GB+HDD" lc rgb "#00bbcc" lw 1.0, \
"$FILE_NAME_102" using 2:3 axis x1y1 w l title "Ryzen1700+64GB+HDD" lc rgb "#00ccdd" lw 1.0, \
"$FILE_NAME_103" using 2:3 axis x1y1 w l title "1cpu+1GB+swap3GB" lc rgb "#aabb00" lw 1.0, \
"$FILE_NAME_104" using 2:3 axis x1y1 w l title "1cpu+1GB+swap4GB" lc rgb "#bbcc00" lw 1.0, \
"$FILE_NAME_105" using 2:3 axis x1y1 w l title "RPI-aarch64" lc rgb "#aa00bb" lw 1.0, \
# "$FILE_NAME_50" using 2:3 axis x1y1 w l title "v30-moonlight" lc rgb "#000000" lw 1.0, \
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
