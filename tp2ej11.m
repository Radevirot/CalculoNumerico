
A = [1 1+0.5e-15 3 ; 2 2 20 ; 3 6 4]

disp('sin pivoteo')
[Asp Lsp Usp] = doolittle_v(A);

Residualsp = A - Lsp * Usp

disp('con pivoteo')
[Acp, r, Lcp, Ucp, P, Z, Z1] = doolittle_p(A);

Residualcp = Z - Z1



