function [y, A, b] = tp2ej7_12(N)
  columnas = [-1*ones(N,1) 2*ones(N,1) -1*ones(N,1)];
  desplazamientos = [-1 0 1];
  A = spdiags(columnas, desplazamientos, N, N);
  A(1,1) = 1;
  A(N,N) = 1;
  A(1,2) = 0;
  A(N,N-1) = 0;

  A = full(A);

  b = zeros(N,1);

  for i=2:N-1
    b(i) = 1/(i^2);
  endfor

  y = doolittle_p_sol(A,b);

  x = linspace(0,1,N);

  plot(x,y)

