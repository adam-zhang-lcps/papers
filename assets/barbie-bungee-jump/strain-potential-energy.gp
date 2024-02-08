set datafile separator ','

set title 'Strain (m/m) vs Potential Energy (J)'
set xlabel 'Strain (m/m)'
set ylabel 'Potential Energy (J)'
set xrange [0:10]

set key off
set grid
set style line 1 linewidth 2 dashtype "-" linecolor rgbcolor "blue"

f(x) = 0.419*x + 10.66*x**2 - 5.08367*x**3 + 1.193*x**4

set terminal x11
plot f(x) with lines linestyle 1

set terminal svg
set output 'strain-potential-energy.svg'
replot