%The function calculates the confusion matrix and main evaluation metrics: accuracy and precision (per each class)

function [confusion, accuracy, precision]  = confusion_matrix(y_true, y_pred, class_names)

num_classes = length(class_names);
confusion = zeros(num_classes);
precision = zeros(num_classes, 1);


for i = 1:num_classes
  for j = 1:num_classes
    confusion(i,j) = sum(y_true == i & y_pred == j);
  end
end


for i = 1:num_classes
    precision(i) = confusion(i,i) / sum(confusion(:,i));
end

disp(confusion);
disp("\nAccuracy: ");
disp(mean(double(y_pred == y_true)) * 100);
disp("\nPrecision for each class: ");
disp(precision);

end


