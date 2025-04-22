function [Adj] = get_adjacency_matrix (Labyrinth)
  [m, n] = size(Labyrinth);
  Adj = zeros(m*n+2);
  for i = 1 : m
    for j = 1 : n
      idx = (i - 1) * n + j;
      code = Labyrinth(i, j);

      if ~bitget(code, 4) %sus
        if i == 1
          Adj(idx, m * n + 1) = 1;
        else
          Adj(idx, idx - n) = 1;
        endif
      endif

      if ~bitget(code, 3) %jos
        if i == m
          Adj(idx, m * n + 1) = 1;
        else
          Adj(idx, idx + n) = 1;
        endif
      endif

      if ~bitget(code, 2) %dreapta
        if j == n
          Adj(idx, m * n + 2) = 1;
        else
          Adj(idx, idx + 1) = 1;
        endif
      endif

      if ~bitget(code, 1) %stanga
        if j == 1
          Adj(idx, m * n + 2) = 1;
        else
          Adj(idx, idx - 1) = 1;
        endif
      endif
    endfor
  endfor
  Adj(m * n + 1, m * n + 1) = 1;
  Adj(m * n + 2, m * n + 2) = 1;
endfunction
