%Devuelve la matriz de iteración del método solicitado.

function [itMat] = Tc(A, method, w)

  if (method == 'j')
    itMat = -inv(diag(diag(A)))*(tril(A,-1)+triu(A,1));
  endif
  if (method == 'gs')
    itMat = -inv(tril(A,-1)+diag(diag(A))) * triu(A,1);% -(L+D)^-1 * U
  endif
  if (method == 'sor')
    D = diag(diag(A));
    U = triu(A,1);
    L = tril(A,-1);
    itMat = inv(D - w*L) * ((1-w)*D + w*U)
  endif
  %(D-wL)^-1*((1-w)D+wU)

endfunction


