function [inference] = Check_Criteria(f, gradf, xk, dk, gk)
        
    check_3 = false;
    check_4 = false;
    
    x = xk(1);
    y = xk(2);
    gradientfx = subs(gradf);

    next_x = round(double(xk + gk.*dk), 4);
    x = next_x(1);
    y = next_x(2);
    next_gradientfx = subs(gradf);

    %for beta = 0.1:0.01:1
    for beta = linspace(0.01,1,50)
        if dk'*next_gradientfx <= beta*dk'*gradientfx
            continue;
        else
            check_3 = true;
            break;
        end
    end
         
    if check_3
        %for alpha = 0.00001:0.0001:beta
        for alpha = linspace(0.00001,beta,50)
            if f(next_x(1), next_x(2)) > f(xk(1), xk(2)) + alpha*gk*dk'*gradientfx
                continue
            else
                check_4 = true;
                break;
            end
        end
    end  
    inference = check_3 && check_4;
end