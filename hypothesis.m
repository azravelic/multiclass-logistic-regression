function [predictions] = hypothesis(X, theta)

    predictions = sigmoid(X * theta);

end
