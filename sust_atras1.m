%Esta función se encarga de realizar sustitución hacia atrás
%en una matriz que ya sea triangular superior, y cuyo input
%debe ser la matriz aumentada con el vector de términos independientes.

%Para esto, crea un nuevo vector donde se almacenarán los valores
%del Xn correspondiente a cada renglón. Esta función no modifica
%la matriz original en ningún momento.

function x=sust_atras1(A)
x=A(:,end); %el vector de incógnitas es un vector columna
n=length(x); %necesitamos n (tamaño de la matriz) para
             %recorrerla de atrás hacia adelante

x(n)=A(n,n+1)/A(n,n) %calculo el último elemento del vector
                     %de términos independientes, ya que dicha
                     %ecuación solo tiene una incógnita (Xn)

for i = n-1:-1:1 %for que recorre la matriz desde la penúltima fila
                 %hasta la primera (n-1 porque n es el último
                 %renglón, cuya incógnita calculamos al principio)

s = A(i,n+1); %Aquí nos guardamos en una variable 's' el valor
              %del vector de términos independientes de la fila
              %actual que estamos recorriendo.

for j = i+1:n %for que recorre EN el renglón actual las columnas DESDE
              %la que le sigue a la diagonal HASTA el último elemento de
              %dicho renglón de la matriz (sin incluir b).

s = s - A(i,j)*x(j); %¿Qué es A(i,j)? Es el valor que corresponde al renglón
                     %actual en la columna actual, que recordemos que sí o sí
                     %está más 'adelante' que la de la diagonal y llega hasta
                     %el final del renglón.

                     %¿Qué es x(j)? 'x' es el vector de las incógnitas que
                     %ya hemos despejado. Acceder a la posición j en este bucle
                     %hará que siempre nos devuelva obligatoriamente las
                     %incógnitas X que ya hemos calculado. (Recomendable mirar
                     %una ilustración simplificada de una matriz triangular
                     %superior aumentada con b para entender mejor el por qué)

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


