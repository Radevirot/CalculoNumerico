clear all; clc;
inter = [0 20];
h = 0.05; L = 20/h;
x0 = [1 -1];

f = @(t,x) [-t.*x(2) ; t.*x(1) - t.*x(2)];

[t, x] = euler(f,inter,x0,L)

plot(x(:,1),x(:,2))
