function [a, b] = g4ej7busqueda(f,kmax)

  it=1;a=1;b=2;

  while it<kmax

    if (f(a)*f(b)) < 0
      disp('encontró')
      return
    endif

    a=b; b=2*b;
    it+=1;
  endwhile

  disp('no encontró')
