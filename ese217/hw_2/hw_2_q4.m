a = -10;
b = 10;
s = 1;

[t,x] = meshgrid(a:s:b);
dx = x - t;
norm = sqrt(dx.^2+1^2);

figure;
hold on;

quiver(t, x, ones(size(t))./norm, dx./norm, 0.5)

plot(4,0, ".", MarkerSize=40)

title("Slope field of DE x' = x - t")
xlabel("t")
ylabel("x(t)")


hold off;