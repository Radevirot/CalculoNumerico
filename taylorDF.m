

function [coef] = taylorDF(puntos, k)
  if(length(puntos) <= k)
    sprintf('Faltan puntos para aproximar el operador de orden %i',k)
    coef = NaN;
  else
    syms h;
    N=length(puntos);
    M=zeros(N)*h;
    M(1,:)=1;
    for i=2:N
      M(i,:) = ((puntos*h).^(i-1))./factorial(i-1);
    endfor
    b=zeros(N,1);
    b(k+1)=1;
    coef=M\b;
  end
end
