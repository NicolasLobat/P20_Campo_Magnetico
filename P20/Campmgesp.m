function [B] = Campmgesp(D)
%Variables={'a','I','x'}
mu_0 = 4*pi*10^-7;

B= (mu_0*D(2)*D(1)^2)/(2*sqrt((D(1)^2 + D(3)^2)^3));
end

