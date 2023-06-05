% Finds optimal theta parameters using fminunc
function [theta, J, exit_flag] = gradient_descent(X, y, theta, lambda)

    options = optimset('GradObj', 'on', 'MaxIter', 400);
    [theta, J, exit_flag] = fminunc(@(t)(gradient_callback(X, y, t, lambda)), theta, options);

end
