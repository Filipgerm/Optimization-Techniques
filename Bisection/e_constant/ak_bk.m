%Φίλιππος Γερμανόπουλος
%ΑΕΜ:10005
%Lab01

clear;
close all;
clc;
% e is constant
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
    % We assign l a small value at the first repetition of the programm. At
    % the end of each repetition l will grow by 0.01
    l = 0.01;
    %3 variables, to store the values of ak, bk and k 
    % for every l. My while loop will run 4 times, from l=0.01 to l=0.04 so
    % i will initialise the size of the arrays accordingly.
    ak_Array = zeros(4,9);
    bk_Array = zeros(4,9);
    k_Array = zeros(4,9);
    % keeps track of how many times we run the while l < 0.05 loop.This
    % helps us store to the previous 3 Arrays their new values into the
    % correct positions.
    n = 1;
     
    %Different values of l
    while l < 0.05
        %Initialization of the variables.
        ak = -1;
        bk = 3;
        % Variable where we keep count of the number of times f1 is called.
        k = 0;
        %Bisector Algorithm
        while bk-ak > l
            %Number of times loop was run.
            k = k + 1;
            %add new value to the Arrays
            k_Array(n,k) = k;
            ak_Array(n,k) = ak;
            bk_Array(n,k) = bk;       
            [x1_k, x2_k] = Bisector(ak, bk, e);
            % 3 if statements, to check which function we need to use
            if f(x1_k) < f(x2_k)
                bk = x2_k;
            else 
                ak = x1_k;
            end
        end
        
        %Plot the Measurements.
        y = figure('Name', 'Measured Data');
        hold on;
        plot(ak_Array(n,:));
        plot(bk_Array(n,:));
        title(['Limits in each iteration for l = ' num2str(l) '[f_' num2str(d) '(x)]'], 'FontSize', 18)
        xlabel('k', 'FontWeight','bold', 'FontSize', 25)
        ylabel('ak/ bk', 'FontWeight','bold', 'FontSize', 25)
        legend('ak', 'bk', 'FontSize', 18);
        grid on;
        hold off;
       
        n =n + 1; 
        l = l + 0.01;
    end
    d = d + 1 ;
end
    

