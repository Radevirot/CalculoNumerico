function [p] = biseccion(g,p0,tol,kmax)
  i=1

  while i<kmax

    p = g(p0);

    if abs(p-p0) < tol     #corte por tamaño del intervalo
      break;
    endif

    p0=p;

    i+=1

  endwhile

  disp("No converge en kmax iteraciones")

