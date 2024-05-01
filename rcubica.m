function [x] = rcubica(a)

  f = @(x) x.^3 - a;

  it = cota_biseccion(-a,2*a,1e-12);
  it = ceil(it);

  x = biseccion(f, -a, 2*a, 1e-12, it+1);


endfunction
