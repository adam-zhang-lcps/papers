set datafile separator '\t'
set key off

set xlabel 'Strain (m/m)'
set ylabel 'Load (N)'
set xrange [0:1.5]

plot 'data.tsv' using 5:(abs($2)) with lines

set terminal png font 'Karla,18'
set output 'graph.png'
replot