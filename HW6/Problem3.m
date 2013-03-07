clear all; clc;

dt = .1;
t = 0:dt:20;

a1 = @(x1,x2) -3000*x1/12000 + 2400*(x2-x1)/12000;
a2 = @(x1,x2,x3) 2400*(x1-x2)/10000 + 1800*(x3-x2)/10000;
a3 = @(x2,x3) 1800*(x2-x3)/8000;

v1 = matlabFunction(int(a1, sym('t')));
v2 = matlabFunction(int(a2, sym('t')));
v3 = matlabFunction(int(a3, sym('t')));


x1(1) = 0;
x2(1) = 0;
x3(1) = 0;

v1Vec(1) = 1;
v2Vec(1) = 0;
v3Vec(1) = 0;


for n = 1:length(t)-1
    v1Vec(n+1) = v1Vec(n)+dt*a1(x1(n),x2(n));
    v2Vec(n+1) = v2Vec(n)+dt*a2(x1(n),x2(n),x3(n));
    v3Vec(n+1) = v3Vec(n)+dt*a3(x2(n),x3(n));
    
    x1(n+1) = x1(n) + dt*(v1(t(n),x1(n),x2(n)) + v1Vec(n));
    x2(n+1) = x2(n) + dt*(v2(t(n),x1(n),x2(n),x3(n)) + v2Vec(n));
    x3(n+1) = x3(n) + dt*(v3(t(n),x2(n),x3(n)) + v3Vec(n));
end


figure('Name', 'v vs t');
plot(t,v1Vec, t,v2Vec, t,v3Vec);

figure('Name', 'x vs t');
plot(t,x1, t,x2, t,x3);