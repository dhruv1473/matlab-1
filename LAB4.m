clc;
clear all;

% Input initial parameters
m = 40;
k = 200;

% Converting equations into matrix A 
A = [-2*k/m, k/m; k/m, -2*k/m];

% Finding eigenvalues and eigenvectors
[eigenvectors, eigenvalues] = eig(A);

% Finding frequency and amplitude of the masses
w1 = sqrt(abs(eigenvalues(1,1)));
w2 = sqrt(abs(eigenvalues(2,2)));
A1 = eigenvectors(1,1);
A2 = eigenvectors(1,2);
A3 = eigenvectors(2,1);
A4 = eigenvectors(2,2);

% Generating time array
t = linspace(0, 4, 100);

% Case-1: w = 2.2361
x1 = A1 * sin(w1 * t);
x2 = A2 * sin(w1 * t);

% Case-2: w = 3.8730
x3 = A3 * sin(w2 * t);
x4 = A4 * sin(w2 * t);

% Plotting the movement of masses in the system
subplot(2,2,1); 
plot(t, x1, 'r'); 
xlabel("Time"); 
ylabel("Displacement of mass"); 
title("m1 with w1 freq");

subplot(2,2,2); 
plot(t, x2, 'k'); 
xlabel("Time"); 
ylabel("Displacement of mass"); 
title("m2 with w1 freq");

subplot(2,2,3); 
plot(t, x3, 'r'); 
xlabel("Time"); 
ylabel("Displacement of mass"); 
title("m1 with w2 freq");

subplot(2,2,4); 
plot(t, x4, 'k'); 
xlabel("Time"); 
ylabel("Displacement of mass"); 
title("m2 with w2 freq");

