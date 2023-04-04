function [k_Array,ak_Array,bk_Array] = Fibonacci_Alternative(ak, bk, f ,x1_k, x2_k, e, n, k, q, k_Array, ak_Array, bk_Array)
%The Fibonacci Algorithm search returns the limits and the repetition.
Proceed = true;
       
    while (Proceed)
        ak_Array(q,k) = ak;
        bk_Array(q,k) = bk;
        k_Array(q,k) = k;
        %Step 1
        if f(x1_k) > f(x2_k)
            %Step 2
            ak = x1_k;
            x1_k = x2_k;
            x2_k = ak + (fibonacci(n-k-1)/fibonacci(n-k)) * (bk - ak) ;
            if k == n - 2
                %Step 5
                x2_k = x1_k + e;
                if f(x1_k) > f(x2_k)
                    ak = x1_k ;
                    ak_Array(q,k) = ak;
                    bk_Array(q,k) = bk;
                    %The algorithm ends.
                    Proceed = false;
                    break;
                else
                    bk = x2_k;
                    ak_Array(q,k) = ak;
                    bk_Array(q,k) = bk;
                    %The algorithm ends.
                    Proceed = false;
                    break;
                end
            else
                %Step 4
                k = k + 1;
                %go to step 1
                continue ;
            end
        %Case where f(x1_k) < f(x2_k)
        elseif f(x1_k) <= f(x2_k)
            %Step 3
            bk = x2_k;
            x2_k = x1_k;
            x1_k =  ak + (fibonacci(n-k-2)/fibonacci(n-k)) * (bk - ak) ;
            if k == n - 2
                %Step 5
                x2_k = x1_k + e;
                if f(x1_k) > f(x2_k)
                    ak = x1_k ;
                    ak_Array(q,k) = ak;
                    bk_Array(q,k) = bk;
                    %The algorithm ends.
                    Proceed = false;
                    break;
                else
                    bk = x2_k;
                    ak_Array(q,k) = ak;
                    bk_Array(q,k) = bk;
                    %The algorithm ends.
                    Proceed = false;
                    break;
                end
            else
                %Step 4
                k = k + 1;
                %go to step 1
                continue ;
            end
        end  
    end
end

