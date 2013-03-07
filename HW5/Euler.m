function [y t] = Euler(deFunction, y0, t0, tF, dt)
t=t0:dt:tF;
y(1)=y0;
for n=1:length(t)-1
    y(n+1)=y(n)+dt*deFunction(y(n), t(n));
end

