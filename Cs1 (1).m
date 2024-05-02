% Parameters
L = 1;              % Length of the slab
N = 50;             % Number of spatial grid points
T = 10;              % Total simulation time
alpha = 0.01;       % Thermal diffusivity
dx = L / (N - 1);   % Spatial step size
dt = 0.001;         % Time step size
nt = ceil(T / dt);  % Number of time steps

% Initial temperature distribution
u0 = zeros(N, 1);   % Initial temperature array
u0(1) = 100;        % Initial temperature at left boundary

% Finite difference scheme
u = u0;
for i = 1:nt
    un = u;
    for j = 2:N-1
        u(j) = un(j) + alpha * dt / dx^2 * (un(j+1) - 2*un(j) + un(j-1));
    end
end

% Plotting
x = linspace(0, L, N);
plot(x, u);
xlabel('Position');
ylabel('Temperature');
title('Temperature Distribution in a 1D Slab');