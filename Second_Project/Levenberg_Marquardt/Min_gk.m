function [minimum_point] = Min_gk(starting_point,e,k,f,grad_f,hessian_f,i)
%This function covers the case where we need to choose a gk in order to
%minimize f(x + d*g)

syms x y;
syms gk;
x_points = (100);
y_points = (100);
f_points = (100);
xk = starting_point;
x = xk(1);
y = xk(2);
x_points = x;
y_points = y;
f_points = f(x,y);

f_grad = subs(grad_f);
f_hessian = subs(hessian_f);    


while norm(f_grad) > e   
    
    parameter = abs(max(eig(f_hessian)));
    Condition = f_hessian + parameter *eye(2);
    
    % Find appropriate μκ(parameter) to have a positive definite Array.
    while det(Condition) <= 0 || Condition(1,1) <= 0
        parameter = parameter + 0.1;
        Condition = f_hessian + parameter *eye(2);
    end
    
    
    dk = -inv(Condition) * f_grad;
    
    %find gk via golden section method.
    g = @(gk) f(xk(1)+gk.*dk(1),(xk(2)+gk.*dk(2)));
    gk = Golden_Search(g,xk);
    
    
    xk = round(double(xk+gk.*dk), 6);
    x = xk(1);
    y = xk(2);
    f_grad = subs(grad_f);
    f_hessian = subs(hessian_f);    
    k = k + 1;
    
  
    x_points(end+1) = x;
    y_points(end+1) = y;
    f_points(end+1) = f(x,y);
end


minimum_point = f(x,y);
x = -6:0.1:6;
y = x';
z = (x.^5).*exp(-(x.^2)-(y.^2));
figure()
surf(x,y,z);
xlabel('x axis')
ylabel('y axis')
zlabel('f(x,y) axis')
colorbar
hold on;
plot3(x_points,y_points,f_points,'.r','markersize',10);
title({['Levenberg-Marquardt with minimization of f(xk+gk*dk)'],[' for starting point (x y) = (' num2str(starting_point') ')']},'Color', 'b');
hold off;
disp('*---Levenberg-Marquardt with minimization of f(x + d*g) ---*\n');
fprintf('\nThe Minimum value of f for starting point (%d,%d) is:\n %5d',starting_point(1), starting_point(2), minimum_point);
fprintf('\n\n Number of iterations: %d',k);
end
    