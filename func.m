function [T, grad] = func(v)
%优化目标函数func
    global n
    global det_L
    global v0
    V = 1:n;
    V(1) = (v0+v(1))/2;
    for i=2:n
        V(i)=(v(i)+v(i-1))/2;
    end
    
    grad = (1:n)'; %梯度
    for i=1:n-1
        grad(i)= -det_L(i)/(V(i).^2) -det_L(i+1)/(V(i+1).^2);
    end
    grad(n) = -det_L(i)/(V(n).^2);
    
    T = 0;
    for i=1:n
        T = T + det_L(i)/V(i);
    end
end