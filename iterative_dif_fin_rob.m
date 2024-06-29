function [x, y, L, i, h] = iterative_dif_fin_rob(point,f,inter,ycd,rob,L0,tol,kmax)

  %compara con la iteración anterior
  % mid: reduce el error para el punto medio del intervalo | error orden cuadrático
  % end: reduce el error para el punto final del intervalo | error orden cuadrático

  % dya: reduce el error de la derivada en el punto INICIAL del intervalo mediante
  % desarrollo en series de taylor de dos puntos | error orden lineal

  % dyb: reduce el error de la derivada en el punto FINAL del intervalo mediante
  % desarrollo en series de taylor de dos puntos | error orden lineal

  i=1;

  [x y]=dif_fin_rob(f,inter,ycd,rob,L0);
    switch (point)
      case 'mid'
        y_prev = y(L0/2 + 1);
      case 'end'
        y_prev = y(end);
      case 'dya'
        y_prev = (y(2)-y(1))/(x(2)-x(1));
      case 'dyb'
        y_prev = (y(end)-y(end-1))/(x(end)-x(end-1));
      otherwise
        error('las opciones son mid, end, dya o dyb.')
    endswitch

  L = L0*2;

  while i<kmax

    [x y]=dif_fin_rob(f,inter,ycd,rob,L);
    switch (point)
      case 'mid'
        y_actual = y(L0/2 + 1);
      case 'end'
        y_actual = y(end);
      case 'dya'
        y_actual = (y(2)-y(1))/(x(2)-x(1));
      case 'dyb'
        y_actual = (y(end)-y(end-1))/(x(end)-x(end-1));
      otherwise
        error('las opciones son mid, end, dya o dyb.')
    endswitch


    h(i+1) = abs(y_actual - y_prev); %criterio de parada absoluto entre iteraciones
    %h(i+1) = abs(y_actual - y_prev))/abs(y_actual); %criterio de parada relativo entre iteraciones

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
