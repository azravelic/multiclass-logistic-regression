% calculate mean value of numbers in the column and replace all NA values with
% that mean value.

% cell - this is cell of the column that contains numbers and NA values
% c - output numeric vector of the column


function cell = handle_nulls_mean(cell)

  len = length(cell);
  a = zeros(len, 1);
  for i = 1:len
    if strcmp(cell{i}, 'NA')
      a(i) = NaN;
    else
      a(i) = cell{i};
    end
  end

  mean_val = mean(a(~isnan(a)));
  a(isnan(a)) = mean_val;
  cell = num2cell(a);

end
