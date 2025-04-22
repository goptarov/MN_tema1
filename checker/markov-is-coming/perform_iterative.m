function [x, err, steps] = perform_iterative(G, c, x0, tol, max_steps)
  n = length(c);
  x = x0;
  i = 1;
  while i <= max_steps
    x_prev = x;
    x = G * x_prev + c;
    err = norm(x - x_prev);

    if err < tol
      break;
    endif

    i = i + 1;
  endwhile

  steps = i - 1;
endfunction
