function [root, numIter] = bisection(f, a, b, ep)

n = 1;
x = (a + b)/2;
while (abs(f(x)) > ep)
    x = (a + b)/2;
    if(f(x)*f(a) > 0)
        a = x;
    else
        b = x;
    end
    n = n + 1;
end

root = x;
numIter = n;
