% standardizing species from cell into array of numbers using following mapping
% Adelie = 1
% Chinstrap = 2
% Gentoo = 3

% NOTE: This is correct mapping for multi class classification

function cell = std_species(cell)


  for i  = 1:length(cell)
    if (strcmp(cell(i),'Adelie'))
      cell(i) = 1;
    elseif(strcmp(cell(i),'Chinstrap'))
      cell(i) = 2;
    elseif(strcmp(cell(i),'Gentoo'))
      cell(i) = 3;
    endif
  endfor


end
