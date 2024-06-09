function [t, y, L, i, h] = iterative_singlepass_firstOrderEDO(method,f,inter,y0,L0,tol,kmax)

  %compara con la iteración anterior

  i=1;

  switch (method)
    case 'eul'
      [t,y] = euler(f,inter,y0,L0);
    case 'rk2'
      [t,y] = rk2(f,inter,y0,L0);
    case 'rk4'
      [t,y] = rk4(f,inter,y0,L0);
    otherwise
      error('eul, rk2 o rk4 son los posibles métodos.')
  endswitch
  y_prev = y(L0+1,1);
  L = L0*2;

  while i<kmax

    switch (method)
      case 'eul'
        [t,y] = euler(f,inter,y0,L);
      case 'rk2'
        [t,y] = rk2(f,inter,y0,L);
      case 'rk4'
        [t,y] = rk4(f,inter,y0,L);
      otherwise
        error('eul, rk2 o rk4 son los posibles métodos.')
    endswitch
    y_actual = y(L+1,1);


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
