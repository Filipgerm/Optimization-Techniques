%Φίλιππος Γερμανόπουλος
%ΑΕΜ:10005
%Lab01
clear;
close all;
clc;
% l is constant
l = 0.01;

% Definition of the 3 objective functions.
syms x;
f1 = @(x) (x-2).^2+ x.*log(x+3);
f2 = @(x) 5.^x + (2- cos(x)).^2;
f3 = @(x) exp(x).*((x.^3) - 1) + (x-1).*sin(x);

%3 loops, each for every function
for y = [f1(x) f2(x) f3(x)]
    f(x) = y;
    % We assign e a small value at the first repetition of the programm. At
    % the end of each repetition e will grow by 0.001
    e = 0.0005;
    %Array where we keep track of the total number of times f1 is called, for
    %each e!
    counter_Array_f = [];
    %Array for the value of e in each repetition
    e_Array_f = [];
    %to test different values of e
    while e < 0.005
        %Initialization of the variables.
        ak = -1;
        bk = 3;
        %Variable where we keep count of the number of times f1 is called.
        counter_f = 0;
        %Bisector Algorithm
        while bk-ak > l
            [x1_k, x2_k] = Bisector(ak, bk, e);
            if f(x1_k) < f(x2_k)
                bk = x2_k;
            else 
                ak = x1_k;
            end
            %Number of times the function was called
            counter_f = counter_f + 2;
        end   
        counter_Array_f(end + 1) = counter_f; 
        e_Array_f(end+1) = e;
        e = e + 0.0005;
    end    
    if y == f1(x)
        subplot(1, 3, 1)
        plot(e_Array_f , counter_Array_f, '--ob','MarkerSize', 3 , 'LineWidth', 2)
        grid on
        xlabel('Value of e' , 'FontSize' , 12)
        ylabel('Calls of Function', 'FontSize', 12)
        title('f1' , 'FontSize' , 15)
    elseif y == f2(x)
        subplot(1, 3 ,2)
        plot(e_Array_f , counter_Array_f, '--xb','MarkerSize', 6 , 'LineWidth', 2)
        grid on
        xlabel('Value of e' , 'FontSize' , 12)
        ylabel('Calls of Function', 'FontSize', 12)
        title('f2' , 'FontSize' , 15)
    else
        subplot(1, 3, 3)
        plot(e_Array_f , counter_Array_f, '--vb','MarkerSize', 3 , 'LineWidth', 2)
        grid on
        xlabel('Value of e' , 'FontSize' , 12)
        ylabel('Calls of Function', 'FontSize', 12)
        title('f3' , 'FontSize' , 15)
    end   
end

