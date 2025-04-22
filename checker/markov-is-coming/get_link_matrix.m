function [Link] = get_link_matrix (Labyrinth)
  [m, n] = size(Labyrinth);
  Link = zeros(m*n+2);
  for i = 1 : m
    for j = 1 : n
      cnt = 0;
      idx = (i - 1) * n + j;
      code = Labyrinth(i, j);

      if ~bitget(code, 4) %sus
        if i == 1
          Link(idx, m * n + 1) = 1;
        else
          Link(idx, idx - n) = 1;
        endif
        cnt = cnt + 1;
      endif

      if ~bitget(code, 3) %jos
        if i == m
          Link(idx, m * n + 1) = 1;
        else
          Link(idx, idx + n) = 1;
        endif
        cnt = cnt + 1;
      endif

      if ~bitget(code, 2) %dreapta
        if j == n
          Link(idx, m * n + 2) = 1;
        else
          Link(idx, idx + 1) = 1;
        endif
        cnt = cnt + 1;
      endif

      if ~bitget(code, 1) %stanga
        if j == 1
          Link(idx, m * n + 2) = 1;
        else
          Link(idx, idx - 1) = 1;
        endif
        cnt = cnt + 1;
      endif
      for k = 1 : m * n + 2
        if(Link(idx, k) == 1)
          Link(idx, k) = 1 ./ cnt;
        endif
      endfor
    endfor
  endfor
  Link(m * n + 1, m * n + 1) = 1;
  Link(m * n + 2, m * n + 2) = 1;
endfunction
