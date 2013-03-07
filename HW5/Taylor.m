function [y t] = Taylor(deFunction, y0, t0, tF, dt)
%syms y; syms t;
%deFunctionPrime = matlabFunction(diff(deFunction, t));
deFunctionPrime = @(y) (-2*.4/45)*y;
t=t0:dt:tF;
y(1)=y0;
for n=1:length(t)-1
    y(n+1) = y(n) + dt*deFunction(y(n)) + (dt^2)/2 * deFunctionPrime(y(n))
end

