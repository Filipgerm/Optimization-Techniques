%Φίλιππος Γερμανόπουλος
%ΑΕΜ 10005
%Lab02

clear;
clc;
close all;

syms x y
f = @(x,y) 1/3*x.^2 + 3*y.^2;
figure(1);
fsurf(f,'ShowContours','on');
xlabel('x axis')
ylabel('y axis')
zlabel('f(x,y) axis')
colorbar

e = 0.01;
k = 0;
grad_f = gradient(f, [x,y]);
gk = [0.5 0.1 0.2];


% x1[-10 5], x2[-8 12]
area_one = [-10 -8];
area_two = [5 12];
sk = [5 15 0.1];

xy = [5 -5; -5 10; 8 -10];
minimum_point = zeros(1, length(xy));

for i = 1:length(xy)
    starting_point = xy(i,:)';
    fprintf("\n[============= Iteration #%d =============] \n", i);
    fprintf("\nEPSILON = %.2f\n", e);
    fprintf("\nGAMMA = %.2f\n", gk(i));
    fprintf("\nSTARTING POINT = (%.2f, %.2f)\n", xy(i, 1), xy(i,2));
    fprintf("\nSK = %.1f\n", sk(i));
    
    minimum_point = Steady_gk(starting_point,e,k,f,grad_f,i,gk(i),sk(i),area_one,area_two);
    
end