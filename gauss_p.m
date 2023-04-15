%Eliminación de gauss con pivoteo parcial, consiste en intercambiar filas para
%evitar pivotes con valores muy pequeños o nulos en las divisiones. Las filas
%no se intercambian físicamente dentro de la matriz, sino que hacemos uso de un
%vector virtual de posiciones 'r', que nos permitirá recorrer las filas de la
%matriz en el orden que dicho vector indique. A este mismo lo modificaremos en
%base a los valores de los pivotes, siempre quedándonos con el mayor valor.

function [x] = gauss_p(A,b)

  n=length(b); %tamaño de la matriz
  A=[A b]; % ampliación de la matriz
  r=1:n; %r es el vector de posiciones, comienza ordenado.
  epsilon=1e-9; %valor de tolerancia

  for k=1:n-1 %recorre los pivotes

    [pivmax,pos] = max(abs(A(r(k:n),k))); %pivmax es el pivote máximo, pos es
                                          %la posición relativa de pivmax desde
                                          %el pivote actual.
    if pivmax<epsilon % si todos los pivotes son muy chiquitos (o 0), cagaste
      disp('Los posibles pivots son CERO')
      break
    endif

    pos = pos+k-1; %ajustamos la posición para que sea global en la matriz, y no
                   %relativa a la posición del pivote actual

    if pos!=k %si el pivote más grande está en otro lado ↓
      r([pos k])= r([k pos]) %intercambiamos las "filas", realmente son las
                             %posiciones dentro del vector de posiciones
    endif

    %por último, realizamos todas las operaciones que se hacían en gauss_v pero
    %siempre que tengamos que recorrer las filas, las recorremos utilizando el
    %vector de posiciones, para que se recorran en el orden que el algoritmo
    %haya encontrado como más eficiente según el tamaño de los pivotes.

    A(r(k+1:n),k) = A(r(k+1:n),k)/A(r(k),k);
    A(r(k+1:n),k+1:n+1) = A(r(k+1:n),k+1:n+1)-...
    A(r(k+1:n),k)*A(r(k),k+1:n+1);

  endfor

  x=sust_atras_v(A(r,:)); %al hacer la sustitución hacia atrás, le pasamos
                          %la matriz con las filas ordenadas de acuerdo a 'r',
                          %de otra forma el algoritmo no daría el resultado
                          %correcto.

