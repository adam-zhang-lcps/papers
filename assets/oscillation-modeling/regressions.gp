set datafile separator ','
set key autotitle columnhead
set samples 1000

f(x) = A * cos(o*x + p)
A = 0.045
o = 7.3
p = 0.001

set fit limit 1e-8
fit f1(x) 'data.csv' skip 1 using 1:2 via A, o, p
fit f2(x) 'data.csv' skip 1 using 3:4 via A, o, p
fit f3(x) 'data.csv' skip 1 using 5:6 via A, o, p

set terminal svg
set output 'control.svg'
plot 'data.csv' using 1:2 with points, \
     'data.csv' using 3:4 with points, \
     'data.csv' using 5:6 with points, \
     f(x)
