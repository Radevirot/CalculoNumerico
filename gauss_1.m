% Esta función se encarga de realizar eliminación por gauss, dejando la matriz
% en estado de triangular superior para poder posteriormente realizar
% sustitución hacia atrás y calcular el vector de incógnitas.

% El input es una matriz CUADRADA y su vector de términos independientes.

% Retorna el vector de incógnitas.

function [x] = gauss_1(A,b)
  tic();
  n=length(b); % Podemos obtener el tamaño de la matriz midiendo el vector
               % de términos independientes gracias a que esta es cuadrada.

  A=[A b]; % Ampliamos A con el vector de términos independientes.

  % Comienza la eliminación

  for k=1:n-1 % for que recorre desde el pivote actual hasta el penúltimo.
              % ¿Por qué hasta el penúltimo? Porque no necesitamos trabajar
              % sobre el último pivote, ya que no hay ningún valor debajo de él
              % para anular, y ya solo queda un valor en esa fila, que es el
              % de la incógnita Xn, el cuál es despejable fácilmente en el
              % primer paso de la sustitución hacia atrás.

    for i=k+1:n % for que recorre las filas desde la posterior al pivote actual
                % hasta la última.

      m = A(i,k)/A(k,k); % Aquí obtenemos el multiplicador correspondiente a la
                         % fila actual para el pivote en el que estamos.

                         % Usualmente cuando uno aplica Gauss, primero divide
                         % toda la fila actual por el valor del pivote, para que
                         % ese pivote se haga 1 y así poder saber fácilmente
                         % por qué valor multiplicar después a la fila para
                         % restarla a las siguientes y así hacer ceros bajo el pivote.

                         % En cambio, en este código hacemos todo junto, y nunca
                         % hacemos que el pivote dentro de la matriz sea 1. Es
                         % decir, multiplicamos por el valor que actualmente
                         % queremos hacer cero pero al mismo tiempo ese valor
                         % va dividido por el pivote, ya que nunca lo hicimos
                         % valer 1.

      A(i,k)=0; % Hacemos cero el elemento de la fila actual que está en la
                % misma columna que el pivote.
                % Esto es así por una cuestión de ahorrar recorridos
                % innecesarios, de nada nos sirve hacer la resta en donde
                % tenemos asegurado que dará 0.

        for j=k+1:n+1 % Recorremos las columnas de la fila actual, desde la
                      % posición posterior al pivote actual hasta la del
                      % término independiente.

          A(i,j) = A(i,j)-m*A(k,j); % Aquí se hace lo mencionado anteriormente,
                                    % restamos a toda la fila actual la del
                                    % pivote multiplicada por el multiplicador,
                                    % haciendo lo que usualmente haríamos en
                                    % dos operaciones con solamente una.

        endfor
      endfor
  endfor


  if (A(n,n)==0) % Podemos garantizar que si el último pivote es cero luego
                 % de realizar la eliminación, el sistema no tendrá solución
                 % única. (repasar matrices si no se entiende esto...)
    disp('no hay sol. unica')
  endif

  x = sust_atras1(A); % Ahora que la matriz ya es triangular superior podemos
                      % utilizar la función de sustitución hacia atrás para
                      % calcular el vector de incógnitas.
  toc()
