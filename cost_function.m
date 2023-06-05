function [cost] = cost_function(X, y, theta, lambda)

    m = length(y);
    predictions = hypothesis(X, theta);

    % Calculating regularization parameter omitting theta_zero.
    theta_cut = theta(2:end, 1);
    regularization_param = (lambda / (2 * m)) * (theta_cut' * theta_cut);

    cost = (-1 / m) * (y' * log(predictions) + (1 - y)' * log(1 - predictions)) + regularization_param;
end
