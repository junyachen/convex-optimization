clear all;
close all;
clc;

%问题1
disp('问题1:')
disp('[x y][1 0; 0 2][x;y]')
disp('A=[1 0; 0 2]')
disp('b=[0,0]')
disp('c=0')

%问题2
disp('问题2:')
syms x
syms y
f(x,y)=x.^2+2*y.^2;

%对x一阶偏导
fx=diff(f(x,y),x);
%对y求一阶偏导
fy=diff(f(x,y),y);

%导数fx=0，求x的值
fep=@(x)eval(fx); 
[epx,fxval] = fzero(fep,rand());
epx=roundn(epx,1);

%导数fy=0，求y的值
fep=@(y)eval(fy); 
[epy,fyval] = fzero(fep,rand());
epy=roundn(epy,1);

%对x二阶偏导
fxx=diff(f(x,y),x,2);
%对y求二阶偏导
fyy=diff(f(x,y),y,2);

if fxx>0 && fyy>0
    disp('有局部极小值')
else
    disp('无有局部极小值')
end

%问题3
disp('问题3:')
%从问题1可以知道A，b，c的值
A=[1 0; 0 2];
b=[0,0];
%产生一个1-10的初始值矩阵
%unidrnd(10)
x0=[10,10];
iter=0;
%f(x)的一阶导数
epsilon=1e-5;
a=0.1;
grad=2*x0*A'*A-2*b*A';

while (norm(grad)>epsilon)
   x0=x0-a*grad;
   iter=iter+1;
   grad=2*x0*A'*A-2*b*A';
   %fprintf('iter=%d \n',iter);
   %fprintf('grad=%2.6f \n',norm(grad));
end
fprintf('迭代 iter=%d 后收敛\n',iter);

%问题4
disp('问题4:')
A=[1 0; 0 2];
b=[0;0];
x0=[10;10];
s0=eye(2);
iter=0;
a=0.1;
gk=2*A'*A*x0-2*A'*b;
grad=-s0*gk;
iter=1;
while (norm(grad)>epsilon)
    iter=iter+1;
    %fprintf('迭代 iter=%d \n',iter);
    %fprintf('grad=%f \n',(norm(grad)));
    %算deltak=x(k+1) - xk
    deltak=a*grad;

    %算rk=g(k+1) - gk
    x0=x0+a*grad;
    rk=2*A'*A*x0-2*A'*b-gk;
    gk=2*A'*A*x0-2*A'*b;
    %更新sk
    s0=s0+(1+rk'*s0*rk/(deltak'*rk)) *  (deltak*deltak')/(deltak'*rk) - (deltak*rk'*s0+s0*rk*deltak')/(deltak'*rk);
    grad=-s0*gk;
end
fprintf('迭代 iter=%d 后收敛\n',iter);
fprintf('grad=%f \n',(norm(grad)));


