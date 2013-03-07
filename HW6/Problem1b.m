clear all; clc;
dx = .5;
t = 0:dx:2;
y(1) = 1;
f = @(t,y) (1+2*t)*sqrt(y);
for n = 1:length(t)
    if n < length(t)
        k1 = f(t(n), y(n));
        k2 = f(t(n) + dx/2, y(n) + k1*dx/2);
        y(n+1) = y(n) + k2*dx;
    end
end

plot(t,y,'o');
hold on;

dx = .25;
t = 0:dx:2;
for n = 1:length(t)
    if n < length(t)
        k1 = f(t(n), y(n));
        k2 = f(t(n) + dx/2, y(n) + k1*dx/2);
        y(n+1) = y(n) + k2*dx;
    end
end

plot(t,y,'*');

f = @(t) (t./2 + (t.^2)./2 + 1).^2;
plot(t, f(t));


