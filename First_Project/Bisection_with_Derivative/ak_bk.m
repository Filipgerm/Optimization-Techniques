%Φίλιππος Γερμανόπουλος
%ΑΕΜ:10005
%Lab01

clear;
close all;
clc;
e = 0.001;
%d will be used at the end, during the plot of the measurements to showcase the
%correspondant f
d = 1;

x = linspace(-1, 3);
% Definition of the 3 objective functions.
f1 = @(x) (x-2).^2+ x.*log(x+3);
f2 = @(x) 5.^x + (2- cos(x)).^2;
f3 = @(x) exp(x).*((x.^3) - 1) + (x-1).*sin(x);

% Plot the functions
functions = figure('Name', 'Initial Functions', 'NumberTitle', 'off');
hold on
plot(x, f1(x));
plot(x, f2(x));
plot(x, f3(x), 'g');
title('Initial Functions graph', 'FontSize', 20);
legend('f_{1}(x)', 'f_{2}(x)', 'f_{3}(x)', 'FontSize', 18, 'Location','Best');
xlabel('x', 'FontSize', 25);
ylabel('f_{i}(x)', 'FontSize', 25);
grid on

syms x;
for y = [f1(x) f2(x) f3(x)]
    f(x) = y;
    l = 0.01;
    %initialization of 3 variables, to store the values of ak, bk and k 
    % for every l. My while loop will run 4 times, from l=0.01 to l=0.04 so
    % i will initialise the size of the arrays accordingly.
    ak_Array = zeros(4,6);
    bk_Array = zeros(4,6);
    k_Array = zeros(4,6);
    % keeps track of how many times we run the while l < 0.05 loop.This
    % helps us store to the previous 3 Arrays their new values into the
    % correct positions.
    q = 1;
    
    while l<0.05
        ak = -1;
        bk = 3;
        %Number of repetitions of the algorithm
        k = 1;
        %Finds n for every different l.
        n = Find_n(ak, bk, l);
        [k_Array,ak_Array,bk_Array] = Bisection_Derivative_Alternative(ak,bk,f,x,n,k,q,k_Array,ak_Array,bk_Array); 
       
        %Plot the Measurements.
        y = figure('Name', 'Measured Data');
        hold on;
        plot(ak_Array(q,:));
        plot(bk_Array(q,:));
        title(['Limits in each iteration for l = ' num2str(l) '[f_' num2str(d) '(x)]'], 'FontSize', 18)
        xlabel('k', 'FontWeight','bold', 'FontSize', 25)
        ylabel('ak/ bk', 'FontWeight','bold', 'FontSize', 25)
        legend('ak', 'bk', 'FontSize', 18);
        grid on;
        hold off;
        
        q = q + 1;
        l = l + 0.01;
    end
    d = d + 1; 
end
    
