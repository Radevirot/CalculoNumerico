%Armo la matriz:

A = diag(linspace(2,2,40))+diag(linspace(-1,-1,39),1)+diag(linspace(-1,-1,39),-1);

%Armo el vector de términos independientes:

i=(1:40);
b = (1.5*i - 6);
b=b';

%Gauss_v hace referencia al método de eliminación de gauss vectorizado.

x = gauss_v(A,b); %El métodos arroja soluciones sin inconvenientes, por lo que
                  %no se considera necesario el pivoteo.

%Para los métodos iterativos creo el vector de incógnitas iniciales.
x0 = linspace(0,0,40)';

w = 1.85;

pT_j = spectral_radius(Tc(A,'Jac'))
pT_gs = spectral_radius(Tc(A,'GaS'))
pT_sor = spectral_radius(Tc(A,'SOR',w))

% Los radios espectrales son todos menores a 1 por lo que converge para todos
% los métodos, sin embargo son cercanos a 1, por lo que probablemente se
% necesite un número alto de iteraciones

[xJ itJ rJ] = Jacobi(A,b,x0,5500,1e-5);
[xGS itGS rGS] = GaussSeidel(A,b,x0,3000,1e-5);
[xSOR itSOR rSOR] = SOR(A,b,x0,500,1e-5,w);

itJ
itGS
itSOR

