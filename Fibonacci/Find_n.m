function [n] = Find_n(ak, bk, l)
%Calculates the minimum n condition, which serves the FIbonacci Algorithm.
n = 1;
    while (fibonacci(n))<((bk-ak)/l)
    n = n + 1;
    end
end

