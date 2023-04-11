% Esta función se encarga de realizar eliminación por gauss, dejando la matriz
% en estado de triangular superior para poder posteriormente realizar
% sustitución hacia atrás y calcular el vector de incógnitas.

% El input es una matriz CUADRADA y su vector de términos independientes.

% Retorna el vector de incógnitas.

function [x] = gauss_v(A,b)
  tic();
  n=length(b); % Podemos obtener el tamaño de la matriz midiendo el vector
               % de términos independientes gracias a que esta es cuadrada.

  A=[A b]; % Ampliamos A con el vector de términos independientes.

  % Comienza la eliminación

  for k=1:n-1 % for que recorre desde el pivote actual hasta el penúltimo.

      m = A(k+1:n,k)/A(k,k);
      A(k+1:n,k+1:n+1) =...
      A(k+1:n,k+1:n+1)-m*A(k,k+1:n+1);

      % Para entender bien qué ocurre es recomendable intentar vectorizar
      % el código original por cuenta propia, mirando el apunte brindado por
      % el profesor de práctica, que es de mucha ayuda.

      % La diferencia principal, además de la vectorización en sí, es
      % que no requerimos asignar a los elementos bajo el pivote el valor 0,
      % ya que el algoritmo de sustitución hacia atrás ni siquiera utiliza
      % esos valores.

  endfor

  if (A(n,n)==0)
    disp('no hay sol. unica')
  endif

  x = sust_atras_v(A);
  toc()
