set datafile separator ','

set title 'Strain (m/m) vs Load (N)'
set xlabel 'Strain (m/m)'
set ylabel 'Load (N)'
set xrange [0:1.5]

set key off
set grid
set style line 1 linewidth 2 linecolor rgbcolor "red"
set style line 2 linewidth 2 dashtype "-" linecolor rgbcolor "blue"

f(x) = a * x**3 + b * x**2 + c * x + d
fit f(x) 'data.csv' using 5:(abs($2)) via a, b, c, d
set label sprintf('y = %.3fx^3 + %.3fx^2 + %.3fx + %.3f', a, b, c, d) \
    at screen 0.5,0.05 center
set bmargin 5

set terminal x11
plot 'data.csv' using 5:(abs($2)) with lines linestyle 1, \
     f(x) with lines linestyle 2

set terminal svg
set output 'strain-load.svg'
replot