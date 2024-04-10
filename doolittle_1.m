% Esta función realiza una factorización de Doolittle kij para una matriz cuadrada
% A mediante lazos for anidados, retorna la nueva matriz A modificada
% (L y U dentro de la misma), también retorna L y U por separado.

function [A, L, U] = doolittle_1(A)
  n = length(A(1,:)); % Tamaño de la matriz

  for k=1:n-1 % Desde el primer al penúltimo pivote

    for i=k+1:n % Desde la fila siguiente al pivote hasta la última
      s = A(i,k)/A(k,k); % Obtenemos el multiplicador de la fila y columna
                         % actuales, el primero sería a21/a11.
      A(i,k) = s; % Guardo el multiplicador en la parte inferior correspondiente
                  % de la matriz, el primero se guardaría en a21. Esto permitirá
                  % formar la matriz L posteriormente.

      for j=k+1:n % Desde la columna siguiente al pivote hasta la última

        A(i,j) = A(i,j) - s * A(k,j);

        % Hacemos gauss como ya se hacía anteriormente, esto formará
        % la matriz U dentro de A.

      endfor

    endfor

  endfor

  L = eye(n) + tril(A,-1) % eye para la diagonal de 1s. tril para la diag. inf.
                          % -1 para ignorar la diag original de A
  U = triu(A) % triangular superior de A

  endfunction
