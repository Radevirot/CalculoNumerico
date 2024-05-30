clear all; clc ; format long
f = @(x) 3.*(x+0.5).*(sin((x-2.7)./2)).^4 %Función
df = @(x) 3.*(sin((x-2.7)./2)).^4 + 6.*(x+0.5).* (sin((x-2.7)./2)).^3 .*cos((x-2.7)./2) %Derivada
x1 = linspace(0,2.4,11); %Puntos
y1 = f(x1);
df1 = df(0);
df2 = df(2.4);
S = funcion_spline(x1,y1,df1,df2);
radio_1m_sp = S(1)
err_abs = abs(f(1) - radio_1m_sp) %Error abs
err_rel = abs(f(1) - radio_1m_sp)/abs(f(1)) %Error rel

fA = @(x) 2.*pi.*f(x).*sqrt(1+(df(x).^2))

%esta función duplica el tamaño del intervalo por cada iteración
%hasta encontrar un L que reduzca el error entre dos iteraciones
%sucesivas a la tolerancia solicitada.
[Q L] = cuad_gauss_c_iterativo(fA,0,2.4,2,3,1e-6,100) %ans = 23.35702591814466

