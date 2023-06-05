% Performs one step of gradient descent for theta parameters.
function [gradients] = gradient_step(X, y, theta, lambda)

    m = length(y);

    gradients = zeros(size(theta));
    predictions = hypothesis(X, theta);

    gradients = (1 / m) * (X' * (predictions - y)) + (lambda / m) * theta;

    % Not regularizing theta_zero.
    gradients(1) = (1 / m) * (X(:, 1)' * (predictions - y));
end
