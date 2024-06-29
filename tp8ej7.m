clear all; clc;

W1 = 2; L = 6; L1 = 4; D = 0.2;
k = 2.04 ; H = 6e-3;
uw = 200; ue = 40;

inter = [0 L1]; rob = [k H H*ue];

p = @(x) 1./(L-x);
q = @(x) ((H.*L)./(k.*(L-x).*D.*W1)).*(((2.*W1)./L).*(L-x)+2.*D);
r = @(x) -ue.*q(x);

f = @(x) [p(x) , q(x) , r(x)];

[x, y, L, i, h] = iterative_dif_fin_rob('end',f,inter,uw,rob,10,1e-4,100);

plot(x,y,'b-'); grid on; grid minor;

% PARTE B

A = @(x) ((D.*W1)./L).*(L-x);
delta_x = x(2)-x(1);
delta_t = y(2)-y(1); % primer nodo interno = y(2), uw = y(1)
flujo = ((-k.*A(0))./delta_x).*delta_t














