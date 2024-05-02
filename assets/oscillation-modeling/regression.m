#!/usr/bin/env octave

pkg load optim;

global data = csvread("data.csv");
global model = @(b, X) b(1) * cos(b(2) * X + b(3));

function beta = perform_regression (column_idx, beta0)
  global data model;

  # Combine data from all three trials
  X = [];
  Y = [];
  for i = 0:2
    X = [X; data(2:end, column_idx + (i * 2))];
    Y = [Y; data(2:end, column_idx + (i * 2) + 1)];
  endfor
  
  [beta, R, _, _] = nonlin_curvefit(model, beta0, X, Y);
endfunction

## Control
control_p = perform_regression(1, [0.045; 7.3; 0.001]);
## Initial position
pos_p = perform_regression(7, [0.07; 7.3; 0.001]);
## Mass
m_p = perform_regression(13, [0.05; 5.2; 0.001]);
## Spring
k_p = perform_regression(19, [0.05; 7.7; 0.001]);

csvwrite("parameters.csv", [control_p'; pos_p'; m_p'; k_p']);
