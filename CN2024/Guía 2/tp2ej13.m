function [maxsols, A, b] = tp2ej13(N)
  columnas = [-1*ones(N,1) 2*ones(N,1) -1*ones(N,1)];
  desplazamientos = [-1 0 1];
  A = spdiags(columnas, desplazamientos, N, N);
  A(1,1) = 1;
  A(N,N) = 1;
  A(1,2) = 0;
  A(N,N-1) = 0;

  A = full(A);

  b = zeros(N,1);

  maxsols = zeros(1,10);

  for k=1:10

    for i=2:N-1
      b(i) = 1/(i^k);
    endfor

    x = gauss_v(A,b);
    maxsols(k) = max(x);

  endfor

  k = (1:10);

  semilogy(k,maxsols);

