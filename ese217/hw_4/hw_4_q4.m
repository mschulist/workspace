h = 0.001;  % step size
t = 0:h:10;  % the range of t
x = zeros(size(t)-1);  % blank list for x
x(1) = 25;  % initial x
n = numel(t); 
for i=1:n-1
x(i+1) = x(i) + h * (0.055*x(i) - 0.0001*x(i)^2); %DE
end

x(n)

plot(t, x)
title("h = 1, x_0 = 25")