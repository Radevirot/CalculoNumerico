clear all; clc; format long;

t = [1 2 3 4 5 6 7 8 9 10 11 12]';
y = [26.5 25 23.3 20.6 17.3 14.7 14.2 15.6 17.7 20.9 22.2 25.3]';

f1 = @(t) t;
f2 = @(t) ones(size(t));
f3 = @(t) sin((pi/6).*t);
f4 = @(t) cos((pi/6).*t);

M = [f1(t) f2(t) f3(t) f4(t)];

A = M'*M; b = M'*y;

c = A\b

ft = @(t) c(1).*f1(t) + c(2).*f2(t) + c(3).*f3(t) + c(4).*f4(t);

error_cuad_abs = norm(y - ft(t)) %el error se calcula como la norma 2 de la diferencia
                                 %entre las "y" originales y las de la función obtenida
temp_med_enero_2020 = ft(13)
error_rel = abs(27.7 - temp_med_enero_2020)/abs(27.7)
