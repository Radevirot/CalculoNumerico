% Revisa si la matriz es simétrica y si todos sus autovalores son positivos.
function checkSDP(A,showeig=0)
  l = eig(A);
  if showeig==1
  l
  endif
  if l > 0
    if A == A'
      disp('sdp')
    else
      disp('not sdp')
    endif
  endif

