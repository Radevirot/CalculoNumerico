clear all; clc; format long;
%sqrt((-a.*sin(t)).^2+(b.*cos(t)).^2)
a = sqrt(1/16);
b = sqrt(1/4);
f = @(t) sqrt((-a.*sin(t)).^2+(b.*cos(t)).^2); %norma 2 de la parametrización
% para que la elipse de una vuelta completa el intervalo debe ser 0, 2*pi

[Q_nc, L] = cuad_gauss_c_iterativo(f,0,2*pi,10,2,1e-10,100)

Q_g = cuad_gauss_c(f,0,2*pi,3,2) % para revisar exactitud
