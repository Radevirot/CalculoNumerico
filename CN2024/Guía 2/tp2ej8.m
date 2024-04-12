
A1 = [8 4 1 ; 2 6 2 ; 2 4 8]

A2 = [5e-2 5.57e2 -4e-2 ; 1.98 1.94e2 -3e-3 ; 2.74e2 3.11 7.5e-2]

A3 = [1 2 -1 ; 2 4 0 ; 0 1 -1]

b = [1 2 3]'

disp('A1 octave')
x1Octave = A1\b

disp('A1 sin pivoteo')
x1SinPiv = doolittle_v_sol(A1,b)

disp('A1 con pivoteo')
x1ConPiv = doolittle_p_sol(A1,b)


disp('A2 octave')
x2Octave = A2\b

disp('A2 sin pivoteo')
x2SinPiv = doolittle_v_sol(A2,b)

disp('A2 con pivoteo')
x2ConPiv = doolittle_p_sol(A2,b)


disp('A3 octave')
x3Octave = A3\b

disp('A3 sin pivoteo')
x3SinPiv = doolittle_v_sol(A3,b)

disp('A3 con pivoteo')
x3ConPiv = doolittle_p_sol(A3,b)

