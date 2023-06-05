% Predict the label for a trained one-vs-all classifier
function p = one_vs_all_predict(all_theta, X)
    m = size(X, 1);
    num_labels = size(all_theta, 1);

    p = zeros(size(X, 1), 1);
    X = [ones(m, 1) X];

    % Calculate probabilities of each number for each input example.
    h = sigmoid(X * all_theta');

    % Finding the highest predicted probability for each row and the row index with highest probability since we are predicting indices
    [p_vals, p] = max(h, [], 2);
end
