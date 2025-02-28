h = 0.3333;  % step size
t = 0:h:1;  % the range of t
x = zeros(size(t)-1);  % blank list for x
x(1) = 1;  % initial x
n = numel(t); 
for i=1:n-1
x(i+1) = x(i) + h * x(i); %DE
end

x(n)