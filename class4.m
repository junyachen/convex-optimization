%问题1：反证法证明凸函数局部最优解就是全局最优解
%假设凸函数局部最优解不是全局最优解
%f(x)是凸函数，x1，x2是俩个局部最优解，则
%俩点的连线存在一个点theta，使得f(theta*x1+(1-theta)*x2) > theta*f(x1)+(1+theta)*f(x2)
%与根据凸函数的定义，f(theta*x1+(1-theta)*x2) <= theta*f(x1)+(1+theta)*f(x2)，不符
%所以凸函数局部最优就是全局最优

%问题2：
%minimize 1/2 * ||Ax-b||的平方
%subject to 1<=x<=u

%解：目标函数展开等于 1/2*x'*A'*A*x-b'*A*x+1/2*b'*b
%所以 P=A'*A, c'=-b'*A, d=1/2*b'*b
%G=[1,0;0,1], h=[-1;u]

%原问题可以转为QP问题
%minumize: 1/2*x'*P*x+c'*x+d
%subject to: G*x<=h

