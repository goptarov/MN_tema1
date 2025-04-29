function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)

  %deoarece putem ignora termenul theta 0, suma din cerinta va deveni
  %doar norma la patrat a FeatureMatrix * Theta - Y(un vector al "punctelor" apartamentelor)
  m = size(FeatureMatrix, 1);
  Theta(1) = [];
  Error = (1/(2*m)) * (norm(FeatureMatrix * Theta - Y)) ^ 2;
end
