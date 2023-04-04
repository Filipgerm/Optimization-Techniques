function [counter_f] = Fibonacci(ak,bk,counter_f,x1_k,x2_k,k,n,f,e)
%The Fibonacci Algorithm is implemented here, to return the number of times
%each function was called.
Proceed = true;
          
    while (Proceed)
        %The implementation for the first function.
        %Step 1
        if f(x1_k) > f(x2_k)
            counter_f = counter_f + 2;
            %Step 2
            ak = x1_k;
            x1_k = x2_k;
            x2_k = ak + (fibonacci(n-k-1)/fibonacci(n-k)) * (bk - ak) ;
            if k == n - 2
                %Step 5
                x2_k = x1_k + e;
                if f(x1_k) > f(x2_k)
                    counter_f = counter_f + 2;
                    ak = x1_k ;
                    %The algorithm ends.
                    Proceed = false;
                    break;
                else
                    counter_f = counter_f + 2;
                    bk = x2_k;
                    %The algorithm ends.
                    Proceed = false;
                    break;
                end
            else
                %Step 4
                k = k + 1;
                %go to step 1
                continue;
            end
        %Case where f1(x1_k) <= f1(x2_k)
        else
            counter_f = counter_f + 2;
            %Step 3
            bk = x2_k;
            x2_k = x1_k;
            x1_k =  ak + (fibonacci(n-k-2)/fibonacci(n-k)) * (bk - ak) ;
            if k == n - 2
                %Step 5
                x2_k = x1_k + e;
                if f(x1_k) > f(x2_k)
                    counter_f = counter_f + 2;
                    ak = x1_k ;
                    %The algorithm ends.
                    Proceed = false;
                    break;
                else
                    counter_f = counter_f + 2;
                    bk = x2_k;
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

