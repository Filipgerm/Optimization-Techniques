function [counter_f] = Bisection_Derivative(ak,bk,counter_f,f,x,n,k)
%The Bisection with the use of its Derivative is implemented here, to return the number of times
%each function was called.
    while k ~= n +1
        %Step 1
        xk = (ak+bk)/2;
        if subs(diff(f(x)),x,xk) == 0
            counter_f = counter_f +1;
            break;
        elseif subs(diff(f(x)),x,xk) > 0
            %Step 2
            counter_f = counter_f +1;
            bk = xk;
            %Step 4
            if k == n 
                break;
            else
                k =k+1;
                %return to step 1
                continue;
            end
        elseif subs(diff(f(x)),x,xk) < 0
            %Step 3
            counter_f = counter_f +1;
            ak =xk;
            %Step 4
            if k==n
                break;
            else 
               k=k+1;
               %return to step 1
               continue;
            end
        end
    end
end

