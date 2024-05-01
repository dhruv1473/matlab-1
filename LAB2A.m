
x = -5:1:5;
y1 = x - x .* 2;
y2 = x.^3;
y3 = exp(x);
y = sin(x).*cos(x);

plot(x, y1, x, y2, x, y3, x, y);
xlabel('x');
ylabel('y');
title('Range from -5 to 5')

