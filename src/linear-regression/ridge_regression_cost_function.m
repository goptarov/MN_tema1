function [Error] = ridge_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  m = size(FeatureMatrix, 1);
  Theta(1) = [];
  Error = (1/(2*m)) * (norm(FeatureMatrix * Theta - Y)) .^ 2 + lambda * (norm(Theta, 2) .^ 2);
  %norma obisnuita
end
