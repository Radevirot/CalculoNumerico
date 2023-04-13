%Revisa si la matriz cumple con la definición de estrictamente diagonal dominante.
function checkEDD(A)
  n = length(A);
  edd = 1;
  for i=1:n
    for j=1:n
      if i!=j
        if abs(A(i,i))<=abs(A(i,j))
          edd = 0;
          break;
        endif
      endif
    endfor
  endfor

  if edd==1
    disp('edd')
  else
    disp('not edd')
  endif

