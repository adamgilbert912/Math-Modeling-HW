function F = nonlinear_sys2(X)

x = X(1); s = X(2); p = X(3);

y = 0.4;
a = 2.5;
b = 0.15;
d = 0.25;
um = 0.8;
pm = 52;
km = 1.7;
ki = 20;
sf = 10;

u = (um*(1-(p/pm))*s)/(km+s+(s^2/ki));

F = zeros(3,1);
F(1) = -d*x + u*x;
F(2) = d*(sf - s) - (1/y)*u*x;
F(3) = -d*p + (a*u + b)*x;
end