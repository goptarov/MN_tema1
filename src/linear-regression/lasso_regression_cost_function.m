function [Error] = lasso_regression_cost_function(Theta, Y, FeMatrix, lambda)
  m = size(FeMatrix, 1);
  Theta(1) = [];
  Error = (1/m) * (norm(Y - FeMatrix * Theta)) .^ 2 + lambda * norm(Theta, 1);
  %norma e suma valorilor absolute
end
