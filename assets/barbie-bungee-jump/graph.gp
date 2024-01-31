set datafile separator ','
set key off

set xlabel 'Strain (m/m)'
set ylabel 'Load (N)'
set xrange [0:1.5]

plot 'data.csv' using 5:(abs($2)) with lines

set terminal png font 'Karla,16'
set output 'graph.png'
replot