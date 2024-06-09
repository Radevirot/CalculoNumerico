function [t, y, L, i, h] = iterative_singlepass_firstOrderEDO_yt(method,f,inter,y0,L0,tol,kmax,yt)

  i=0;
  L = L0;
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


    h(i+1) = abs(yt - y(L+1)); %criterio de parada absoluto entre iteraciones
    %h(i+1) = abs(yt - y(L+1))/abs(yt); %criterio de parada relativo entre iteraciones

    if h(i+1) < tol
      disp('cortó por tolerancia')
      return
    endif

    L*=2;
    i+=1;

  endwhile

  disp("cortó por iteraciones")


endfunction
