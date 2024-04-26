pkg load optim;

data = csvread("data.csv");

model = @(b, X) b(1) * cos(b(2) * X + b(3));

X = data(2:end, 1);
Y = data(2:end, 2);

beta0 = [0.045, 7.3, 0.001];
[beta, R, _, _] = nlinfit(X, Y, model, beta0);

csvwrite("parameters.csv", beta')
