% Splits input data cell into train (80%), validation (10%) and test (10%) data sets

function [train_data, valid_data, test_data] = split_train_valid_test_data(data)

%random seed
rng(123);

data = data(randperm(size(data, 1)), :);

n_rows = size(data, 1);
n_train = round(n_rows * 0.8);
n_valid = round(n_rows * 0.1);

% splitting data
train_data = data(1:n_train, :);
valid_data = data(n_train+1:n_train+n_valid, :);
test_data = data(n_train+n_valid+1:end, :);

end
