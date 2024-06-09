clear all; clc;

h = [0.2 0.1 0.05];
L = 1./h;
f = @(t,y) t.*exp(3.*t)-2.*y;
dfdy = @(t) t.*exp(3.*t)-2;
yt = @(t) t.*exp(3.*t)./5-exp(3.*t)./25+exp(-2.*t)./25
y0 = 0;
a = 0; b = 1; inter = [a b];

disp('Para h=0.2')
[t, y] = euler(f,inter,y0,L(1));
euler_error_02 = abs(yt(t)-y)
%[t, y] = euler_atras_nw(f, dfdy, a, b, y0, L(1), 1, 1);
%bckw_euler_error_02 = abs(yt(t)-y)
[t, y] = CN_newton(f,dfdy,a,b,y0,L(1)); %usar kmax en 1
CN_error_02 = abs(yt(t)-y)
[t, y] = rk4(f, inter, y0, L(1));
rk4_error_02 = abs(yt(t)-y)

disp('Para h=0.1')
[t, y] = euler(f,inter,y0,L(2));
euler_error_01 = abs(yt(t)-y)
%[t, y] = euler_atras_nw(f, dfdy, a, b, y0, L(2), 1, 1);
%bckw_euler_error_01 = abs(yt(t)-y)
[t, y] = CN_newton(f,dfdy,a,b,y0,L(2)); %usar kmax en 1
CN_error_01 = abs(yt(t)-y)
[t, y] = rk4(f, inter, y0, L(2));
rk4_error_01 = abs(yt(t)-y)

disp('Para h=0.05')
[t, y] = euler(f,inter,y0,L(3));
euler_error_005 = abs(yt(t)-y)
%[t, y] = euler_atras_nw(f, dfdy, a, b, y0, L(3), 1, 1);
%bckw_euler_error_005 = abs(yt(t)-y)
[t, y] = CN_newton(f,dfdy,a,b,y0,L(3)); %usar kmax en 1
CN_error_005 = abs(yt(t)-y)
[t, y] = rk4(f, inter, y0, L(3));
rk4_error_005 = abs(yt(t)-y)
