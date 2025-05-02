function [X_train, y_train, X_test, y_test] = split_dataset(X, y, percent)
  n = size(y);
  randidx = randperm(n);
  randX = X(randidx, :);
  randy = y(randidx, 1);
  % Example: [X, y] has 1000 training examples with labels and percent = 0.85
  %           -> X_train will have 850 examples
  %           -> X_test will have the other 150 examples
 X_train = randX(1:percent * n, :);
 y_train = randy(1:percent * n, 1);
 X_test = randX(percent * n + 1:end, :);
 y_test = randy(percent * n + 1:end, 1);
end
