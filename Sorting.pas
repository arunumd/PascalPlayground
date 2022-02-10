unit Sorting;

interface

  type
    Vector = array of Integer;

  procedure merge(var arr: Vector; l: Integer; m: Integer; r: Integer);

  procedure mergesort(var arr: Vector; l: Integer; r: Integer);

  function partition(var arr: Vector; l: Integer; r: Integer): Integer;

  procedure quicksort(var arr: Vector; l: Integer; r: Integer);

  procedure spawn(var arr: Vector);

  procedure main();

implementation

  procedure merge(var arr: Vector; l: Integer; m: Integer; r: Integer);
    var
      nl, nr, i, j, k: Integer;
      larr, rarr: Vector;
    begin
      nl := m - l + 1;
      nr := r - m;
      Setlength(larr, nl);
      Setlength(rarr, nr);
      for i := 0 to nl - 1 do
        larr[i] := arr[l + i];
      for j := 0 to nr - 1 do
        rarr[j] := arr[m + 1 + j];
      i := 0;
      j := 0;
      k := l;
      while ((i < nl) and (j < nr)) do
        begin
          if (larr[i] <= rarr[j]) then
            begin
              arr[k] := larr[i];
              Inc(i);
            end
          else
            begin
              arr[k] := rarr[j];
              Inc(j);
            end;
          Inc(k);
        end;
      while (i < nl) do
        begin
          arr[k] := larr[i];
          Inc(i);
          Inc(k);
        end;
      while (j < nr) do
        begin
          arr[k] := rarr[j];
          Inc(j);
          Inc(k);
        end;
    end;

  procedure mergesort(var arr: Vector; l: Integer; r: Integer);
    var
      m: Integer;
    begin
      if (l < r) then
        begin
          m := l + Trunc((r - l) / 2);
          mergesort(arr, l, m);
          mergesort(arr, m + 1, r);
          merge(arr, l, m, r);
        end;
    end;

  procedure spawn(var arr: Vector);
    var
      i: Integer;
    begin
      for i := Low(arr) to High(arr) do
        begin
          if (i <> High(arr)) then
            write(arr[i], ' ')
          else
            writeln(arr[i]);
        end;
    end;

  procedure swap(a: PInteger; b: PInteger);
    var
      temp: Integer;
    begin
      temp := a^;
      a^ := b^;
      b^ := temp;
    end;

  function partition(var arr: Vector; l: Integer; r: Integer): Integer;
    var
      pivot, i, j: Integer;
    begin
      pivot := arr[r];
      i := (l - 1);
      for j := l to r - 1 do
        begin
          if (arr[j] <= pivot) then
            begin
              Inc(i);
              swap(@arr[i], @arr[j]);
            end;
        end;
      swap(@arr[i + 1], @arr[r]);
      Result := i + 1;

    end;

  procedure quicksort(var arr: Vector; l: Integer; r: Integer);
    var
      pi: Integer;
    begin
      if (l < r) then
        begin
          pi := Trunc(partition(arr, l, r));
          quicksort(arr, l, pi - 1);
          quicksort(arr, pi + 1, r);
        end;
    end;

  procedure main();
    var
      arr: Vector;
    begin
      Setlength(arr, 8);
      arr := [99, 56, 21, 88, 56, 3, 11, 16];
      writeln('Array before sorting was :');
      spawn(arr);
      mergesort(arr, 0, 7);
      writeln('');
      writeln('Array after merge sorting is :');
      spawn(arr);

      arr := [99, 56, 21, 88, 56, 3, 11, 16];
      writeln('');
      writeln('Array before sorting was :');
      spawn(arr);
      quicksort(arr, 0, 7);
      writeln('');
      writeln('Array after quick sorting is :');
      spawn(arr);
      readln;
    end;

end.
