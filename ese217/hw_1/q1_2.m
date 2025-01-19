a = -50;
b = 50;
s = 5;

[x,y] = meshgrid(a:s:b);
dy = sin(x .* y);
norm = sqrt(dy.^2+1^2);
quiver(x, y, ones(size(x))./norm, dy./norm, 0.5)