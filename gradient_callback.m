% This function is used as a callback function for fminunc and it aggregates
% cost and gradient values.
function [cost, gradients] = gradient_callback(X, y, theta, lambda)

    cost = cost_function(X, y, theta, lambda);
    gradients = gradient_step(X, y, theta, lambda);
end
