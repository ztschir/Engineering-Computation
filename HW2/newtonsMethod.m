function [root, numIter] = newtonsMethod(f, x0, ep)

%fprintf('n      x       f(x)\n');
syms x;
fprime = matlabFunction(diff(f,x));
n = 1;

while(abs(f(x0)) > ep)
    %fprintf('%d    %4.2f    %4.2f\n', n, x0, f(x0));
    x = x0 - (f(x0)/fprime(x0));
    x0 = x;
    n = n + 1;
end

root = x0;
numIter = n;

