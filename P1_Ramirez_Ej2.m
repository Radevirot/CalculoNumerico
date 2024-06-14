% a)

A = [2 2 -1 0 2 ; -2 2 -1 0 2; 1 -2 3 -1 1; 0 1 -2 3 -2 ; 0 -1 -1 -1 3]
b = [-2 0 -1 4 -1]'

x = gauss_v(A,b)

% b)
% Calculamos los radios espectrales de las matrices de iteración de Jacobi y
% Gauss Seidel para la matriz A. Esto nos permitirá saber si los métodos
% iterativos convergen o no.
roTJac = spectral_radius(Tc(A,'Jac')) % Menor a 1, converge.
roTGaS = spectral_radius(Tc(A,'GaS')) % Mayor a 1, no converge.

x0 = [0 0 0 0 0]';

[xJ, itJ, rJ, tJ] = Jacobi(A,b,x0,1000,1e-4);
xJ
itJ

%c)

error_rel_jac_gauss = norm(x-xJ,inf)/norm(x,inf)


