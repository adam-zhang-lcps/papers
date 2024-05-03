#!/usr/bin/env octave

pkg load optim;

global data = csvread("data.csv");
global model = @(b, X) b(1) * cos(b(2) * X + b(3));
global lbound = zeros(3, 1);

function beta = perform_regression (column_idx, beta0)
  global data model lbound;

  # Combine data from all three trials
  X = data(2:end, column_idx);
  Y = data(2:end, column_idx);

  options = optimset("lbound", lbound);
  
  [beta, R, _, _] = nonlin_curvefit(model, beta0, X, Y, options);
endfunction

result = [];

for i = 1:12
  params = perform_regression(i * 2, [0.045; 7.3; 0.001]);
  result = [result; params'];
endfor

csvwrite("parameters.csv", result);
