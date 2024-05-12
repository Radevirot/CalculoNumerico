% Pruebo 40 valores de omega en la matriz y me quedo con el que menor iteraciones
% le lleve resolver el sistema
% Pruebo 200 valores de omega en la matriz de iteración y me quedo con el que
% menor radio espectral genere en la matriz de iteración. (COMENTADO)

function [w] =  wTanteo(A, b, x0, itmax, tol) %wTanteo(A)

  i=1;
  v(i)=0;
  wVec(i)=0;

  for w=0.01:0.01:1.99

    if(spectral_radius(Tc(A,'SOR',w)) < 1)

    [x it r] = SOR(A,b,x0,itmax,tol,w); %en base a iteraciones de SOR

    v(i) = it;
    %v(i) = spectral_radius(Tc(A,'SOR',w)); %en base a radio espectral de itmatrix
    %v(i)
    wVec(i) = w;

    i+=1;

    endif

  endfor

  plot(wVec,v)

  [~, pos] = min(v);
  w = wVec(pos);

  endfunction
