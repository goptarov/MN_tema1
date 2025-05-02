function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
  Theta = zeros(n, 1);
  i = 1;

  while i <= iter
    prediction = FeatureMatrix * Theta; %vectorul coloana al predictiilor
    err = prediction - Y; %vectorul erorilor
    grad = (FeatureMatrix' *  err) / m;
    Theta = Theta - alpha *  grad;

    i = i + 1;
  endwhile

  Theta = [zeros(1); Theta]; %Adaugam theta0 la inceputul vectorului
end
