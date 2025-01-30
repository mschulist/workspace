tspan = [0 5];

x0 = 0.001;

[t,x] = ode45(@(t,x) sqrt(x), tspan, x0);

plot(t,x,'-o')