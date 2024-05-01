function [p, it, h, time] = newton_raphson(f, df, p0, tol, kmax)
  tic();
  i=1

  while i<kmax

    p = p0-f(p0)/fd(p0);

    %h(i) = abs(f(p));    %criterio de parada por evaluación de la función
    h(i) = abs(p - p0); %criterio de parada absoluto entre iteraciones
    %h(i) = abs(p - p0)/abs(p); %criterio de parada relativo entre iteraciones

    if h(i) < tol
      disp('cortó por tolerancia')
      time = toc();
      return
    endif

    p0=p;
    i+=1;

  endwhile

  disp('cortó por iteraciones')
  time=toc();

endfunction
