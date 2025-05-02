function [matrix] = initialize_weights(L_prev, L_next)
  e = sqrt(6) / sqrt(L_prev + L_next);
  matrix = randi([fix(-e + 1) , fix(e - 1)], L_prev + 1, L_next);
  %fix(+-(e-1)) pentru a rotunji spre 0 la cel mai apropiat numar intreg.
end
