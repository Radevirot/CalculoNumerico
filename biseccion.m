function [p] = biseccion(f,a,b,tol,kmax)
  i=1

  while i<kmax

    p = a + (b-a)/2;

    if (b-a)/2 < tol     #corte por tamaño del intervalo
    #if f(p) < tol       #corte por evaluación de función
      break;
    endif

    if f(a)*f(p) > 0
      a = p;
    else
      b = p;
    endif

    i+=1

  endwhile

  disp("No converge en kmax iteraciones")

