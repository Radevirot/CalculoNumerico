% Devuelve el radio espectral de la matriz (el máximo del valor abs de sus
% autovalores)

function [p] = spectral_radius(A)
  p = max(abs(eig(A)));

