tspan = [0 5];

x0 = 3;

[t,x] = ode45(@(t,x) x*(2-x) + 0.01 * exp(-x), tspan, x0);

plot(t,x,'-o')