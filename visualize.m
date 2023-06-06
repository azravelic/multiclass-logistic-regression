function visualize (train_x, train_y, test_x, test_y, class_names, num_labels)

  X = train_x(:, 2:3);
  lambda = 0.01;
  num_iterations = 60;
  [all_theta] = one_vs_all(X, train_y, num_labels, lambda, num_iterations);

  % get first three rows
  weights1 = all_theta(1,:);
  weights2 = all_theta(2,:);
  weights3 = all_theta(3,:);
  % we have parameters of a model trained on 2 features

  cmap = [1 0 0; 0 1 0; 0 0 1]; % red, green, blue
  colors = cmap(test_y,:);

  g = scatter(test_x(:,2),test_x(:,3),[],colors,'filled');
  xlabel('Culmen length');
  ylabel('Culmen depth');
  title('Decision boundary plot');

  hold on;


  x = [min(test_x(:,2))+std(test_x(:,2)) : max(test_x(:,2))+std(test_x(:,2))];
  y1 = -(weights1(2)*x+weights1(1))/weights1(3);
  plot(x,y1,'Color','r');
  hold on;

  y2 = -(weights2(2)*x+weights2(1))/weights2(3);
  plot(x,y2,'Color','g');
  hold on;

  y3 = -(weights3(2)*x+weights3(1))/weights3(3);

  plot(x,y3,'Color','b');
  hold off;


end


