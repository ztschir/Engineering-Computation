%%%% A and x set in workspace by powerstart
%%%xh=[]; and n=[]; to restart
N=input('# of iterations = ');
xs=[]; del=[ ];  iter=[];rq=[];
for i=1:N
    xo=x;% Previous value of x
    x=A*x;  % New value of Ax  
    del=[del x./xo]; %Ax/x componentwise
    dotxox1 = dot(xo,x)
    dotxoxo = dot(xo,xo)
    rq=[rq dot(xo,x)/dot(xo,xo)]% Raleigh-Quotient
    x=x/norm(x); % Scale x to a unit vector
    iter=[iter i];
    xs=[xs x];
    
end
if isempty(n)
   n=iter;
   Iteration_Number=iter;
else
    n=[n iter+n(end)]; %Stores all values for plotting
    Iteration_Number=iter+n(end);
end
xh=[xh xs];% Stores all values for plotting

% Printing
Iteration_Number;
X_Value=xs
Componentwise_Quotient=del;
Raleigh_Quotient=rq



