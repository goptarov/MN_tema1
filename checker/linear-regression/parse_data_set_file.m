function [Y, InitialMatrix] = parse_data_set_file(file_path)
  file = fopen(file_path, "r");

  words = textscan(file, "%s"); %transformam fisierul de input intr-un vector de celule
  words = words{1};

  m = str2num(words{1});
  n = str2num(words{2});

  Y = zeros(m, 1);
  InitialMatrix = cell(m, n-1);

  index = 3; %pornim de la 3, 1 si 2 fiind numerele m si n.

  for i = 1 : m
      Y(i) = str2double(words{index}); %prima coloana devine vectorul Y
      index = index + 1;
    for j = 1 : n
      InitialMatrix{i, j} = words{index}; %restul fisierului va fi memorat in InitialMatrix.s
      index = index + 1;
    endfor
  endfor
  fclose(file);
end
