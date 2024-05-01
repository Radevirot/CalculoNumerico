function [p, it, h, time] = puntofijo(g,p0,tol,kmax)
  tic();
  i=1;

  while i<kmax

    p = g(p0);

    if abs(p-p0) < tol     #corte por tamaño del intervalo
      time = toc();
      return
    endif

    p0=p;

    i+=1;

  endwhile

  if i==kmax
    disp("No converge en kmax iteraciones")
  endif
