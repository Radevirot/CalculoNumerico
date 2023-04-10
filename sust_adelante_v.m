function x=sust_adelante_v(A)
x=A(:,end); %necesario para que x sea columna
n=length(x); %definimos n por ser una variable local
x(1) = A(1,n+1)/A(1,1)
for i = 2:n
x(i) = (A(i,n+1) - A(i,1:i-1)*x(1:i-1))/A(i,i)
endfor
