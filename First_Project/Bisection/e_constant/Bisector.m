function [x1_k,x2_k] = Bisector(ak ,bk, e)
    %Calculates the new variables x1k and x2k and a new, 
    %more limited domain (x1k,x2k) is produced in which the solution is to be found. 
    x1_k = (ak + bk)/2 - e;
    x2_k = (ak + bk)/2 + e;
end

