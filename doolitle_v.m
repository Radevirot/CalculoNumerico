function [L,U] = doolitle_v(A)

  n=length(A(1,:)); % Obtenemos el tamaño de la matriz midiendo una de sus
                    % columnas.

  for k=1:n-1 % for que recorre desde el pivote actual hasta el penúltimo.

      A(k+1:n,k) = A(k+1:n,k)/A(k,k);
      A(k+1:n,k+1:n) =...
      A(k+1:n,k+1:n)-A(k+1:n,k)*A(k,k+1:n);

      % Aquí hacemos exactamente lo mismo que en la eliminación gaussiana, con
      % algunas diferencias:
      % - Al recorrer las columnas, vamos hasta n, porque la matriz no está
      % ampliada.
      % - En vez de guardar los multiplicadores en una variable auxiliar m, los
      % guardamos en la parte inferior de la matriz A, esto formará la futura
      % matriz L, y no afecta en los cálculos ya que no utilizamos la parte
      % inferior de la matriz A para hacer eliminación de gauss.

  endfor

  L = eye(n) + tril(A,-1);
  U = triu(A);

