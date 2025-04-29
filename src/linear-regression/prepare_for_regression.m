function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
  % InitialMatrix -> the matrix that must be transformed
  [m n] = size(InitialMatrix);
  FeatureMatrix = zeros(m, n + 1);

  for i = 1 : m
    index = 1;
    for j = 1 : n
      if strcmp(InitialMatrix{i, j}, 'yes')
        FeatureMatrix(i, index) = 1;
        index = index + 1;
      elseif strcmp(InitialMatrix{i, j}, 'no')
        FeatureMatrix(i, index) = 0;
        index = index + 1;
      elseif strcmp(InitialMatrix{i, j}, 'furnished')
        FeatureMatrix(i, index) = 0;
        FeatureMatrix(i, index + 1) = 0;
        index = index + 2;
      elseif strcmp(InitialMatrix{i, j}, 'semi-furnished')
        FeatureMatrix(i, index) = 1;
        FeatureMatrix(i, index + 1) = 0;
        index = index + 2;
      elseif strcmp(InitialMatrix{i, j}, 'unfurnished')
        FeatureMatrix(i, index) = 0;
        FeatureMatrix(i, index + 1) = 1;
        index = index + 2;
      else
        FeatureMatrix(i, index) = str2double(InitialMatrix{i, j});
        index = index + 1;
      endif
    endfor
  endfor

  % FeatureMatrix -> the matrix with all training examples

  % TODO: prepare_for_regression implementation
end
