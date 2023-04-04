%Φίλιππος Γερμανόπουλος
%ΑΕΜ 10005
%Lab02

clear;
syms x y
f = @(x,y) (x.^5).*exp(-(x.^2)-(y.^2));
figure(1);
fsurf(f,'ShowContours','on');
xlabel('x axis')
ylabel('y axis')
zlabel('f(x,y) axis')
colorbar
e = 0.01;
k = 0;
grad_f = gradient(f, [x,y]);

xy = [0 0; -1 1 ; 1 -1]; 
minimum_point = zeros(3,3);
for i = 1:length(xy)
    starting_point = xy(i,:)';
    
    minimum_point(i,i) = Steady_gk(starting_point,e,k,f,grad_f,i);
    minimum_point(i,i) = Min_gk(starting_point,e,k,f,grad_f,i);
    minimum_point(i,i) = Armijo(starting_point,e,k,f,grad_f,i);
end

