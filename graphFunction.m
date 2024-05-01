function graphFunction(f,a,b,dots,graphparameters)

  x = linspace(a,b,dots);
  plot(x,f(x),graphparameters)
  hold on
  grid on
  grid minor

endfunction
