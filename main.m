clear;
clc;
pkg load io;
pkg load statistics;

data = csv2cell('penguins_size.csv');
data = data(2:end, :); %removing the first row
species = data(:,1);
data(:, 1) = std_species(data(:, 1));
data(:, 2) = std_island(data(:, 2));
data(:, 3) = handle_nulls_mean(data(:, 3)); %culmen_length
data(:, 4) = handle_nulls_mean(data(:, 4)); %culmen_depth
data(:, 5) = handle_nulls_mean(data(:, 5)); %flipper_length
data(:, 6) = handle_nulls_mean(data(:, 6)); %body_mass
data(:, 7) = std_sex(data(:, 7));

[train, valid, test] = split_train_valid_test_data(data);

save('train.mat', 'train');
save('valid.mat', 'valid');
save('test.mat', 'test');

X = cell2mat(train(:, 2:7));
y = cell2mat(train(:, 1));
num_labels = 3;

valid_x = cell2mat(valid(:, 2:7));
valid_y = cell2mat(valid(:, 1));

test_x = cell2mat(test(:, 2:7));
test_y = cell2mat(test(:, 1));
lambda = 0.03;
num_iterations = 120;

[all_theta] = one_vs_all(X, y, num_labels, lambda, num_iterations);
class_names = {'Adelie', 'Chinstrap', 'Gentoo'};

fprintf('Train data: Predicting...\n')
pred_train = one_vs_all_predict(all_theta, X);
confusion1 = confusion_matrix(y, pred_train, class_names);


fprintf('\nValidation data: Predicting...\n')
pred_valid = one_vs_all_predict(all_theta, valid_x);
confusion2 = confusion_matrix(valid_y, pred_valid, class_names);


input("\nPress Enter to analyse test data if there is no need to adjust hyperparameters...");

fprintf('\nTest data: Predicting...\n')
pred_test = one_vs_all_predict(all_theta, test_x);
confusion3 = confusion_matrix(test_y, pred_test, class_names);
%For the visualisation of the model, the following function can be also used:
%plotConfMat(confusion3, class_names);

visualize(X, y, test_x, test_y, class_names, num_labels);


