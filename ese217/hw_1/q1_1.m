a = -10;
b = 10;
s = 1;

[x,y] = meshgrid(a:s:b);
dy = 1/20 * (x.^2 + 2*y.^2);
norm = sqrt(dy.^2+1^2);
quiver(x, y, ones(size(x))./norm, dy./norm, 0.5 )