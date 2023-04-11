%Esta función se encarga de realizar sustitución hacia adelante
%en una matriz que ya sea triangular inferior, y cuyo input
%debe ser la matriz aumentada con el vector de términos independientes.

%Para esto, crea un nuevo vector donde se almacenarán los valores
%del Xn correspondiente a cada renglón. Esta función no modifica
%la matriz original en ningún momento.

function x=sust_adelante1(A)
x=A(:,end); %el vector de incógnitas es un vector columna
n=length(x); %necesitamos n (tamaño de la matriz) para
             %recorrerla hasta el final

x(1)=A(1,n+1)/A(1,1); %calculo el primer elemento del vector
                     %de términos independientes, ya que dicha
                     %ecuación solo tiene una incógnita (X1)

for i = 2:n      %for que recorre la matriz desde la segunda fila
                 %hasta la última (la primera no se tiene en cuenta
                 %porque ya calculamos su incógnita)

s = A(i,n+1); %Aquí nos guardamos en una variable 's' el valor
              %del vector de términos independientes de la fila
              %actual que estamos recorriendo.

for j = i-1:-1:1 %for que recorre EN el renglón actual las columnas DESDE
                 %la anterior a la diagonal HASTA el primer elemento de
                 %dicho renglón de la matriz.

s = s - A(i,j)*x(j); %¿Qué es A(i,j)? Es el valor que corresponde al renglón
                     %actual en la columna actual, que recordemos que sí o sí
                     %está más 'atrás' que la de la diagonal y llega hasta
                     %el principio del renglón.

                     %¿Qué es x(j)? 'x' es el vector de las incógnitas que
                     %ya hemos despejado. Acceder a la posición j en este bucle
                     %hará que siempre nos devuelva obligatoriamente las
                     %incógnitas X que ya hemos calculado.

                     %Entonces, ¿qué hace esta línea? Acumula en s el futuro
                     %valor de la incógnita Xi que se esté calculando, el
                     %cálculo que se realiza puede no parecer obvio, por lo que
                     %se recomienda despejar las incógnitas X1, X2 y X3 de una
                     %matriz genérica ampliada de 3x3 para comprender mejor.

endfor
x(i) = s/A(i,i); %Ahora bien, realizando la recomendación anterior claramente
                 %notamos que siempre acabamos dividiendo por 'a11', 'a22',
                 %'a33', eso es justamente lo que realiza esta última línea.
endfor


