syms x

y=-5*x^4+11*x^2-2;
w=x^3-4*x+1;
z=x^5-.5;

figure;
ezplot(y,[-1.5,1.5]);
figure;
ezplot(w,[-1.5,1.5]);
figure
ezplot(z,[-1.5,1.5]);