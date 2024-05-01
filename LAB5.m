
% Define the cubic equation as a function f = B(x) x ^ 3 - 4 * x - 9
B = @(x) x^3 - 4*x - 9;

% Define the interval [a, b] where the root lies
a = 2;
b = 3;

% Define the tolerance for the error
acc = 1e-4;

% Initialize the number of iterations
n = 0;

% Check if f(a) and f(b) have opposite signs
if B(a) * B(b) > 0
    disp('No root in the given interval')
else
    % Repeat until the error is less than the tolerance
    while abs(b - a) > acc
        % Increment the number of iterations
        n = n + 1;

        % Find the midpoint of the interval
        c = (a + b) / 2;

        % Check if f(c) is zero
        if B(c) == 0
            break
        end

        % Update interval based on the sign of f(c)
        if B(a) * B(c) < 0
            b = c;
        else
            a = c;
        end
    end

    % Display the root and the number of iterations
    disp(['The root is ', num2str(c)])
    disp(['The number of iterations is ', num2str(n)])
end




