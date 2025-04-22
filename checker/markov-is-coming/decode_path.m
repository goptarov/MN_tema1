function [decoded_path] = decode_path (path, lines, cols)
  n = length(path);
  decoded_path = zeros(n, 2);
  for i = 1 : n
    for j = 1 : lines
      for k = 1 : cols
        idx = (j - 1) * cols + k;
        if path(i) == idx
          decoded_path(i, 1) = j;
          decoded_path(i, 2) = k;
        endif
      endfor
    endfor
  endfor
endfunction
