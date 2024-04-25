set datafile separator ','
set samples 1000

set xlabel "Time (s)"
set ylabel "Position (m)"
set tics out nomirror
set border 3
set key above center horizontal samplen 0
set pointsize 0.5
set grid
set fit limit 1e-8

### CONTROL

A = 0.045
o = 7.3
p = 0.001
f(x) = A * cos(o*x + p)

set table $FITDATA
plot 'data.csv' using 1:2 skip 1, \
     'data.csv' using 3:4 skip 1, \
     'data.csv' using 5:6 skip 1
unset table

fit f(x) $FITDATA via A, o, p

set terminal svg
set output 'control.svg'
plot 'data.csv' using 1:2 skip 1 with points title "Trial 1" pointtype 7, \
     'data.csv' using 3:4 skip 1 with points title "Trial 2" pointtype 7, \
     'data.csv' using 5:6 skip 1 with points title "Trial 3" pointtype 7, \
     f(x) title "" linewidth 2 dashtype 4

### POSITION

A = 0.07
o = 7.3
p = 3.5
f(x) = A * cos(o*x + p)

set table $FITDATA
plot 'data.csv' using  7:8  skip 1, \
     'data.csv' using  9:10 skip 1, \
     'data.csv' using 11:12 skip 1
unset table

fit f(x) $FITDATA via A, o, p

set terminal svg
set output 'position.svg'
plot 'data.csv' using  7:8  skip 1 with points title "Trial 1" pointtype 7, \
     'data.csv' using  9:10 skip 1 with points title "Trial 2" pointtype 7, \
     'data.csv' using 11:12 skip 1 with points title "Trial 3" pointtype 7, \
     f(x) title "" linewidth 2 dashtype 4

### POSITION

A = 0.07
o = 7.3
p = 3.5
f(x) = A * cos(o*x + p)

set table $FITDATA
plot 'data.csv' using  7:8  skip 1, \
     'data.csv' using  9:10 skip 1, \
     'data.csv' using 11:12 skip 1
unset table

fit f(x) $FITDATA via A, o, p

set terminal svg
set output 'position.svg'
plot 'data.csv' using  7:8  skip 1 with points title "Trial 1" pointtype 7, \
     'data.csv' using  9:10 skip 1 with points title "Trial 2" pointtype 7, \
     'data.csv' using 11:12 skip 1 with points title "Trial 3" pointtype 7, \
     f(x) title "" linewidth 2 dashtype 4

### MASS

A = 0.05
o = 5.2
p = 5.8
f(x) = A * cos(o*x + p)

set table $FITDATA
plot 'data.csv' using 13:14 skip 1, \
     'data.csv' using 15:16 skip 1, \
     'data.csv' using 17:18 skip 1
unset table

fit f(x) $FITDATA via A, o, p

set terminal svg
set output 'mass.svg'
plot 'data.csv' using 13:14 skip 1 with points title "Trial 1" pointtype 7, \
     'data.csv' using 15:16 skip 1 with points title "Trial 2" pointtype 7, \
     'data.csv' using 17:18 skip 1 with points title "Trial 3" pointtype 7, \
     f(x) title "" linewidth 2 dashtype 4

### SPRING

A = 0.05
o = 7.7
p = 0.01
f(x) = A * cos(o*x + p)

set table $FITDATA
plot 'data.csv' using 19:20 skip 1, \
     'data.csv' using 21:22 skip 1, \
     'data.csv' using 23:24 skip 1
unset table

fit f(x) $FITDATA via A, o, p

set terminal svg
set output 'spring.svg'
plot 'data.csv' using 19:20 skip 1 with points title "Trial 1" pointtype 7, \
     'data.csv' using 21:22 skip 1 with points title "Trial 2" pointtype 7, \
     'data.csv' using 23:24 skip 1 with points title "Trial 3" pointtype 7, \
     f(x) title "" linewidth 2 dashtype 4
