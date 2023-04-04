function [n] = Find_n(ak, bk, l)
%Calculates the minimum n condition, which serves the Bisection Method with the use of its derivative.
n = 1;
    while (1/2)^n >=(l/(bk-ak))
    n = n + 1;
    end
end

