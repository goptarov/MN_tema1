function [Y, InitialMatrix] = parse_csv_file(file_path)

    %chiar daca cerinta ne spune sa folosim csvread, acesta merge doar cu
    %fisiere csv care contin numai numere. Noi avem si text in csv, asa ca vom
    %citi fisierul normal.
    fid = fopen(file_path, "r");
    head = fgetl(fid); %scapam de prima linie din tabel

    Y = {};
    InitialMatrix = {};

    line = fgetl(fid); %linia 1
    row = 1; %index pentru linii
    while ischar(line)
      field = strsplit(line, ','); %impare linia

      Y{row, 1} = field{1}; %primul element din field(linie) va merge in Y
      InitialMatrix(row, :) = field(2:end); % restul merge in InitialMatrix

      line = fgetl(fid);%trecem la urmatoarea linie
      row = row + 1;
    end

    fclose(fid);
end
