% Pruebo 40 valores de omega en la matriz y me quedo con el que menor iteraciones
% le lleve resolver el sistema

function [w] = wTanteo(A, b, x0, itmax, tol)

  i=1;
  v(i)=0;
  wVec(i)=0;

  for w=0.05:0.05:1.95

    if(spectral_radius(Tc(A,'SOR',w)) < 1)

    [x it r] = SOR(A,b,x0,itmax,tol,w);

    v(i) = it;
    wVec(i) = w;

    i+=1;

    endif

  endfor

  plot(wVec,v)

  [~, pos] = min(v);
  w = wVec(pos);

  endfunction
