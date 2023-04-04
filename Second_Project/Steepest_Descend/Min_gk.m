function [minimum_point] = Min_gk(starting_point,e,k,f,grad_f,i)
%This function covers the case where we need to choose a gk in order to
%minimize f(xk + dk*gk)

syms x y;
syms gk;
x_points = (500);
y_points = (500);
f_points = (500);
xk = starting_point;
x = xk(1);
y = xk(2);

x_points = x;
y_points = y;
f_points = f(x,y);

f_grad = subs(grad_f);


while norm(f_grad) > e
    dk = -f_grad;
    
    %find gk via golden section method.
    g = @(gk) f(xk(1)+gk.*dk(1),(xk(2)+gk.*dk(2)));
    gk = Golden_Search(g,xk);
    
    xk = round(double(xk+gk.*dk), 6);
    x = xk(1);
    y = xk(2);
    f_grad = subs(grad_f);
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
title({['Steepest Descend with minimization of f(xk+gk*dk)'],[' for starting point (x y) = (' num2str(starting_point') ')']},'Color', 'b');
hold off;
disp('*---Steepest Descend with minimization of f(xk+gk*dk)---*\n');
fprintf('\nThe Minimum value of f for starting point (%d,%d) is:\n %5d',starting_point(1), starting_point(2), minimum_point);
fprintf('\n\n Number of iterations: %d',k);
end

    