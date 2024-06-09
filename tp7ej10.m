% ECUACION ORIGINAL:
% th''(t)+sin(th(t)) = 0
% th(0) = a, th'(0) = b
%
% DESPEJE:
% th''(t) = - sin(th(t))
% y1 = th
% y2 = th' = y1'
% y3 = th'' = y2'
%
% SISTEMA FORMADO:
% y1' = y2
% y2' = -sin(y1)
% y1(0) = a, y2(0) = b
%

clear all; clc; format long;
inter = [0 20];
h = 0.05; L = 20/0.05;
f = @(t, y) [y(2) ; -sin(y(1))];
y0 = [0.1 0 ; 0.7 0 ; 3.0 0 ; 3.5 0 ; 0 1 ; 0 1.99 ; 0 2 ; 0 2.01];

for i=1:8
[t, y] = rk4(f, inter, y0(i,:), L);
figure(i); hold on; grid on; grid minor;
plot(t,y(:,1),'bo-'); plot(t,y(:,2),'go-');
legend('angulo','dangulo');
endfor


