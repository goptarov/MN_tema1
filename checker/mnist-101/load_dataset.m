function [X, y] = load_dataset(path)
  load(path, 'X'); %incarca X
  load(path, 'y'); %incarca y
end
