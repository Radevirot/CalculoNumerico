% Este método toma como input una función, los extremos de un intervalo, una
% tolerancia, y la cantidad máxima de iteraciones. Retorna una aproximación de
% la raíz de la función ingresada, la cantidad de iteraciones que le llevó
% encontrarla, el vector de errores por cada iteración, y el tiempo que le
% llevó encontrarla.

% El método de bisección reduce el tamaño del intervalo a la mitad verificando
% que se cumpla que la función evaluada en los extremos difiera de signos (que
% por teorema significa que hay una raíz dentro del intervalo)

% Algunas consideraciones del método de Bisección:
% - Es posible obtener la cantidad de iteraciones necesarias para la
% convergencia, utilizar la función cota_biseccion.
% - Tiene convergencia lineal, por lo que es lento.
% - Siempre converge, es robusto. Se utiliza en conjunto con otros métodos.
% - Es de convergencia global, no importa lo lejos que esté p siempre llegará a él.

function [p, i, h, time] = biseccion(f,a,b,tol,kmax)
  tic();

  if (f(a)*f(b)) > 0
    disp('no se cumple la regla de signos')
    return
  endif

  i=1;
  p_old = b;
  while i<kmax
    if i!=1
       p_old = p;
    endif
    p = a + (b-a)/2;

    %h(i) = abs((b-a)/2); %criterio de parada por tamaño del intervalo
    %h(i) = abs(f(p));    %criterio de parada por evaluación de la función
    h(i) = abs(p - p_old); %criterio de parada absoluto entre iteraciones
    %h(i) = abs(p - p_old)/abs(p); %criterio de parada relativo entre iteraciones

    if h(i) < tol
      disp('cortó por tolerancia')
      time=toc();
      return
    endif

    if f(a)*f(p) > 0
      a = p;
    else
      b = p;
    endif

    i+=1;

  endwhile


  disp("cortó por iteraciones")


  time = toc();

