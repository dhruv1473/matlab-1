
% Define constants
k1 = 10; k2 = 30; k3 = 30; k4 = 10; % Spring constants in N/m
m1 = 1; m2 = 1; m3 = 1; % Masses in kg

% Define displacement vector
x = [0.05; 0.04; 0.03]; % Displacements in meters

% Construct k/m matrix
K_over_M = diag([(k1+k2)/m1, (k2+k3)/m2, (k3+k4)/m3]) - diag(k2/m1*ones(2,1), -1) - diag(k2/m2*ones(2,1), 1);

% Solve for acceleration vector
acceleration = -K_over_M * x;

% Display acceleration of each mass
disp('Acceleration of each mass:');
disp(acceleration);

