#Esta función hace lo mismo que sust_adelante1 pero de forma más eficiente, ya
#que opera directamente con vectores y ahorra un bucle for completo al hacerlo.

function x=sust_adelante_v(A)
x=A(:,end); %el vector de incógnitas es un vector columna

n=length(x); %necesitamos n (tamaño de la matriz) para
             %recorrerla de atrás hacia adelante

x(1)=A(1,n+1)/A(1,1); %calculo el primer elemento del vector
                      %de términos independientes, ya que dicha
                      %ecuación solo tiene una incógnita (X1)


for i = 2:n      %for que recorre la matriz desde la segunda fila
                 %hasta la última (la primera no se tiene en cuenta
                 %porque ya calculamos su incógnita)

  x(i) = ( A(i,n+1) - (  A(i,1:i-1) * x(1:i-1)) )/A(i,i);

  % A(i,n+1) es el término independiente de la fila actual, o sea, b_i
  % A(i,1:i-1) * x(1:i-1) es la operación vectorial que reemplaza el
  % segundo bucle for, realiza un producto punto.

  % El primer factor "A(i,1:i-1)" es un vector FILA que comienza en la columna
  % inicial de la fila actual y acaba en la columna previa a la diagonal.

  % El segundo factor "x(1:i-1)" es un vector COLUMNA que toma únicamente los
  % valores de x que ya están calculados.

  % El resultado del producto punto es idéntico a la resta que se hacía
  % con el bucle for de j.

endfor
