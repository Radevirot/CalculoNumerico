#Esta función hace lo mismo que sust_atras1 pero de forma más eficiente, ya
#que opera directamente con vectores y ahorra un bucle for completo al hacerlo.

function x=sust_atras_v(A)
x=A(:,end); %el vector de incógnitas es un vector columna
n=length(x); %necesitamos n (tamaño de la matriz) para
             %recorrerla de atrás hacia adelante

x(n)=A(n,n+1)/A(n,n); %calculo el último elemento del vector
                      %de términos independientes, ya que dicha
                      %ecuación solo tiene una incógnita (Xn)


for i = n-1:-1:1 %for que recorre la matriz desde la penúltima fila
                 %hasta la primera (n-1 porque n es el último
                 %renglón, cuya incógnita calculamos al principio)

  x(i) = ( A(i,n+1) - (  A(i,i+1:n) * x(i+1:n)) )/A(i,i);

  % A(i,n+1) es el término independiente de la fila actual, o sea, b_i
  % A(i,i+1:n) * x(i+1:n) es la operación vectorial que reemplaza el
  % segundo bucle for, realiza un producto punto.

  % El primer factor "A(i,i+1:n)" es un vector FILA que comienza en la columna
  % posterior a la diagonal de la fila actual y acaba donde acaba la matriz.

  % El segundo factor "x(i+1:n)" es un vector COLUMNA que toma únicamente los
  % valores de x que ya están calculados.

  % El resultado del producto punto es idéntico a la resta que se hacía
  % con el bucle for de j.

endfor

