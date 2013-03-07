f = @(x) x.*cos(3*x);
a = -1;
b = 5;
ep = 0.01;
[root, numIter] = bisection(f, a, b, ep);

fprintf('It took %d iterations to find the root %4.2f\n', numIter, root);

k = [ ];
InitialGuess = -1;
currentRoots = 0;
maxRoots = 7;
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

f = @(x) 2.*cos(3*x);
i = -1:0.01:5;
plot(i,f(i),'c',i,0,'b');
legend('2*cos(3x)', '0');