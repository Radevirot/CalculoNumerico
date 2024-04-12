function [x1, x2] = baskara(p);
  %Función para calcular raíces de polinomios de grado 2 mediante
  %el método de baskara

  a = p(3);
  b = p(2);
  c = p(1);

  # Cálculo del discriminante
  disc = b^2-4*a*c;

  # Cálculo de raíces
  x1 = (-b+sqrt(disc))/(2*a);
  x2 = (-b-sqrt(disc))/(2*a);

  if (disc>0)
    disp('Las raíces son reales, sus valores son:')
    disp('Raíz 1:'), disp(x1)
    disp('Raíz 2:'), disp(x2)
  elseif (disc==0)
    disp('Las raíces son reales repetidas, el valor es:')
    disp('Raíz:'), disp(x1)
  else
    disp('Las raíces son complejas, sus valores son:')
    disp('Raíz 1:'), disp(x1)
    disp('Raíz 2:'), disp(x2)
  endif



