#!/usr/bin/env octave

pkg load optim;

global data = csvread("data.csv");
global model = @(b, X) b(1) * cos(b(2) * X + b(3));
global bounds = [0; -inf; -inf];

function beta = perform_regression (column_idx, beta0)
  global data model bounds;

  X = data(2:end, 1);
  Y = data(2:end, 1 + column_idx);

  options = optimset("lbound", bounds);

  [beta, R, _, _] = nonlin_curvefit(model, beta0, X, Y, options);
endfunction

result = [];

for i = 1:12
  beta0 = [0.045; 7.3; 0.001];

  ## Trials with a further initial position have inverted position. Why? I have
  ## no idea.
  if i > 3 && i < 7
    beta0 = [0.07; 7.3; -3];
  endif

  ## Trials with a heavier mass have a significantly lower period that optimization
  ## isn't able to find from the usual starting point.
  if i > 6 && i < 10
    beta0 = [0.045; 5.3; -0.45];
  endif

  beta0
  params = perform_regression(i, beta0);
  result = [result; params'];
endfor

csvwrite("parameters.csv", result);
