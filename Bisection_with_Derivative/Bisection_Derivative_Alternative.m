function [k_Array,ak_Array,bk_Array] = Bisection_Derivative_Alternative(ak,bk,f,x,n,k,q,k_Array,ak_Array,bk_Array)

%Bisection_Derivative Method.
    while k ~= n +1
        k_Array(q,k) = k;
        ak_Array(q,k) = ak;
        bk_Array(q,k) = bk;
        %Step 1
        xk = (ak+bk)/2;
        if subs(diff(f(x)),x,xk) == 0
            break;
        elseif subs(diff(f(x)),x,xk) > 0
            %Step 2
            bk = xk;
            %Step 4
            if k == n 
              ak_Array(q,k) = ak;
              bk_Array(q,k) = bk;
              break;
            else
                k =k+1;
                %return to step 1
                continue;
            end
        elseif subs(diff(f(x)),x,xk) < 0
            %Step 3
            ak =xk;
            %Step 4
            if k==n
                ak_Array(q,k) = ak;
                bk_Array(q,k) = bk;
                break;
            else 
                k=k+1;
                %return to step 1
                continue;
            end
        end
    end
end


