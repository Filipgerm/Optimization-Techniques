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
e = 0.001;
%e = 0.01;
k = 0;
grad_f = gradient(f, [x,y]);

xy = [2 4];
gamma = [0.1 0.3 3 5];

minimum_point = zeros(1,length(gamma));
for i = 1:length(gamma)
    %starting_point = xy(i,:)';
    fprintf("\nGAMMA = %.2f\n", gamma(i));
    starting_point = xy';
    minimum_point(1,i) = Steady_gk(starting_point,e,k,f,grad_f,gamma(i));
end

