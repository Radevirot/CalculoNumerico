function [Q, L, it, h, t] = intNCcompuesta_iterativo(f,a,b,L0,n,tol,kmax)
  tic();
  % Pide una función, el valor de la integral definida desde a hasta b de la función,
  % el intervalo a-b de integración, una cantidad de sub_intervalos inicial, el
  % grado del polinomio interpolante (2 = trapecio, 3 = simpson), una tolerancia y
  % una cantidad máxima de iteraciones.

  i=1;
  Q0 = intNCcompuesta(f,a,b,L0,n);
  L = L0*2;
  while i<kmax

    Q = intNCcompuesta(f,a,b,L,n);

    h(i) = norm((Q - Q0),inf); %criterio de parada absoluto entre iteraciones
    %h(i) = abs(Q - Q0)/abs(Q); %criterio de parada relativo entre iteraciones

    if h(i) < tol
      disp('cortó por tolerancia')
      t=toc();
      return
    endif

    Q0=Q;
    L*=2;
    i+=1;

  endwhile
  L/=2;
  disp("cortó por iteraciones")
  t = toc();


endfunction
