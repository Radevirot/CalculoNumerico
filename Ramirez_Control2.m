clear all; clc;

f = @(x) (x./(1-x)).*((2*3.4)./(2+x)).^(1/2) - 0.04

[p i r t] = biseccion(f,0,1,1e-8,100)

fp = @(p) (0.02./(1-0.02)).*((2.*p)./(2+0.02)).^(1/2) - 0.04

graphFunction(fp,0,4,100,'b-')

[pp ip rp tp] = biseccion(f,-0.05,1,1e-2,100)


