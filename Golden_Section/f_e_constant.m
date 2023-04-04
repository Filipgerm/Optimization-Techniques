%Φίλιππος Γερμανόπουλος
%ΑΕΜ:10005
%Lab01

clear;
close all;
clc;

gr = 0.618;

% Definition of the 3 objective functions.
syms x;
f1 = @(x) (x-2).^2+ x.*log(x+3);
f2 = @(x) 5.^x + (2- cos(x)).^2;
f3 = @(x) exp(x).*((x.^3) - 1) + (x-1).*sin(x);

for y = [f1(x) f2(x) f3(x)]
    f(x) = y;
    l=0.01;
    counter_Array_f = [];
    l_Array_f = [];
    while l < 0.05
        ak = -1;
        bk = 3;
        counter_f = 0;
        %Initialization of x1_k,x2_k by calling the Golden Section
        %function.
        x1_k =ak + (1 - gr) * (bk - ak);
        x2_k = ak + gr * (bk - ak);
        while bk-ak>l
            if f1(x1_k) > f1(x2_k)
                ak = x1_k;
                x1_k = x2_k;
                x2_k = ak + gr * (bk -ak);
            else
                bk = x2_k;
                x2_k = x1_k;
                x1_k = ak + (1 - gr) * (bk - ak);
            end
            counter_f = counter_f + 2;
        end
        counter_Array_f(end + 1) = counter_f;
        l_Array_f(end + 1) = l;
        l = l + 0.01;
    end
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