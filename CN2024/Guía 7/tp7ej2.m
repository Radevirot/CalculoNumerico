f = @(t,y) -y+sin(t)+cos(t);
inter = [0 2];
y0 = 0;
L = 20;

for i=1:6
  [~,y] = euler(f,inter,y0,L);
  eulerList(i) = y(L+1);
  [~,y] = rk2(f,inter,y0,L);
  rk2List(i) = y(L+1);
  [~,y] = rk4(f,inter,y0,L);
  rk4List(i) = y(L+1);
  L*=2;
endfor

EulerRk2Rk4 = [eulerList' rk2List' rk4List']
