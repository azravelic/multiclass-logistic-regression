function cell = decode_species(cell)

  for i  = 1:length(cell)
    if (strcmp(cell(i),'1'))
      cell(i) = 'Adelie';
    elseif(strcmp(cell(i),'2'))
      cell(i) = 'Chinstrap';
    elseif(strcmp(cell(i),'3'))
      cell(i) = 'Gentoo';
    endif
  endfor


end
