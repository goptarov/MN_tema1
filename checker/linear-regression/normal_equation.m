function [Theta] = normal_equation(FeaturesMatrix, Y, tol, iter)
    A = FeaturesMatrix' * FeaturesMatrix;
    b = FeaturesMatrix' * Y;

    n = size(A, 1);
    Theta = zeros(n, 1);
    r = b;
    p = r;
    i = 1;

    while i <= iter
      ap = A * p;
      pap = p' * ap;
      rr = r' * r; %notatii care usureaza scrierea

      if pap <= 0 %Daca A e pozitiv definita, Theta va fi vectorul coloana 0.
        Theta = zeros(n, 1);
        return;
      end

      alpha = rr / pap;
      Theta = Theta + alpha * p;
      r = r - alpha * ap;

      if norm(r) < tol
        break;
      end

      rr_new = r' * r;
      beta = rr_new / rr;
      p = r + beta * p;

      i = i + 1;
    end

    Theta = [zeros(1); Theta]; %Adaugam theta0 la inceputul vectorului Theta.
end

