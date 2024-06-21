function [x, y, L, i, h] = iterative_dif_fin_rob(f,inter,ycd,rob,L0,tol,kmax)

  %compara con la iteración anterior
  % IMPORTANTE: cambiar el índice de y para y_prev e y_actual por el que se solicite,
  % (extremo derecho: end, mitad de la barra: L/2 + 1), tener en cuenta que usando
  % robin, esos dos puntos son los únicos que no van a variar a pesar del cambio de
  % tamaño del intervalo.

  i=1;

  [x y]=dif_fin_rob(f,inter,ycd,rob,L0);
  %y_prev = y(end);
  y_prev = y(L0/2 + 1);

  L = L0*2;

  while i<kmax

    [x y]=dif_fin_rob(f,inter,ycd,rob,L);
    %y_actual = y(end);
    y_actual = y(L/2 + 1);


    h(i+1) = abs(y_actual - y_prev); %criterio de parada absoluto entre iteraciones
    %h(i+1) = norm(y_actual - y_prev,inf))/norm(y_actual,inf); %criterio de parada relativo entre iteraciones

    if h(i+1) < tol
      disp('cortó por tolerancia')
      return
    endif

    y_prev = y_actual;
    L*=2;
    i+=1;

  endwhile
  L/=2;
  disp("cortó por iteraciones")


endfunction
