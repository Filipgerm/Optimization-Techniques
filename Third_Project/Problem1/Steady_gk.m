function [minimum_point] = Steady_gk(starting_point,e,k,f,grad_f,gk)
%The choice of gk here is manual.

syms x y;

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

max_steps = 1000;

while norm(f_grad) > e && k < max_steps
    dk = -f_grad;
    xk = round(double(xk+gk.*dk), 6);
    x = xk(1);
    y = xk(2);
    f_grad = subs(grad_f);
    k = k + 1;
    x_points(end+1) = x;
    y_points(end+1) = y;
    f_points(end+1) = f(x,y);
    
end

if k == max_steps
    fprintf("Stopped. Too many steps!");
end

minimum_point = f(x,y);

if ~isnan(minimum_point) && k > 1   && ~isnan(f(xk(1), xk(2)))

x = -6:0.1:6;
y = x';
z = 1/3*x.^2 + 3*y.^2;
figure()
surf(x,y,z);
xlabel('x axis')
ylabel('y axis')
zlabel('f(x,y) axis')
colorbar
hold on;
plot3(x_points,y_points,f_points,'.r','markersize',10);
title({['Steepest Descend with constant gk= ' num2str(gk)],[' for starting point: (x y) = (' num2str(starting_point') ')']},'Color', 'k');
hold off;
disp('*---Steepest Descend with a constant gk---*\n');
fprintf('\nThe Minimum value of f for starting point (%d,%d) is:\n %5d',starting_point(1), starting_point(2), minimum_point);
fprintf('\n\n Number of iterations: %d',k);

else 
    fprintf("\nCannot find minimum. Method does not converge!\n");
end
end
