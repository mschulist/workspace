tspan = [0.1 5]; % Avoid x = 0 to prevent division by zero

% Define solution curves y(x) = kx for different k values
k_values = [0.5, 1, 2, 0, -0.5]; % Different constants of integration
t = linspace(tspan(1), tspan(2), 100); % x values for plotting solutions

% Create a grid for the direction field
a = 0.1; % Time range start
b = 5;   % Time range end
s = 0.5; % Spacing for the grid
[x, y] = meshgrid(a:s:b, -5:2:5); % Grid for x and y values

% Compute the vector field
dy = y ./ x; % Right-hand side of the ODE
dx = ones(size(dy)); % x increment is 1
norm = sqrt(dx.^2 + dy.^2); % Normalize the vectors
dx = dx ./ norm;
dy = dy ./ norm;

% Plot the solutions and the direction field
figure;
hold on;
for k = k_values
    plot(t, k * t, '-o', 'DisplayName', sprintf('x(t) = %.1ft', k)); % Solution curves
end
quiver(x, y, dx, dy, 0.5, 'DisplayName', 'Slope Field'); % Direction field

% Add labels, legend, and title
xlabel('t');
ylabel('x(t)');
title("Solutions of tx' = x with Slope Field");
legend('show');
grid on;
hold off;
