function F = nonlinear_sys(X,P)
X1 = X(1); X2 = X(2); y1 = X(3); y2 = X(4);

Psat1 = 12.92; %psat 1
Psat2 = 405.3; %psat 2
G12 = 0.0835;
G21 = 0.9361;

F(1) = P - X1*y1*Psat1 - X2*y2*Psat2;
F(2) = X1 + X2 - 1;
F(3) = log(y1) + log(X1 + X2*G12) - X2*((G12/(X1 + X2*G12)) - (G21/(X2 + X1*G21)));
F(4) = log(y2) + log(X2 + X1*G21) - X1*((G12/(X1 + X2*G12)) - (G21/(X2 + X1*G21)));

end