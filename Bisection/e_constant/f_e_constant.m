%Φίλιππος Γερμανόπουλος
%ΑΕΜ:10005
%Lab01

clear;
close all;
clc;
% e is constant
e = 0.001;

% Definition of the 3 objective functions.
syms x;
f1 = @(x) (x-2).^2+ x.*log(x+3);
f2 = @(x) 5.^x + (2- cos(x)).^2;
f3 = @(x) exp(x).*((x.^3) - 1) + (x-1).*sin(x);

for y = [f1(x) f2(x) f3(x)]
    f(x) = y;
    % We assign l a small value at the first repetition of the programm. At
    % the end of each repetition l will grow by 0.01
    l = 0.01;
    %Array where we keep track of the total number of times f1 is called, for
    %each l!
    counter_Array_f = [];
    %Array for the value of l in each repetition
    l_Array_f = []; 
    %to test different values of l
    while l < 0.05
        %Initialization of the variables.
        ak = -1;
        bk = 3;
        % Variable where we keep count of the number of times f1 is called.
        counter_f = 0;
        %Bisector Algorithm
        while bk-ak > l
            [x1_k, x2_k] = Bisector(ak, bk, e);
                if f(x1_k) < f(x2_k)
                    bk = x2_k;
                else 
                    ak = x1_k;
                end   
        %Number of times f was called
        counter_f = counter_f + 2;
        end
        %add new value to the Arrays
        counter_Array_f(end + 1) = counter_f; 
        l_Array_f(end+1) = l;
        l = l + 0.01;
    end
    %Plot all of the necessary values. When the next loop happens and
    %n = n + 1 , then the variables get equalised to zero to store the new
    %values of the next function in them and then plot them etc.
    if y == f1(x)
        subplot(1, 3, 1)
        plot(l_Array_f , counter_Array_f, '--ob' , 'MarkerSize', 3 , 'LineWidth', 2)
        grid on
        xlabel('Value of l' , 'FontSize' , 12)
        ylabel('Calls of Function', 'FontSize', 12)
        title('f1' , 'FontSize' , 15)
    elseif y == f2(x)
        subplot(1, 3, 2)
        plot(l_Array_f , counter_Array_f, '--xb' , 'MarkerSize', 6, 'LineWidth' , 2)
        grid on
        xlabel('Value of l' , 'FontSize' , 12)
        ylabel('Calls of Function', 'FontSize', 12)
        title('f2' , 'FontSize' , 15)
    else
        subplot(1, 3 ,3)
        plot(l_Array_f , counter_Array_f, '--vb', 'MarkerSize', 3, 'LineWidth' , 2)
        grid on
        xlabel('Value of l' , 'FontSize' , 12)
        ylabel('Calls of Function', 'FontSize', 12)
        title('f3' , 'FontSize' , 15)
    end   
end

