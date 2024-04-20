set datafile separator ','

set yrange [-0.1:0.1]

plot 'data.csv' using 1:2 with linespoints, \
     'data.csv' using 3:4 with linespoints, \
     'data.csv' using 5:6 with linespoints
