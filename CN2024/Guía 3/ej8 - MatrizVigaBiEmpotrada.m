function [A, b, x0] = MatrizVigaBiEmpotrada(Nh, L, fj)

  h=L/Nh; %Lo necesito para el vector b.

  % La matriz tiene las columnas 0, 1, Nh-1 y Nh con ceros, y ya se sabe que
  % las soluciones n0, n1, nNh-1 y nNh son 0, por lo que directamente se
  % construirá una matriz con Nh-3 ecuaciones.

  d0 = diag(ones(Nh-3)*6);
  d1 = diag(ones(Nh-4)*-4);
  d2 = diag(ones(Nh-5)*1);

  A = diag(d0) + diag(d1,-1) + diag(d1,1) + diag(d2,-2) + diag(d2,2);
  b = ones(Nh-3,1)*((h^4)*fj);
  x0 = zeros(Nh-3,1);


endfunction
