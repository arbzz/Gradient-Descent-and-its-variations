clc, clearvars, close all

f = @(x1, x2) 100 * (x2 - x1^2)^2 + (x1 - 1)^2;
gradient_f = @(x1, x2) [2 * (200 * x1^3 - 200 * x1 * x2 + x1 - 1); 200 * (x2 - x1^2)];


x0 = [0; 0]; % Initial value
max_iter = 50000; % Max iterations
tol = 1e-8; % stopping norm 

% parameters
alpha = 0.5;
beta = 0.5;

x = x0;
iter = 0;

while norm(gradient_f(x(1), x(2))) > tol && iter < max_iter
    gradient = gradient_f(x(1), x(2));
    
    t = 1;
    while f(x(1) - t * gradient(1), x(2) - t * gradient(2)) > f(x(1), x(2)) - alpha * t * norm(gradient)^2
        t = beta * t;
    end
    
    x = x - t * gradient;
    
    iter = iter + 1;
end

if iter == max_iter
    disp('Reached Max iterations');
else
    disp('Reached solution.');
end

disp(['x1 = ', num2str(x(1)), ', x2 = ', num2str(x(2))]);
