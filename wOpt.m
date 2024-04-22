%Devuelve el omega óptimo para SOR, utilizar sólo si la matriz A es EDD y banda.
%Si no lo es, encontrarlo por tanteo con un for y una gráfica.
function [w] = wOpt(A)

  w = 2/sqrt(1-spectral_radius(Tc(A,'j'))

endfunction


