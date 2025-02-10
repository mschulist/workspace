[x,y] = meshgrid(0:0.25:10);
dx = 14*x - 2*x.^2 - x.*y;
dy = 16*y - 2*y.^2 - x.*y;
r = ( dx.^2 + dy.^2 ).^0.5;
px = dx./r;
py = dy./r;
quiver(x,y,px,py);