function [A] = tp2ej7(N)
  columnas = [-1*ones(N,1) 2*ones(N,1) -1*ones(N,1)];
  desplazamientos = [-1 0 1];
  A = spdiags(columnas, desplazamientos, N, N);
  A(1,1) = 1;
  A(N,N) = 1;
  A(1,2) = 0;
  A(N,N-1) = 0;

  A = full(A);

