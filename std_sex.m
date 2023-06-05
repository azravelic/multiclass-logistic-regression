% standardizing sex from cell into array of numbers using following mapping
% MALE = 1
% FEMALE = 2
% Missing value (NA or any other) = Random value of either 1 or 2 with 50% probability for each sex


function cell  = std_sex(cell)

  for i  = 1:length(cell)
    if (strcmp(cell(i),'MALE'))
      cell(i) = 1;
    elseif(strcmp(cell(i),'FEMALE'))
      cell(i) = 2;
    elseif (strcmp(cell(i), 'NA') || strcmp(cell(i), '.'))
      cell(i) = randi([1, 2]);
    else
      cell(i) = 0;
    endif
  endfor

end
