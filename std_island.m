% standardize island from cell into cell column using the following mapping

% Torgersen = 1
% Biscoe = 2
% Dream = 3


function cell = std_island(cell)

  for i  = 1:length(cell)
    if (strcmp(cell(i),'Torgersen'))
      cell(i) = 1;
    elseif(strcmp(cell(i),'Biscoe'))
      cell(i) = 2;
    elseif (strcmp(cell(i),'Dream'))
      cell(i) = 3;

    endif
  endfor


end
