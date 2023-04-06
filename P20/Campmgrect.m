function [B] = Campmgrect(D)
%Variables={'I','x'}
mu_0 = 4*pi*10^-7;

B= (mu_0*D(1))/(2*pi* D(2));
end

