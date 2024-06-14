function [Q, L, it, h, t] = cuad_gauss_c_iterativo(f,a,b,L0,n,tol,kmax)
  tic();

  i=1;
  Q0 = cuad_gauss_c(f,a,b,L0,n);
  L = L0*2;
  while i<kmax

    Q = cuad_gauss_c(f,a,b,L,n);

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

  disp("cortó por iteraciones")
  t = toc();


endfunction
