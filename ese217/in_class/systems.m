[x,y] = meshgrid(-4:0.25:4);
dx = y;
dy = -2*x-2*y;
r = ( dx.^2 + dy.^2 ).^0.5;
px = dx./r;
py = dy./r;
quiver(x,y,px,py);