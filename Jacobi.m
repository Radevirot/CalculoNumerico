function [x, it, r] = Jacobi(A,b,x0,maxit,tol)
  tic();
  n = length(A(1,:));
  x = x0;
  it = 0;

  while it < maxit                  % A = L + D + U → Aj = D + (L+U)
    for i = 1:n                     % x^(k) = D^-1 b - D^-1 (L+U) x^(k-1)
      x(i) =...                     % x^(k)
      (b(i)...                      % b
      -A(i,1:i-1)*x0(1:i-1)...      % L*x^(k-1)
      -A(i,i+1:n)*x0(i+1:n))...     % U*x^(k-1)
      /A(i,i);                      % D^-1 (divide todo por los elementos de diag)
     endfor

     r(it+1) = norm(b-(A*x));

     if r(it+1) < tol
       disp("Cortó por tolerancia")
       break;
     endif

     x0=x;
     it=it+1;

  endwhile

  if it == maxit
    disp("Cortó por iteraciones")
  endif

  toc()

