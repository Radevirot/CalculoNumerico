function [P, L] = Lagrange(x,y)
  n = length(x);
  P = zeros(1,n);
  L = zeros(n,n);
  L(:,n) = ones(n,1);

  for i = 1:n
    for j = 1:n-1
      %completar
    endfor
  endfor

