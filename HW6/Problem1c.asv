f = @(t,y) (1+2*t)*sqrt(y);
fprime = matlabFunction(diff(f,sym('t')));
dt = .25;
t=0:dt:2;
y(1)=1;

%Euler's
for n=1:length(t)-1
    y(n+1)=y(n)+dt*f(t(n), y(n));
end
plot(t,y,'.');
hold on;

%Taylor
for n=1:length(t)-1
    y(n+1) = y(n) + dt*f(t(n),y(n)) + (dt^2)/2 * fprime(y(n));
end
plot(t,y,'*');

%Midpoint
for n = 1:length(t)
    if n < length(t)
        k1 = f(t(n), y(n));
        k2 = f(t(n) + dx/2, y(n) + k1*dx/2);
        y(n+1) = y(n) + k2*dx;
    end
end
plot(t,y,'o');

f = @(t) (t./2 + (t.^2)./2 + 1).^2;
plot(t, f(t));