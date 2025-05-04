function [J, grad] = cost_function(params, X, y, lambda, ...
                   input_layer_size, hidden_layer_size, ...
                   output_layer_size)

  % params -> vector containing the weights from the two matrices
  %           Theta1 and Theta2 in an unrolled form (as a column vector)
  % X -> the feature matrix containing the training examples
  % y -> a vector containing the labels (from 1 to 10) for each
  %      training example
  % lambda -> the regularization constant/parameter
  % [input|hidden|output]_layer_size -> the sizes of the three layers

  % J -> the cost function for the current parameters
  % grad -> a column vector with the same length as params
  % These will be used for optimization using fmincg
  m = size(y, 1);
  yMatrix = eye(output_layer_size)(y,:);

  Theta1 = reshape(params(1 : (hidden_layer_size * (input_layer_size + 1))), hidden_layer_size, (input_layer_size + 1));
  Theta2 = reshape(params((1 + hidden_layer_size * (input_layer_size + 1)) : end), output_layer_size, (hidden_layer_size + 1));

  grad1 = zeros(size(Theta1));
  grad2 = zeros(size(Theta2));

  %forward propagation
  a1 = [ones(m, 1) X]; %lucram cu intregile matrice deodata, nu pe randuri, pentru eficienta.
  z2 = a1 * Theta1';
  a2 = sigmoid(z2);
  a2 = [ones(m, 1) a2];
  z3 = a2 * Theta2';
  a3 = sigmoid(z3);

  %functia de cost
  cost = -yMatrix .* log(a3) - (1 - yMatrix) .* log(1 - a3);
  J =  1/m * sum(cost(:));

  %backpropagation
  d3 = a3 - yMatrix;
  D2 = d3' * a2;
  d2 = ((d3 * Theta2) .* (a2 .* (1 - a2)))(:, 2:end);%sigmoid derivat este a2 .* (1 - a2)
  D1 = d2' * a1;
  D2 = d3' * a2;

  %gradientii
  Theta1Reg = [zeros(size(Theta1, 1), 1) Theta1(:, 2:end)];
  Theta2Reg = [zeros(size(Theta2, 1), 1) Theta2(:, 2:end)];
  %obtinem gradientii folosit Theta1 si Theta2 regularizate
  grad1 = (1/m) * D1 + lambda/m * Theta1Reg;
  grad2 = (1/m) * D2 + lambda/m * Theta2Reg;

  %compunere grad si regularizare J
  grad = [grad1(:); grad2(:)];
  J = J + (lambda / (2 * m)) * (sum(sum(Theta1(:, 2:end).^2)) + sum(sum(Theta2(:, 2:end).^2)));
end
