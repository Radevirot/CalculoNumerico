function [p, it, h, time] = biseccion(f,a,b,tol,kmax)
  tic();

  if (f(a)*f(b)) > 0
    disp('no se cumple la regla de signos')
    return
  endif

  i=1;
  p_old = b;
  while i<kmax
    if i!=1
       p_old = p;
    endif
    p = a + (b-a)/2;

    %h(i) = abs((b-a)/2); %criterio de parada por tamaño del intervalo
    %h(i) = abs(f(p));    %criterio de parada por evaluación de la función
    h(i) = abs(p - p_old); %criterio de parada absoluto entre iteraciones
    %h(i) = abs(p - p_old)/abs(p); %criterio de parada relativo entre iteraciones

    if h(i) < tol
      disp('cortó por tolerancia')
      return
    endif

    if f(a)*f(p) > 0
      a = p;
    else
      b = p;
    endif

    i+=1;

  endwhile


  disp("cortó por iteraciones")


  time = toc();

