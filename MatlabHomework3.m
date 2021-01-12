function MatlabHomework3()

%Problem 1

d = 0.2;

guess = [0.04 0.04 0.04]; %nontrivial

answer = fsolve(@(X)nonlinear_sys2(X),guess)

guess2 = [0 0 0]; %washout

washOutSolution = fsolve(@(X)nonlinear_sys2(X),guess2)

%biomass concentration is 3.6669 g/L, the substrate concentration is 0.8327 g/L,
%and the product concentration is 11.9175 g/L for the non trivial solution

%biomass concentration is 0 g/L, the substrate concentration is 10 g/L,
%and the product concentration is 0 g/L for the washout solution

%Problem 2

y = 0.4;
a = 2.5;
b = 0.15;
um = 0.8;
pm = 52;
km = 1.7;
ki = 20;
d = 0.20;
sf = 10;

syms x s p

u = (um*(1-(p/pm))*s)/(km+s+(s^2/ki));

F1 = -d*x + u*x;
F2 = d*(sf - s) - (1/y)*u*x;
F3 = -d*p + (a*u + b)*x;

J = jacobian([F1,F2,F3],[x,s,p])
A = double(subs(J,{x,s,p},{answer}))
vpa(A*[x-answer(1);s-answer(2);p-answer(3)],3)

lambda = eig(A) %eigenvalues

%Since all the eigenvalues are negative and real the system is locally
%stable around the non-trivial steady state

%Problem 3 and 4

figure(1)
[t, y] = ode45(@(t, X)nonlinear_sys2(X),[0 20], answer);
plot(t, y)
xlabel('Time')
ylabel('Concentration')
title('Dynamic Responses with D = 0.2')
legend('X(t)', 'S(t)', 'P(t)')

%These dynamic responses are expected to look like straight lines because
%the system is at steady state

%Problem 5

figure(2)
[t, y] = ode45(@(t, X)nonlinear_sys3(X), [0 20], answer); %different function using d = 0.15
plot(t,y)
xlabel('Time')
ylabel('Concentration')
title('Dynamic Responses with D = 0.15')
legend('X(t)', 'S(t)', 'P(t)')

figure(3)
[t, y] = ode45(@(t, X)nonlinear_sys4(X), [0 20], answer); %different function using d = 0.25
plot(t,y)
xlabel('Time')
ylabel('Concentration')
title('Dynamic Respones with D = 0.25')
legend('X(t)', 'S(t)', 'P(t)')

%The biomass concentration when d = 0.15 slightly increases in the
%beginning and then becomes constant. The biomass concentration when d =
%0.25 slightly decreases at the beginning and then becomes constant.

end