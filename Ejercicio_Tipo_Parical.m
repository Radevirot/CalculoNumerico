clear all; clc cls;

x = [0.0 0.2 0.4 0.6 0.8 1.0 1.2 1.4 1.6 1.8 2.0]';
y = [4.24 4.44 4.91 5.44 5.65 5.33 3.91 1.86 0.07 -1.16 -1.94]';

f1 = @(x) ones(size(x));
f2 = @(x) cos(pi*x/2);
f3 = @(x) (cos(pi*x/2)).^2;

M = [f1(x) f2(x) f3(x)];

A = M'*M;
b = M'*y;


disp('Coeficientes encontrados: ')
c = gauss_v(A, b)

yx = @(x) c(1)*f1(x) + c(2)*f2(x) + c(3)*f3(x);

disp('Error: ')
abs(5.33 - yx(1.0))
