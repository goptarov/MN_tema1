function [path] = heuristic_greedy(start_position, probabilities, Adj)
  n = length(Adj);
  visited = false(1, n);
  probabilities(n-1) = 1;
  probabilities(n) = 0;
  path = start_position;
  visited(start_position) = true;

  while !isempty(path)
    pos = path(end, 1);

    if Adj(pos, pos) == 1
      return;
    endif

    neigh = find(Adj(pos, 1 : n) == 1 & !visited);

    if isempty(neigh)
      path(end, 1) = [];
    else
      [~, idx] = max(probabilities(neigh));
      next = neigh(idx);

      visited(next) = true;
      path(end + 1, 1) = next;
    endif
  endwhile
endfunction
