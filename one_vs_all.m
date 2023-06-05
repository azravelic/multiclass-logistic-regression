% Trains multiple logistic regression classifiers and returns all
% the classifiers in a matrix all_theta, where the i-th row of all_theta
% corresponds to the classifier for label i.
function [all_theta] = one_vs_all(X, y, num_labels, lambda, num_iterations)

    [m n] = size(X);

    all_theta = zeros(num_labels, n + 1);

    % Add ones to the X data matrix.
    %275X1

    X = [ones(m, 1) X];

    for class_index=1:num_labels
        % Convert scalar y to vector with related bit being set to 1.
        y_vector = (y == class_index);
        options = optimset('GradObj', 'on', 'MaxIter', num_iterations);
        initial_theta = zeros(n + 1, 1);
        gradient_function = @(t) gradient_callback(X, y_vector, t, lambda);
        [theta] = fmincg(gradient_function, initial_theta, options);
        theta = theta';
        all_theta(class_index, :) = theta;
    end
end
