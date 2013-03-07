clc; clear all;
f = @(x)(2*sin(x^2)-x);
a = -.01;
b = 2;
n = 1;
ep = 0.01;
x = (a + b)/2;

i = a:.01:b;
j = 2*sin(i.^2);
k = i;

plot(i,j,'c', i,k,'b');
legend('2*sin(x^2)', 'x');

fprintf('n     a      f(a)      b     f(b)      x       f(x)\n');

while (abs(f(x)) > ep)
    fprintf('%d   %4.2f    %4.2f    %4.2f    %4.2f    %4.2f    %4.2f\n', n,a, f(a), b, f(b), x, f(x));
    x = (a + b)/2;
    if(f(x)*f(a) > 0)
        a = x;
    else
        b = x;
    end
    n = n + 1;
end

root = x;
fprintf('One root is: %4.2f\n', root);


k = [ ];
InitialGuess = -1;
currentRoots = 0;
maxRoots = 4;
    while currentRoots<maxRoots
        if  abs(feval(f,InitialGuess))<=ep,
            root=InitialGuess;
        else
            [root,val,flag] = fzero(f,InitialGuess,ep);
            if flag <= 0
                return
            end
        end
        k=[k,root];
        currentRoots=currentRoots+1;
        InitialGuess=InitialGuess+1;
    end

fprintf('By the fzero function the other roots are:');
disp(k);
fprintf('\n');

%root1 = fzero(sym(f),[a b], ep);
%root2 = fzero(sym(f),[c d], ep);
%fprintf('The symbolic representation of the roots are: %s and %s\n', root1, root2);


