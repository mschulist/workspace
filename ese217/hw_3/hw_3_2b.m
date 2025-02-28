[x,y] = meshgrid(-4:0.2:4);
dx = x - 6*y;
dy = 14*y - 2*x;
r = ( dx.^2 + dy.^2 ).^0.5;
px = dx./r;
py = dy./r;
quiver(x,y,px,py);

title("plot of x' = x - 6y; y' = 14y - 2x")
xlabel("x")
ylabel("y")