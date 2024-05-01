
x = linspace(-2*pi, 2*pi, 150);
y = tan(x);
plot(x, y);
xlim([-2*pi, 2*pi]);
ylim([-10, 10]);
xlabel('x');
ylabel('tan(x)'); % Fixed syntax here
grid on;
title('Plot of tan(x)');
