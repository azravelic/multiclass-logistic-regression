function [theta, J, J_history, exit_flag] = logistic_regression_train(X, y, lambda)

    m = size(y, 1);
    n = size(X, 2);
    X = [ones(m, 1), X];
    initial_theta = zeros(n + 1, 1);

    [theta, J, exit_flag] = gradient_descent(X, y, initial_theta, lambda);

    % Record the history of chaning J.
    J_history = zeros(1, 1);
    J_history(1) = cost_function(X, y, initial_theta, lambda);
    J_history(2) = cost_function(X, y, theta, lambda);

end
