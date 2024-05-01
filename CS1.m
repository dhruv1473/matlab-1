
close all
clc
% Parameters
R = 1*10^-2;         % Radius of the cylinder (meters)
t_final = 3000;           % Total simulation time (seconds)
cp = 2100;    % specific heat
k = 0.5;    %thermal conductivity
rho = 1100; %density
alpha = k/(rho*cp);
heatGeneration = 10000;  % Heat generation term
kinf = 10;  % exterior heat transfer coefficient
Tinf = -196;   % exterior temperature
% Spatial discretization
Nr = 100;         % Number of radial nodes
dr = R / (Nr - 1); % Radial step size
r = 0:dr:R;
% Temporal discretization
Nt = 200000;        % Number of time steps
dt = t_final/(Nt-1);     % Temporal step size
time = 0:dt:t_final;
% Initialize temperature field
u = zeros(Nr, Nt);
% Initial condition
u(:, 1) = -196;  % Initial temperature distribution
% Explicit finite difference scheme
for n = 1:Nt-1
    for i = 2:Nr-1
        % Discretization in radial direction
        du_dr = (u(i+1, n) - u(i-1, n)) / (2 * dr);
        d2u_dr2 = (u(i+1, n) - 2 * u(i, n) + u(i-1, n)) / dr^2;
        
        % Update temperature
        u(i, n+1) = u(i, n) + alpha * dt * (1/r(i) * du_dr + d2u_dr2) + (heatGeneration*dt)/(rho*cp);
        %u(i,n+1) = u(i,n) + alpha * dt * 1/r(i)*((r(i)+dr/2)*(u(i+1,n)-u(i,n)) - (r(i)-dr/2)*(u(i,n)-u(i-1,n)))/dr^2 + (heatGeneration*dt)/(rho*cp);
    end
    % Boundary conditions
    u(1,n+1) = u(2,n+1);
    %u(Nr,n+1) = u(Nr-1,n+1);
    u(Nr,n+1) = u(Nr,n) + alpha * dt * 1/R*(R*(-kinf/k)*(u(Nr,n)-Tinf)-(R-dr/2)*(u(Nr,n)-u(Nr-1,n))/dr)/(dr/2) + (heatGeneration*dt)/(rho*cp); 
    %u(Nr, n+1) = u(Nr-1, n+1);
end
% Plot the temperature distribution over time
figure;
plot(time,u(1,:));
title('1D Cylindrical Heat Equation with Heat Generation');
xlabel('Time (s)');
ylabel('Temperature');
figure;
plot(r,u(:,end));
title('1D Cylindrical Heat Equation with Heat Generation');
xlabel('Position (m)');
ylabel('Temperature');
