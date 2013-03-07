function [root, numIter] = falsePosition(f, a, b, ep)

%fprintf('n     a      f(a)      b     f(b)      x       f(x)\n');
n = 1;
x = (a*f(b)-b*f(a))/(f(b)-f(a));
while (abs(f(x)) > ep)
    x = (a*f(b)-b*f(a))/(f(b)-f(a));
    %fprintf('%d   %4.2f    %4.2f    %4.2f    %4.2f    %4.2f    %4.2f\n', n,a, f(a), b, f(b), x, f(x));
    
    if(f(x)*f(a) > 0)
        a = x;
    else
        b = x;
    end
    n = n + 1;
end

root = x;
numIter = n;
