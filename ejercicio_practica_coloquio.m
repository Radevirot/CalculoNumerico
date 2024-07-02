clear all; clc;

K0 = 0.57 ; alpha = 6; H = 15; uE = 4; L = 2;

fuente = @(x) 2.*x.*(2-x);
cR = @(x) 0.1.*x.^3+2.5;
%cR = @(x) 2*ones(size(x));

inter = [0 L]; rob = [K0 H H*uE];

p = @(x) 0.*x;
q = @(x) cR(x)./K0;
r = @(x) -fuente(x)./K0;

f = @(x) [p(x) , q(x) , r(x)];

[x, y, L, i, h] = iterative_dif_fin_rob('dyb',f,inter,alpha,rob,10,1e-4,100);
temp_extr_der = y(end)

flujo_extr_der = -K0*((y(end)-y(end-1))/(x(end)-x(end-1)))

A = 0.01; c = 0.217; ro = 2.7;

integrando = c.*ro.*y;

Q = simpsoncomp(x,integrando);

E = A*Q
