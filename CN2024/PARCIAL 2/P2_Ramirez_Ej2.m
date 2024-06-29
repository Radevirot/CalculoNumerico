clear all; clc; format long;

g = 9.81; l = 15; m1 = 3; m2 = 1; k = 4;
f = @(t,z) [z(2) ; (-g.*z(1))/l - k.*(z(1)-z(3))/m1 ; z(4) ; (-g.*z(3))/l + k.*(z(1)-z(3))/m2];
t0 = 0 ; tF = 10;
inter = [t0 tF];
z0 = [0 0 0.5 0]';
L0 = 10;

[t, x, L] = iterative_singlepass_firstOrderEDO('rk4',f,inter,z0,L0,1e-6,100);

x(L+1,:)
disp('pos1 | vel1 | pos2 | vel2')

