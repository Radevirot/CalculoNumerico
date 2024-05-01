function [it] = cota_biseccion(a, b, toler)

  it = log2((abs(b-a))/toler);

endfunction

