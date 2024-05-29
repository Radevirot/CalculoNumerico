clear all; clc

f1 = @(x) sin(pi.*x)
f2 = @(x) 1./(1+x.^2)

If1_0to5 = 2/pi
If2_m5to5 = 2*atan(5)

disp("Q_n y errores absolutos para f1:")

for n=2:13
  disp("")
  n
  Q = intNCcompuesta(f1,0,5,1,n)
  err_abs = abs(If1_0to5 - Q)
end
disp('')
disp('=========')
disp('')
disp("Q_n y errores absolutos para f2:")
for n=2:13
  disp("")
  n
  Q = intNCcompuesta(f2,-5,5,1,n)
  err_abs = abs(If2_m5to5 - Q)
end

figure(1)
xxx= (linspace(0,5,1000));
hold on; grid on; grid minor;
for n=2:13

  xx = linspace(0,5,n);
  pi = @(x) polyval(Lagrange(xx,(f1(xx))),x);
  plot(xxx,pi(xxx),'b-');

end

plot(xxx,f1(xxx),'r-','linewidth',1.5)


figure(2)
xxx= (linspace(-5,5,1000));
hold on; grid on; grid minor;
for n=2:13

  xx = linspace(-5,5,n);
  pi = @(x) polyval(Lagrange(xx,(f2(xx))),x);
  plot(xxx,pi(xxx),'b-');

end


plot(xxx,f2(xxx),'r-','linewidth',1.5)
