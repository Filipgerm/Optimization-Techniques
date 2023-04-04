function [minimum_point] = Steady_gk(starting_point,e,k,f,grad_f,i,gk,sk,area_one,area_two)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

if sk > 0
    
    syms x y;
    x_points = (500);
    y_points = (500);
    f_points = (500);
    xk = starting_point;
    x = xk(1);
    y = xk(2);
    
    max_steps = 1000;
    
    x_points = x;
    y_points = y;
    f_points = f(x,y);
    
    f_grad = subs(grad_f);
    
    xbar = zeros(1, length(xk));
    
    while norm(xk - xbar) > e && k < max_steps    
        
        xbar = xk - sk*f_grad;
        
        for i=1:length(xk)
            
            if xbar(i) <= area_one(i)
                
                xbar(i) = area_one(i);
                
            elseif xbar(i) >= area_two(i)
                
                xbar(i) = area_two(i);
                
            end
            
        end
        
        xk = round(double(xk + gk*(xbar-xk)), 6);
        
        x = xk(1);
        y = xk(2);
        f_grad = subs(grad_f);
        k = k + 1;
        x_points(end+1) = x;
        y_points(end+1) = y;
        f_points(end+1) = f(x,y);
        
    end
        
    minimum_point = f(x,y);
    
    if ~isnan(minimum_point) && k > 1   && ~isnan(f(xk(1), xk(2)))
        
        x = -10:0.5:12;
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
    
    
else
    fprintf("sk must be positive. Try again!");
end

end
