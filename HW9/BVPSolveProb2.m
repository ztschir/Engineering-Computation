function [A]=BVPSolve(k,c,b,f,valL,valR,dt,L,matshow,linetype)
%BVPSolve: Solves second order boundary value problems
%    [x,u]=BVPSolve(k,c,b,f,valL,valR,dt,L,matshow)
%Input:
%   k=coefficient of u''
%   c=coefficient of u'
%   b=coefficient of u
%   f=f(x) handle for right hand side calculation
%   valL= boundary value at Left end
%   valR= boundary value at Right end
%   dt=time step
%   L=Length of body in 1-d
%   matshow > 0 will print the matrix problem
%   linetype=line type for plotting (optional)
%Output:
%   x=row array of nodes in the x-direction
%   u=column array of solutions at the nodes.
    
z = 1;
for p = [0 12.5 70 700]
    dt = dt * (1/z);
nn=fix(L/dt)+1;  %Number of nodes
A=eye(nn);
x=[0:dt:L]';   % nodes in the x-direction
for i=2:nn-1   % create FD matrix
    A(i,i-1)=k-.5*dt*c(i,p);
    A(i,i)=-2*k+dt^2*b(i);
    A(i,i+1)=k+.5*dt*c(i,p);
    F(i)=dt^2*f(x(i));  % uses anonymous(handle) function f
end
F(1)=valL; % set BC
F(nn)=valR;
if(matshow>0)  %Print matrix problem?
    A;
    F;
end
u=A\F';
if nargin==10
    plot(x,u,linetype);  
    hold on;

else
plot(x,u);
hold on;

end
z = z + 1;
end
end
