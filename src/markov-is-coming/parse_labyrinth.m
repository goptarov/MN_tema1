function [Labyrinth] = parse_labyrinth(file_path)
  file = fopen(file_path, "r");
  m = fscanf(file, "%d", 1);
  n = fscanf(file, "%d", 1);
  %primele 2 elemente din fisier, dimensiunile labirintului
  for i = 1 : m
    for j = 1 : n
      Labyrinth(i, j) = fscanf(file, "%d", 1);
      %transforma numarul din binar in decimal.
    endfor
  endfor
  fclose(file);
endfunction
