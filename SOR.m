function [x, r, it] = SOR(A,b,x0,maxit,tol,w)
  tic();
  n = length(A(1,:));
  x = x0;
  it = 0;

  while it < maxit
    for i = 1:n
      x(i) = ((1-w)*x0(i+1:n))+(w*(b(i)-A(i,1:i-1)*x(1:i-1)-A(i,i+1:n)*x0(i+1:n))/A(i,i));
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

